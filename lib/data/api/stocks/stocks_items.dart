import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart' hide Response;

class StocksApi {
  Future getStocks() async {
    final Dio _dio = Get.find<Dio>();
    try {
      String? token = Get.find<SharedPreferences>().getString("ACCESS_TOKEN");
      if (token != null) {
        Response response = await _dio.get(
          '/stocks/all_stock',
          options: Options(headers: {"Authorization": "Bearer $token"}),
        );
        log("Stocks fetched successfully.");
        log(response.data.toString());
        return response.data["data"];
      } else {
        log("Token not found.");
        Get.snackbar('Error', 'Access token is missing.');
        return null;
      }
    } on DioException catch (e) {
      log(e.toString());
      Get.snackbar('Error', 'Failed to get stocks.');
      rethrow;
    } catch (e) {
      log("Unexpected error: $e");
      Get.snackbar('Error', 'An unexpected error occurred.');
      rethrow;
    }
  }
}
