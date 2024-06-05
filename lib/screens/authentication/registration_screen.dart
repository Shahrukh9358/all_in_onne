import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auth_controller.dart';
class RegistrationScreen extends StatelessWidget {
  final AuthController _authController = Get.find<AuthController>();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(children: [
            Text("Test"),
          ],),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (val) => _authController.fullName.value = val,
                        decoration: InputDecoration(
                          hintText: "Full Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        validator: (val) {
                          if (GetUtils.isEmail(val ?? "")) return null;
                          return "Invalid email";
                        },
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (val) => _authController.email.value = val,
                        decoration: InputDecoration(
                          hintText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required!';
                          }
                          if (value.length < 8) {
                            return 'Password too short!';
                          }
                          bool hasAlphaNumeric = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]').hasMatch(value);
                          bool hasSpecialCharacter = RegExp(r'^(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$').hasMatch(value);
                          if (!hasAlphaNumeric) {
                            return 'Password must be alphanumeric';
                          }
                          if (!hasSpecialCharacter) {
                            return 'Password must contain special character';
                          }
                          return null;
                        },
                        onChanged: (val) => _authController.password.value = val,
                        decoration: InputDecoration(
                          hintText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 80,
                  width: 250,
                  child: TextButton(
                    child: const Text("Create Account"),
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _authController.registerUser(); // If form is valid, register the user
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
