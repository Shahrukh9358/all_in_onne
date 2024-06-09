import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_binding/binding.dart';
import 'routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AppBindings(), // Ensure AppBindings is set here
      getPages: AppRoutes.routes,
      initialRoute: '/splash',
    ),
  );
}
