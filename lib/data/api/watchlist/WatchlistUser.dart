import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:get/get.dart' hide Response, Value;
import 'package:shared_preferences/shared_preferences.dart';
import '../../local_database/db/app_database.dart';
import '../../local_database/watchlist_table/watchlist_dao.dart';
class UserWatchlist {
  final Dio _dio = Get.find<Dio>();
  final WatchlistDao watchlistDao = Get.find<AppDatabase>().watchlistDao;
  final SharedPreferences _prefs = Get.find<SharedPreferences>();

  Future createWatchlist(String watchlistName, int userId) async {
    try {
      String? token = _prefs.getString("ACCESS_TOKEN");
      if (token == null) {
        throw Exception('Token is null');
      }
      log("Token is not null");
      Response response = await _dio.post('/users/watchList/create',
        data: {
          "name": watchlistName,
          "userId": userId,
        },
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      log("Watchlist creation response: ${response.data}");
      final watchlist = WatchlistTableCompanion(
          watchlistName: Value(watchlistName),
          watchlistId: Value(response.data["id"]), // watchlist ki id jo backend se aai hai
          userId: Value(userId),
      );

      log("Inserting watchlist into local database");
      await watchlistDao.insertWatchlist(watchlist);
      log("Watchlist saved in local database");

      // Refresh the watchlists
      // _watchlistController.watchlists.refresh();
    } catch (e, s) {
      log("Error creating watchlist: $e, StackTrace: $s");
      Get.snackbar('Error', 'Failed to create watchlist');
      rethrow;
    }
  }
}
