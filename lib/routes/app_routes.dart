import 'package:get/get.dart';
import '../screens/authentication/registration_screen.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/dashboard/watchlist/watchlis.dart';
import '../screens/splash_screen.dart';


class AppRoutes {
  static final routes = [
    GetPage(name: '/splash', page: () => SplashScreen()),
    GetPage(name: '/register', page: () => RegistrationScreen()),
    GetPage(name: '/dashboard', page: () => DashboardScreen()),
    GetPage(
      name: '/watchlis',
      page: () => Watchlist(watchlistName: Get.arguments),
    ),
  ];
}
