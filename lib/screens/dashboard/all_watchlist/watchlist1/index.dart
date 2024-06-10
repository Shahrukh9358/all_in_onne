import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realproject/screens/dashboard/all_watchlist/watchlist1/watchlis1/index.dart';
import 'package:realproject/screens/dashboard/all_watchlist/watchlist1/watchlist2/index.dart';
import 'package:realproject/screens/dashboard/all_watchlist/watchlist1/watchlist3/index.dart';
import 'package:realproject/screens/dashboard/all_watchlist/watchlist1/watchlist4/index.dart';
import 'package:realproject/screens/dashboard/all_watchlist/watchlist1/watchlist5/index.dart';
import 'watchlist_controller.dart';

class WatchlistHome extends StatefulWidget {
  const WatchlistHome({super.key});

  @override
  State<WatchlistHome> createState() => _Watchlist1State();
}

class _Watchlist1State extends State<WatchlistHome> {
  final WatchlistController _watchlistController = Get.find<WatchlistController>();

  // List of watchlist widgets
  final List<Widget> watchlistWidgets = [
    const Watchlist1(),
    const Watchlist2(),
    const Watchlist3(),
    const Watchlist4(),
    const Watchlist5()
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _watchlistController.watchlists.length + 1, // +1 for the files tab
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("Watchlist", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              ..._watchlistController.watchlists.map((watchlist) {
                return Tab(
                  text: watchlist.watchlistName,
                );
              }).toList(),
              Tab(
                text: 'Files',
              ),
            ],
          ),
        ),
        body: Obx(
              () => _watchlistController.watchlists.isEmpty
              ? Center(child: Text('No watchlists found'))
              : TabBarView(
            children: [
              ..._watchlistController.watchlists.asMap().entries.map((entry) {
                final index = entry.key;
                final watchlist = entry.value;
                return watchlistWidgets[index];
              }).toList(),
              // Files tab content
              ListView.builder(
                itemCount: watchlistWidgets.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('File ${index + 1}'),
                    onTap: () {
                      Get.to(() => watchlistWidgets[index]);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
