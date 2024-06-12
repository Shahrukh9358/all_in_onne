import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:shared_preferences/shared_preferences.dart';
class SearchName {
  Future getName(String stockName) async {
    final Dio dio = Get.find<Dio>();
    try {
      String? token = Get.find<SharedPreferences>().getString("ACCESS_TOKEN");
      if (token != null) {
        Response response = await dio.get(
          '/stocks/$stockName',
          options: Options(headers: {"Authorization": "Bearer $token"}),
        );
        return response.data["data"];
      } else {
        Get.snackbar('Error', 'Token not found.');
      }
    } catch (e) {
      log('Error searching stock: $e');
      Get.snackbar('Error', 'Failed to search: ${e.toString()}');
    }
  }
}