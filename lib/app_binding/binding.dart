import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import '../dashboard_controller.dart';
import '../data/api/auth_repository.dart';
import '../data/api/users_update.dart';
import '../data/local_database/app_database.dart';
import '../screens/authentication/auth_controller.dart';
class AppBindings extends Bindings {
  @override
  void dependencies() async {
    // Initialize SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    Get.put<SharedPreferences>(prefs, permanent: true);

    // Initialize Dio
    Dio dio = Dio(BaseOptions(
      baseUrl: 'https://023b-103-95-164-126.ngrok-free.app', // Replace with your base URL
    ));
    dio.interceptors.add(LogInterceptor());
    Get.put<Dio>(dio, permanent: true);

    // Initialize AppDatabase
    final appDatabase = AppDatabase();
    Get.put<AppDatabase>(appDatabase, permanent: true);

    // Initialize Repositories
    final authRepository = AuthRepository();
    Get.put<AuthRepository>(authRepository, permanent: true);

    final updateUser = UpdateUser();
    Get.put<UpdateUser>(updateUser, permanent: true);

    // Initialize Controllers
    Get.put<DashboardController>(DashboardController(), permanent: true);
    Get.put<AuthController>(AuthController(), permanent: true);
  }
}
