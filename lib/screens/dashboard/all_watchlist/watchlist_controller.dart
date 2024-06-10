import 'dart:developer';
import 'package:get/get.dart'hide value;
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:realproject/data/api/WatchlistUser.dart';
import 'package:realproject/data/local_database/db/app_database.dart';
import 'package:realproject/data/local_database/watchlist_table/watchlist_dao.dart';
class WatchlistController extends GetxController {
  final WatchlistDao _watchlistDao = Get.find<AppDatabase>().watchlistDao;
  final UserWatchlist _userWatchlist =  Get.find<UserWatchlist>();
  RxList<WatchlistTableData> watchlists = <WatchlistTableData>[].obs;


  @override
  void onInit() {
    super.onInit();
    _fetchWatchlists();
  }

  void _fetchWatchlists() {
    _watchlistDao.watchAllWatchlists().listen((watchlistItems) {
      log('Stream fetched watchlists: $watchlistItems');
      watchlists.value = watchlistItems;
      print("list me data aa rha hai${watchlists.toString()}");
      log("controller tak value aa rhi hai");
    }).onError((e) {
      log('Error fetching watchlists: $e');

    });
  }

  createWatchlist(String watchlistName, int userId) {
    _userWatchlist.createWatchlist(watchlistName, userId);
  }
}
