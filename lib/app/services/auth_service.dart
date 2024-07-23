// auth_service.dart
import 'package:fluuky/data/models/models.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService extends GetxService {
  final _user = Rxn<UserModel>();
  final _secureStorage = FlutterSecureStorage();

  UserModel? get user => _user.value;
  bool get isLoggedIn => _user.value != null;

  Future<void> login(String email, String password) async {
    // Assume login API call here that returns user data and token
    final userData = await _loginApiCall(email, password);

    final user = UserModel(
      id: userData['id'],
      name: userData['name'],
      email: userData['email'],
      token: userData['token'],
    );

    _user.value = user;
    await _secureStorage.write(key: 'token', value: user.token);
  }

  Future<void> logout() async {
    _user.value = null;
    await _secureStorage.delete(key: 'token');
  }

  Future<void> refreshToken() async {
    // Assume refresh token API call here that returns new token
    final newToken = await _refreshTokenApiCall();

    _user.value = _user.value?.copyWith(token: newToken);
    await _secureStorage.write(key: 'token', value: newToken);
  }

  Future<String?> getToken() async {
    return await _secureStorage.read(key: 'token');
  }

  Future<Map<String, dynamic>> _loginApiCall(String email, String password) async {
    // Implement API call to login
    return {}; // Replace with actual API call result
  }

  Future<String> _refreshTokenApiCall() async {
    // Implement API call to refresh token
    return ''; // Replace with actual API call result
  }
}
