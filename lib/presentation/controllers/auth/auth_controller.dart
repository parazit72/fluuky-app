import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:get/get.dart';

import '../../../domain/entities/user.dart';
import '../../../domain/repositories/auth_repository.dart';
import '../../../domain/usecases/verify_code_usecase.dart';

@injectable
class AuthController extends GetxController {
  final AuthRepository _authRepository;
  final VerifyCodeUseCase _verifyCodeUseCase;

  AuthController(this._authRepository, this._verifyCodeUseCase);

  final TextEditingController codeController = TextEditingController();

  final Rx<User?> user = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  Future<void> verifyCode() async {
    await _verifyCodeUseCase.execute(codeController.text);
    // Handle success or failure
  }

  void resendCode(String email) async {
    await _authRepository.resendCode(email);
    // Handle success or failure
  }

  Future<void> checkLoginStatus() async {
    user.value = await _authRepository.getCurrentUser();
  }

  Future<void> logout() async {
    await _authRepository.logout();
    user.value = null;
  }
}
