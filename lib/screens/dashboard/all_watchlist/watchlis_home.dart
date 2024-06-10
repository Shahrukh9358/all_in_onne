import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realproject/screens/dashboard/all_watchlist/watchlist_controller.dart';
import 'dart:developer';

class WatchlistScreen extends StatelessWidget {
  // final String watchlistName;
  final WatchlistController _watchlistController = Get.put(WatchlistController());
  // WatchlistScreen({required this.watchlistName});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HOME PAGE"),),
        // title: Row(
        //   children: [
        //     // Text(watchlistName),
        //   ],
        // ),

      body: Column(
        children: [
         // const Row(
         //   children: [
         //     TabBar(
         //       tabs: [
         //         Tab(icon: Icon(Icons.directions_car)),
         //         Tab(icon: Icon(Icons.directions_transit)),
         //         Tab(icon: Icon(Icons.directions_bike)),
         //       ],
         //     ),
         //     TabBarView(
         //       children: [
         //         Icon(Icons.directions_car),
         //         Icon(Icons.directions_transit),
         //         Icon(Icons.directions_bike),
         //       ],
         //     ),
         //   ],
         // ),
          Expanded(
            child: Center(
              child: Obx(
                    () => _watchlistController.watchlists.isEmpty
                    ? const Text('No watchlists found') : ListView.builder(
                  itemCount: _watchlistController.watchlists.length,
                  itemBuilder: (context, index) {
                    final watchlist = _watchlistController.watchlists[index];
                    log("data aa rha hai online");
                    return ListTile(
                      title: Container(
                        height: 50,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.yellow
                        ),
                        child: Text(watchlist.watchlistName!),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
            ],
         ),
    );
  }
}
