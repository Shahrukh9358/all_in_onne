import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/api/auth_repository.dart';
import '../dashboard/dashboard_screen.dart';

class AuthController extends GetxController {
  final AuthRepository _authRepository = Get.find<AuthRepository>();

  var fullName = ''.obs;
  var email = ''.obs;
  var password = ''.obs;

  registerUser() async {
    Get.showOverlay(
      loadingWidget: const Center(child: CircularProgressIndicator()),
      asyncFunction: () async {
        try {
          await _authRepository.registerUser({
            "fullname": fullName.value,
            "email": email.value,
            "password": password.value,
          });
          await getUserDetails();
          Get.offAll(() => DashboardScreen());
        } on DioException catch (e) {
          Get.showSnackbar(
            GetSnackBar(
              backgroundColor: Colors.red,
              title: "Registration Failed",
              message: e.response?.data["message"] ?? "Unknown error",
              duration: const Duration(seconds: 5),
            ),
          );
        }
      },
    );
  }

  getUserDetails() async {
    try {
      await _authRepository.getUserDetails();
      // User details are already saved to local database by repository
    } catch (e) {
      log(e.toString());
      // Handle error
    }
  }
}
