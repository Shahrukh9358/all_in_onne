import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:get/get.dart' hide Response, Value;
import 'package:shared_preferences/shared_preferences.dart';
import '../local_database/app_database.dart';
import '../local_database/user_dao.dart';

class AuthRepository {
  final Dio _dio = Get.find<Dio>();
  final UserDao userDao = Get.find<AppDatabase>().userDao;

  Future<void> registerUser(Map<String, String> body) async {
    try {
      Response response = await _dio.post('/auth/register', data: body);
      log(response.data.toString(), name: "Success in Registration");
      if (response.data["jwt"] != null) {
        await Get.find<SharedPreferences>().setString("ACCESS_TOKEN", response.data["jwt"]);
      }
    } on DioException catch (e) {
      rethrow;
    }
  }

  Future<void> getUserDetails() async {
    try {
      String? token = Get.find<SharedPreferences>().getString("ACCESS_TOKEN");
      if (token != null) {
        Response response = await _dio.get('/users', options: Options(headers: {"Authorization": "Bearer $token"}));
        final user = UsersCompanion(
          fullName: Value(response.data['fullname']),
          email: Value(response.data['email']),
          id: Value(response.data["id"]),
          createWatchlist: Value(response.data['createWatchlist']),
        );
        log("watchlist is created");
        log(response.data.toString());
        await userDao.insertUser(user);
        return response.data;
      }
    } on DioException catch (e) {
      log(e.toString());
      Get.snackbar('Error', 'Failed to get user details.');
      rethrow;
    }
  }

  Future<void> createWatchlist(Map<String, String> body, int userId) async {
    try {
      String? token = Get.find<SharedPreferences>().getString("ACCESS_TOKEN");
      if (token != null) {
        Response response = await _dio.post('/users/watchList/create', data: body, options: Options(headers: {"Authorization": "Bearer $token"}));
        await userDao.insertWatchlist(userId, body["name"]!);
        return response.data;
      }
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'Failed to create watchlist.');
      throw e;
    }
  }

  Future<void> updateUserDetails(Map<String, String> body, int userId) async {
    try {
      String? token = Get.find<SharedPreferences>().getString("ACCESS_TOKEN");
      if (token != null) {
        Response response = await _dio.put('/users/$userId', data: body, options: Options(headers: {"Authorization": "Bearer $token"}));
        if (response.statusCode == 200) {
          final user = UsersCompanion(
            id: Value(userId),
            fullName: Value(body['fullname']!),
          );
          await userDao.updateUser(userId, body['fullname']!);
          log("User details updated successfully.");
        }
      }
    } on DioException catch (e) {
      log(e.toString());
      Get.snackbar('Error', 'Failed to update user details.');
      rethrow;
    }
  }
}
