import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realproject/screens/dashboard/all_watchlist/watchlist1/watchlis1/index.dart';
import 'package:realproject/screens/dashboard/all_watchlist/watchlist1/watchlist2/index.dart';
import 'package:realproject/screens/dashboard/all_watchlist/watchlist1/watchlist3/index.dart';
import 'package:realproject/screens/dashboard/all_watchlist/watchlist1/watchlist4/index.dart';
import 'package:realproject/screens/dashboard/all_watchlist/watchlist1/watchlist5/index.dart';
import 'package:realproject/screens/dashboard/all_watchlist/watchlist_controller.dart';
import '../../../data/modals/Stocks.dart';

class WatchlistHome extends StatefulWidget {
  const WatchlistHome({Key? key}) : super(key: key);

  @override
  State<WatchlistHome> createState() => _WatchlistHomeState();
}

class _WatchlistHomeState extends State<WatchlistHome> {
  final WatchlistController _watchlistController = Get.find<WatchlistController>();
  final List<Widget> watchlistWidgets = const [
    Watchlist1(),
    Watchlist2(),
    Watchlist3(),
    Watchlist4(),
    Watchlist5()
  ];

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterStocks);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterStocks() {
    final query = _searchController.text.toLowerCase();
    if (query.isNotEmpty) {
      _watchlistController.searchStockByName(query);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _watchlistController.watchlists.length + 1, // +1 for the files tab
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            "Watchlist",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: [
              const Tab(text: 'Watchlist Home'),
              ..._watchlistController.watchlists.map((watchlist) {
                return Tab(text: watchlist.watchlistName);
              }).toList(),
            ],
          ),
        ),
        body: Column(
          children: [
            _buildSearchBar(),
            Expanded(
              child: Obx(() {
                if (_watchlistController.watchlists.isEmpty) {
                  return const Center(child: Text('No watchlists found'));
                }
                return TabBarView(
                  children: [
                    ..._watchlistController.watchlists.asMap().entries.map((entry) {
                      final index = entry.key;
                      return watchlistWidgets[index];
                    }).toList(),
                    _buildStocksListView(_watchlistController),
                  ],
                );
              }),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your add stock functionality here
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            const Icon(Icons.search, color: Colors.grey),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  hintText: 'Search and add',
                  border: InputBorder.none,
                ),
                onSubmitted: (value) {
                  _filterStocks();
                },
              ),
            ),
            const SizedBox(width: 8),
            const Text( '00/100', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildStocksListView(WatchlistController watchlistController) {
    return Obx(() {
      return ListView.builder(
        itemCount: watchlistController.stocks.length,
        itemBuilder: (context, index) {
          final stock = watchlistController.stocks[index];
          return Column(
            children: [
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
                title: Text(
                  stock.companyName ?? '',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  stock.nseSymbol != null ? 'NSE' : stock.bseSymbol != null ? 'BSE' : '',
                  style: const TextStyle(color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${stock.price ?? ''}, ${stock.dayRangeHigh}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      stock.dayRangeHigh != null && stock.dayRangeLow != null
                          ? ((stock.dayRangeHigh! - stock.dayRangeLow!).toString())
                          : '',
                      style: const TextStyle(color: Colors.green),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                onTap: () async {
                  await _watchlistController.addStockToLocalDatabase(stock);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${stock.companyName} added to watchlist')),
                  );
                },
              ),
              Divider(color: Colors.grey[300]),
            ],
          );
        },
      );
    });
  }
}
