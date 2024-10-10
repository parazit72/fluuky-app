import 'package:flutter/material.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/presentation/pages/auth/verification_screen.dart';
import 'package:fluuky/presentation/pages/home_screen/draggable_signup_sheet.dart';
import 'package:fluuky/presentation/pages/home_screen/home_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
// import '../../../domain/usecases/verify_code_usecase.dart';

class AuthController extends GetxController {
  final AuthRepository _authRepository;
  // final VerifyCodeUseCase _verifyCodeUseCase;
  final isLogged = false.obs;
  final isLoading = false.obs;
  final rememberMe = false.obs;

  var hasUpperCase = false.obs;
  var hasLowerCase = false.obs;
  var hasDigit = false.obs;
  var hasSpecialCharacter = false.obs;
  var isAtLeast8Characters = false.obs;
  final isBillingAddressEqualShippingAddress = false.obs;

  bool checkAuthAndShowSheet() {
    if (!isLogged.value) {
      Get.bottomSheet(
        const DraggableSignupSheet(),
        isScrollControlled: true,
      );
      return false;
    } else {
      return true;
    }
  }

  void checkPassword(String password) {
    hasUpperCase.value = password.contains(RegExp(r'[A-Z]'));
    hasLowerCase.value = password.contains(RegExp(r'[a-z]'));
    hasDigit.value = password.contains(RegExp(r'\d'));
    hasSpecialCharacter.value = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    isAtLeast8Characters.value = password.length >= 8;
  }

  AuthController(this._authRepository);
  // AuthController(this._authRepository, this._verifyCodeUseCase);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController referralCodeController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  final Rx<UserEntity?> user = Rx<UserEntity?>(null);
  final FlutterSecureStorage _secureStorage = Get.find<FlutterSecureStorage>();
  static const _tokenKey = 'auth_token';

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  Future<void> registerWithEmail() async {
    isLoading.value = true;

    try {
      final user = await _authRepository.register(
        firstNameController.text,
        lastNameController.text,
        mobileController.text,
        emailController.text.trim(),
        referralCodeController.text,
      );

      if (user != null) {
        firstNameController.clear();
        lastNameController.clear();
        referralCodeController.clear();
        emailController.clear();
        mobileController.clear();
        Get.offAll(() => VerificationScreen(), arguments: {'email': emailController.text});
      } else {
        throw Exception("Registration failed");
      }
    } catch (e) {
      _showErrorDialog(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loginWithEmail() async {
    isLoading.value = true;
    try {
      await _authRepository.login(emailController.text.trim(), passwordController.text);

      emailController.clear();
      passwordController.clear();
      isLogged.value = true;

      Get.offAll(() => const HomeScreen());
    } catch (e) {
      _showErrorDialog(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> verifyCode() async {
    isLoading.value = true;
    try {
      // await _verifyCodeUseCase.execute(codeController.text);
      await _authRepository.verifyCode(codeController.text);
      Get.toNamed(detailsAboutYou);
    } catch (e) {
      _showErrorDialog(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void resendCode(String email) async {
    isLoading.value = true;
    try {
      await _authRepository.resendCode(email);
      // Handle success or failure
    } catch (e) {
      _showErrorDialog(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> checkLoginStatus() async {
    final token = await _secureStorage.read(key: _tokenKey);
    if (token != null) {
      isLogged.value = true;
    } else {
      isLogged.value = false;
      // user.value = await _authRepository.getCurrentUser();
    }
  }

  Future<void> logout() async {
    try {
      isLogged.value = true;
      bool serverLogedOut = await _authRepository.logout();
      if (serverLogedOut) {
        await _secureStorage.write(key: _tokenKey, value: null);
      }

      user.value = null;
      isLogged.value = false;
    } catch (e) {
      _showErrorDialog(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void _showErrorDialog(String message) {
    Get.snackbar('Error', message, duration: const Duration(seconds: 10));
  }
}
