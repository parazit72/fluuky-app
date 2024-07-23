import 'package:get/get.dart';
import '../repositories/auth_repository.dart';

class AuthUseCase {
  final AuthRepository _authRepository;

  AuthUseCase(this._authRepository);

  Future<bool> login(String email, String password) async {
    try {
      final user = await _authRepository.login(email, password);
      // You might want to store the user data in a global state or local storage here
      return user != null;
    } catch (e) {
      Get.snackbar('Error', 'Login failed: ${e.toString()}');
      return false;
    }
  }

  Future<bool> signup(String email, String password) async {
    try {
      final user = await _authRepository.signup(email, password);
      // You might want to store the user data in a global state or local storage here
      return user != null;
    } catch (e) {
      Get.snackbar('Error', 'Signup failed: ${e.toString()}');
      return false;
    }
  }

  Future<void> logout() async {
    await _authRepository.logout();
    // Clear any stored user data here
  }
}
