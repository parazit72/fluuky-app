import 'package:fluuky/data/providers/network/api_provider.dart';
import 'package:get/get.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthController extends GetxController {
  final AuthRepository _authRepository;

  AuthController(this._authRepository);

  final Rx<User?> user = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    user.value = await _authRepository.getCurrentUser();
  }

  Future<(bool, String?)> login(String email, String password) async {
    try {
      user.value = await _authRepository.login(email, password);
      return (true, null); // Return a tuple: (success, errorMessage)
    } on BadRequestException catch (e) {
      return (false, e.message as String);
    } on UnauthorisedException catch (e) {
      return (false, e.message as String);
    } on FetchDataException catch (e) {
      return (false, e.message as String);
    } catch (e) {
      return (false, 'An unexpected error occurred');
    }
  }

  Future<void> logout() async {
    await _authRepository.logout();
    user.value = null;
  }
}
