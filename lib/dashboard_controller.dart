import 'dart:developer';
import 'package:get/get.dart';
import '../data/api/auth_repository.dart';
import '../data/local_database/app_database.dart';
import '../data/local_database/user_dao.dart';
 // Ensure you import the User model
class DashboardController extends GetxController {
  final UserDao _userDao = Get.find<AppDatabase>().userDao;
  var users = <User>[].obs;

  @override
  void onInit() {
    super.onInit();
    _userDao.watchAllUsers().listen((userList) {
      log('Fetched users: $userList');
      users.value = userList;
    });
  }

  Future<void> createWatchlist(String watchlistName) async {
    int userId = users.isNotEmpty ? users[0].id : -1;
    if (userId != -1) {
      await Get.find<AuthRepository>().createWatchlist({"name": watchlistName}, userId);
      log("Local database updated with new watchlist.");
    }
  }

  Future<void> updateUser(String newName) async {
    int userId = users.isNotEmpty ? users[0].id : -1;
    if (userId != -1) {
      await Get.find<AuthRepository>().updateUserDetails({"fullname": newName}, userId);
      await _userDao.updateUser(userId, newName);  // Update local database
      users.refresh();  // Refresh users to reflect changes
    }
  }
}
