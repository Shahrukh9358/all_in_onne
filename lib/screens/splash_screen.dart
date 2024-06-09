import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'authentication/registration_screen.dart';
import 'dashboard/dashboard_screen.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("ACCESS_TOKEN");
      if (token != null) {
        Get.offAll(() => DashboardScreen());
      } else {
        Get.offAll(() => RegistrationScreen());
      }

    });

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Center(child:  Image.asset("assets/images/splash.png",height: 300,width: 200,),)
        ],
      )
    );
  }
}
