import 'package:flutter/material.dart';
import 'package:fluuky/app/services/auth_service.dart';
import 'package:get/get.dart';
import 'package:fluuky/presentation/pages/home_screen.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final AuthService _authService = Get.find<AuthService>();

  Future<(bool, String?)> loginWithEmail(String email, String password) async {
    try {
      await _authService.login(email, password);

      emailController.clear();
      passwordController.clear();
      Get.offAll(const HomeScreen());

      return (true, null); // Indicate success
    } catch (e) {
      // Handle the error appropriately
      Get.back();
      showDialog(
        context: Get.context!,
        builder: (context) {
          return SimpleDialog(
            title: const Text('Error'),
            contentPadding: const EdgeInsets.all(20),
            children: [Text(e.toString())],
          );
        },
      );

      return (false, e.toString()); // Return error message
    }
  }
}
