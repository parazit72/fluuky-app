import 'package:flutter/material.dart';
import 'package:fluuky/domain/repositories/auth_repository.dart';
import 'package:fluuky/presentation/pages/auth/verification_screen.dart';
import 'package:fluuky/presentation/pages/home_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class RegisterationController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController referalCodeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  final AuthRepository _authRepository = Get.find<AuthRepository>();
  final FlutterSecureStorage _secureStorage = Get.find<FlutterSecureStorage>();

  Future<void> registerWithEmail() async {
    try {
      final user = await _authRepository.register(
        firstNameController.text,
        lastNameController.text,
        mobileController.text,
        emailController.text.trim(),
        referalCodeController.text,
      );

      if (user != null) {
        // Store token securely
        final token = await _secureStorage.read(key: 'token');
        print(token);

        firstNameController.clear();
        lastNameController.clear();
        referalCodeController.clear();
        emailController.clear();
        mobileController.clear();
        Get.offAll(VerificationScreen());
      } else {
        throw Exception("Registration failed");
      }
    } catch (e) {
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
    }
  }
}
