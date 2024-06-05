import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../dashboard_controller.dart';
class DashboardScreen extends StatelessWidget {
  final DashboardController _controller = Get.find<DashboardController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(
            _controller.users.isNotEmpty ? _controller.users[0].fullName : "AppBar"
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
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
                  } catch (e) {
                    print(e);
                  }
                }
              },
              child: const Text('Update your details'),
            ),
            ElevatedButton(
              onPressed: () async {
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
                    await _controller.createWatchlist(watchlistName);
                    Get.toNamed('/watchlis', arguments: watchlistName);
                  } catch (e, s) {
                    log("${e.toString()},${s.toString()}");
                    Get.snackbar('Error', 'Failed to create watchlist.');
                  }
                }
              },
              child: const Text('Create watchlist'),
            ),
          ],
        ),
      ),
    );
  }
}
