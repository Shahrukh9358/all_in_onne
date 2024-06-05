import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:shared_preferences/shared_preferences.dart';
import '../local_database/app_database.dart';
import '../local_database/user_dao.dart';
class UpdateUser {
 Future updateUser(Map<String, String> body, int userId) async {
  final Dio dio = Get.find<Dio>();
  final UserDao userDao = Get.find<AppDatabase>().userDao;
  try {
   String? token = Get.find<SharedPreferences>().getString("ACCESS_TOKEN");
   if (token != null) {
    Response response = await dio.put('/users/$userId', data: body,
        options: Options(headers: {"Authorization": "Bearer $token"}));
    await userDao.updateUser(userId, body["fullname"]!);
    return response.data;
   }
  } catch (e) {
   log(e.toString());
   Get.snackbar('Error', 'Failed to update user details.');
  }
 }
}
