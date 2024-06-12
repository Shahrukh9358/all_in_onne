import 'package:get/get.dart';
import 'package:realproject/screens/dashboard/all_watchlist/index.dart';
import 'package:realproject/screens/dashboard/all_watchlist/watchlist1/watchlist2/index.dart';
import 'package:realproject/screens/dashboard/all_watchlist/watchlist1/watchlist3/index.dart';
import 'package:realproject/screens/dashboard/botton_navgationbar/bottombar3.dart';
import 'package:realproject/screens/dashboard/botton_navgationbar/bottombar4.dart';
import 'package:realproject/screens/dashboard/botton_navgationbar/buttombar2.dart';
import '../screens/authentication/registration_screen.dart';
import '../screens/dashboard/botton_navgationbar/watchlis_home.dart';
import '../screens/dashboard/all_watchlist/watchlist1/watchlis1/index.dart';
import '../screens/dashboard/all_watchlist/watchlist1/watchlist4/index.dart';
import '../screens/dashboard/all_watchlist/watchlist1/watchlist5/index.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/splash_screen.dart';
class AppRoutes {
  static final routes = [
    GetPage(name: '/splash', page: () => SplashScreen()),
    GetPage(name: '/register', page: () => RegistrationScreen()),
    GetPage(name: '/dashboard', page: () => DashboardScreen()),
    GetPage(name: '/watchlist',page: () => WatchlistScreen()),//watchlistName: Get.arguments
    GetPage(name: '/watchlist1', page: () => const WatchlistHome()),
    GetPage(name: '/watchlist2', page: () => const Watchlist1()),
    GetPage(name: '/watchlist3', page: () => const Watchlist2()),
    GetPage(name: '/watchlist4', page: () => const Watchlist3()),
    GetPage(name: '/watchlist5', page: () => const Watchlist4()),
    GetPage(name: '/watchlist6', page: () => const Watchlist5()),
    GetPage(name: '/bottombar2', page: () => const BottomBar2()),
    GetPage(name: '/bottombar3', page: () =>  const BottomBar3()),
    GetPage(name: '/bottombar4', page: () => const BottomBar4()),

  ];
}
