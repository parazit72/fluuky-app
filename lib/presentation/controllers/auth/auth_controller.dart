import 'package:flutter/material.dart';
import 'package:fluuky/presentation/pages/auth/verification_screen.dart';
import 'package:fluuky/presentation/pages/home_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/repositories/auth_repository.dart';
import '../../../domain/usecases/verify_code_usecase.dart';

class AuthController extends GetxController {
  final AuthRepository _authRepository;
  final VerifyCodeUseCase _verifyCodeUseCase;

  AuthController(this._authRepository, this._verifyCodeUseCase);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController referalCodeController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  final Rx<User?> user = Rx<User?>(null);
  final FlutterSecureStorage _secureStorage = Get.find<FlutterSecureStorage>();

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

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
        Get.offAll(() => VerificationScreen(), arguments: {'email': emailController.text});
      } else {
        throw Exception("Registration failed");
      }
    } catch (e) {
      _showErrorDialog(e.toString());
    }
  }

  Future<void> loginWithEmail() async {
    try {
      await _authRepository.login(emailController.text.trim(), passwordController.text);

      emailController.clear();
      passwordController.clear();
      Get.offAll(() => const HomeScreen());
    } catch (e) {
      _showErrorDialog(e.toString());
    }
  }

  Future<void> verifyCode() async {
    try {
      await _verifyCodeUseCase.execute(codeController.text);
      print(codeController.text);
      // Handle success or failure
    } catch (e) {
      _showErrorDialog(e.toString());
    }
  }

  void resendCode(String email) async {
    try {
      await _authRepository.resendCode(email);
      // Handle success or failure
    } catch (e) {
      _showErrorDialog(e.toString());
    }
  }

  Future<void> checkLoginStatus() async {
    user.value = await _authRepository.getCurrentUser();
  }

  Future<void> logout() async {
    await _authRepository.logout();
    user.value = null;
  }

  void _showErrorDialog(String message) {
    Get.back();
    showDialog(
      context: Get.context!,
      builder: (context) {
        return SimpleDialog(
          title: const Text('Error'),
          contentPadding: const EdgeInsets.all(20),
          children: [Text(message)],
        );
      },
    );
  }
}
