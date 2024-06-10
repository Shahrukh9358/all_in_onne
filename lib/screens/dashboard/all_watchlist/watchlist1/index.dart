import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../watchlist_controller.dart';
class Watchlist1 extends StatefulWidget {
  const Watchlist1({super.key});

  @override
  State<Watchlist1> createState() => _Watchlist1State();
}

class _Watchlist1State extends State<Watchlist1> {
  final WatchlistController _watchlistController = Get.find<WatchlistController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Watchlist",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
        Expanded(
          child: Obx(
                () => _watchlistController.watchlists.isEmpty
                ? const Text('No watchlists found') : ListView.builder(
              itemCount: _watchlistController.watchlists.length,
              scrollDirection: Axis.vertical,
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
        )
      ],
    );
  }
}
