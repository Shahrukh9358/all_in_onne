import 'package:get/get.dart';
import 'package:realproject/screens/dashboard/all_watchlist/index.dart';
import 'package:realproject/screens/dashboard/botton_navgationbar/bottombar3.dart';
import 'package:realproject/screens/dashboard/botton_navgationbar/bottombar4.dart';
import 'package:realproject/screens/dashboard/botton_navgationbar/buttombar2.dart';
import '../screens/authentication/registration_screen.dart';
import '../screens/dashboard/botton_navgationbar/watchlis_home.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/splash_screen.dart';
class AppRoutes {
  static final routes = [
    GetPage(name: '/splash', page: () => SplashScreen()),
    GetPage(name: '/register', page: () => RegistrationScreen()),
    GetPage(name: '/dashboard', page: () => DashboardScreen()),
    GetPage(name: '/watchlist',page: () => WatchlistScreen()),//watchlistName: Get.arguments
    GetPage(name: '/watchlist1', page: () => const WatchlistHome()),
    GetPage(name: '/bottombar2', page: () => const BottomBar2()),
    GetPage(name: '/bottombar3', page: () =>  const BottomBar3()),
    GetPage(name: '/bottombar4', page: () => const BottomBar4()),

  ];
}
