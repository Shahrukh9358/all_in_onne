import 'package:get/get.dart';
import '../screens/authentication/registration_screen.dart';
import '../screens/dashboard/all_watchlist/watchlis_home.dart';
import '../screens/dashboard/all_watchlist/watchlist2/watchlist_2.dart';
import '../screens/dashboard/all_watchlist/watchlist3/watchlist_3.dart';
import '../screens/dashboard/all_watchlist/watchlist4/watchlist_4.dart';
import '../screens/dashboard/all_watchlist/watchlist5/watchlist_5.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/splash_screen.dart';
class AppRoutes {
  static final routes = [
    GetPage(name: '/splash', page: () => SplashScreen()),
    GetPage(name: '/register', page: () => RegistrationScreen()),
    GetPage(name: '/dashboard', page: () => DashboardScreen()),
    GetPage(name: '/watchlist',page: () => WatchlistScreen()),//watchlistName: Get.arguments
    GetPage(name: '/watchlist2', page: () => const Watchlist2()),
    GetPage(name: '/watchlist3', page: () => const Watchlist3()),
    GetPage(name: '/watchlist4', page: () => const Watchlist4()),
    GetPage(name: '/watchlist5', page: () => const Watchlist5()),

  ];
}
