import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../dashboard_controller.dart';
import 'all_watchlist/watchlist_controller.dart';
class DashboardScreen extends StatelessWidget {
  final DashboardController _controller = Get.find<DashboardController>();
  final WatchlistController _watchlistController = Get.find<WatchlistController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 50,right: 50,top: 200),
        child: Column(
          children: [
          Column(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.blue
                ),
                child:  Image.asset("assets/images/logo.png",height: 300,width: 200,),
              ),
              SizedBox(height: 15,),
              Obx(() {
              if (_controller.users.isNotEmpty) {
                    final user = _controller.users.value.first;
                    return Text(user.fullName,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),);
                  } else {
                    return const Text("user name not found");
                  }
              })
            ],
          ),
           SizedBox(height: 20,),
           SizedBox(
             height: 45,
             width: double.infinity,
             child:  ElevatedButton(
               onPressed: () async {
                 String? newName = await showDialog<String>(
                   context: context,
                   builder: (BuildContext context) {
                     String tempName = "";
                     return AlertDialog(
                       title: const Text("Enter your name"),
                       content: TextFormField(
                         onChanged: (value) {
                           tempName = value;
                         },
                         decoration: const InputDecoration(hintText: "Enter your name"),
                       ),
                       actions: <Widget>[
                         TextButton(
                           onPressed: () => Get.back(result: null),
                           child: const Text('Cancel'),
                         ),
                         TextButton(
                           onPressed: () => Get.back(result: tempName),
                           child: const Text('OK'),
                         ),
                       ],
                     );
                   },
                 );

                 if (newName != null && newName.isNotEmpty) {
                   try {
                     await _controller.updateUser(newName);
                     final updatedUser = _controller.users[0].copyWith(fullName: newName);
                     _controller.users[0] = updatedUser;
                     _controller.update();
                   } catch (e) {
                     Get.snackbar('Error', 'Failed to update user details.');
                     log(e.toString());
                   }
                 }
               },
               child: const Text('Update your details'),
             )
           ),
            SizedBox(height: 10,),
            SizedBox(height: 45,
            width: double.infinity,
              child:ElevatedButton(
                onPressed: () async {
                  // Check if there are already 7 watchlists
                  if (_watchlistController.watchlists.length >= 5) {
                    // Redirect to watchlist screen if there are 7 or more watchlists
                    Get.toNamed('/watchlist');
                  } else {
                    // Show dialog to create a new watchlist
                    final watchlistName = await showDialog<String>(
                      context: context,
                      builder: (BuildContext context) {
                        String tempWatchlistName = "";
                        return AlertDialog(
                          title: const Text("Enter Watchlist Name"),
                          content: TextFormField(
                            onChanged: (value) {
                              tempWatchlistName = value;
                            },
                            decoration: const InputDecoration(hintText: "Watchlist name"),
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Get.back(result: null),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () => Get.back(result: tempWatchlistName),
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );

                    if (watchlistName != null && watchlistName.isNotEmpty) {
                      try {
                        final userId = _controller.users.value.first.id;
                        log("Creating watchlist with name: $watchlistName for user ID: $userId");
                        await _watchlistController.createWatchlist(watchlistName, userId);
                        Get.toNamed('/watchlist', arguments: watchlistName);
                      } catch (e, s) {
                        log("Error creating watchlist: ${e.toString()}, ${s.toString()}");
                        Get.snackbar('Error', 'Failed to create watchlist.');
                      }
                    }
                  }
                },
                child: const Text('Create watchlist'),
              )
            ),
          ],
        ),
      ),
    );
  }
}
