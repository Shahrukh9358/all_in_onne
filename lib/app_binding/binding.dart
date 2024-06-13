import 'package:get/get.dart';
import 'package:realproject/data/api/stocks/stocks_items.dart';
import 'package:realproject/data/api/stocks/stocks_name.dart';
import 'package:realproject/data/api/watchlist/WatchlistUser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import '../dashboard_controller.dart';
import '../data/local_database/watchlist_table/watchlist_dao.dart';
import '../screens/dashboard/all_watchlist/watchlist_controller.dart';
import '../data/api/authentication/auth_repository.dart';
import '../data/api/update/users_update.dart';
import '../data/local_database/db/app_database.dart';
import '../screens/authentication/auth_controller.dart';
class AppBindings extends Bindings {
  @override
  void dependencies() async {
    // Initialize SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    Get.put<SharedPreferences>(prefs, permanent: true);

    // Initialize Dio
    Dio dio = Dio(BaseOptions(
      baseUrl: "https://e726-103-95-164-62.ngrok-free.app", // Replace with your base URL
    ));
    dio.interceptors.add(LogInterceptor());
    Get.put<Dio>(dio, permanent: true);
    // Initialize AppDatabase
    Get.put<AppDatabase>(AppDatabase(), permanent: true);
    Get.put<WatchlistDao>(WatchlistDao(Get.find<AppDatabase>()), permanent: true);
    Get.put<UserWatchlist>(UserWatchlist(), permanent: true);
    // Initialize Repositories
    Get.put<AuthRepository>(AuthRepository(), permanent: true);
    Get.put<StocksApi>(StocksApi(),permanent: true);
    Get.put<UpdateUser>(UpdateUser(), permanent: true);
    Get.put<SearchName>(SearchName(),permanent: true);
    // Initialize Controllers
   Get.put<DashboardController>(DashboardController(),permanent: true);
    Get.put<WatchlistController>(WatchlistController(), permanent: true);
    Get.put<AuthController>(AuthController(), permanent: true);
  }
}
