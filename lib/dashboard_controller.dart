import 'dart:developer';
import 'package:get/get.dart';
import 'package:realproject/data/local_database/user_table/user_dao.dart';
import 'data/local_database/db/app_database.dart';
class DashboardController extends GetxController {
  final UserDao _userDao = Get.find<AppDatabase>().userDao;
  var users = <User>[].obs;
  @override
  void onInit() {
    super.onInit();
    _watchUsers();
  }

  void _watchUsers() {
    _userDao.watchAllUsers().listen((userList) {
      log('Stream fetched users: $userList');
      users.value = userList;
    }).onError((e) {
      log('Error fetching users: $e');
    });
  }

  Future<void> updateUser(String newName) async {
    int userId = users[0].id;
    await _userDao.updateUser(userId, newName); // Update local database
  }
}
