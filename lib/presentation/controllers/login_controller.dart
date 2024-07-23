// lib/presentation/controllers/login_controller.dart

import 'package:fluuky/data/repositories/local_repository.dart';
import 'package:fluuky/domain/usecases/auth_usecase.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final AuthUseCase _authUseCase;
  final LocalStorage _localStorage;

  LoginController(this._authUseCase, this._localStorage);

  final RxBool isPasswordVisible = false.obs;
  final RxBool rememberMe = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }

  Future<void> login(String email, String password) async {
    try {
      final success = await _authUseCase.login(email, password);
      if (success) {
        if (rememberMe.value) {
          await _localStorage.setString('rememberedEmail', email);
        } else {
          await _localStorage.remove('rememberedEmail');
        }
        Get.offAllNamed('/home');
      } else {
        Get.snackbar('Error', 'Invalid credentials', snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  void onInit() {
    super.onInit();
    _loadRememberedEmail();
  }

  void _loadRememberedEmail() async {
    final rememberedEmail = await _localStorage.getString('rememberedEmail');
    if (rememberedEmail != null && rememberedEmail.isNotEmpty) {
      rememberMe.value = true;
      // You can set the email to the text controller here if needed
    }
  }
}
