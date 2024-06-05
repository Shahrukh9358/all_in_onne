import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/local_database/app_database.dart';
import '../../../data/local_database/user_dao.dart';
class Watchlist extends StatefulWidget {
  final String watchlistName;

  const Watchlist({required this.watchlistName, Key? key}) : super(key: key);

  @override
  State<Watchlist> createState() => _WatchlistState();
}

class _WatchlistState extends State<Watchlist> {
  final UserDao _userDao = Get.find<AppDatabase>().userDao;
  var watchlists = <String>[].obs;

  @override
  void initState() {
    super.initState();
    _loadWatchlists();
  }

  void _loadWatchlists() async {
    int userId = 1; // Replace with actual userId
    var watchlistItems = await _userDao.getWatchlistsForUser(userId);
    setState(() {
      watchlists.value = watchlistItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.watchlistName),
      ),
      body: Center(
        child: Obx(
              () => watchlists.isEmpty
              ? const Text('No watchlists found')
              : ListView.builder(
            itemCount: watchlists.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(watchlists[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}
