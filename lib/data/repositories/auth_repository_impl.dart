import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../providers/network/api_provider.dart';
import '../providers/network/apis/auth_api.dart';

class AuthRepositoryImpl implements AuthRepository {
  final APIProvider _apiProvider;
  final FlutterSecureStorage _secureStorage;

  AuthRepositoryImpl(this._apiProvider, this._secureStorage);

  @override
  Future<User?> login(String email, String password) async {
    try {
      final request = AuthAPI(
        authEndpoint: AuthEndpoint.login,
        bodyData: {
          'email': email,
          'password': password,
        },
      );

      final response = await _apiProvider.request(request);

      if (response != null) {
        final user = User.fromJson(response['user']);
        await _secureStorage.write(key: 'token', value: response['token']);
        return user;
      }
    } catch (e) {
      print('Login error: $e');
      rethrow;
    }
    return null;
  }

  @override
  Future<void> logout() async {
    try {
      final request = AuthAPI(authEndpoint: AuthEndpoint.logout);
      await _apiProvider.request(request);
    } finally {
      await _secureStorage.delete(key: 'token');
    }
  }

  @override
  Future<User?> getCurrentUser() async {
    final token = await _secureStorage.read(key: 'token');
    if (token != null) {
      try {
        // Assuming you have an endpoint to get the current user
        final request = AuthAPI(authEndpoint: AuthEndpoint.getCurrentUser);
        final response = await _apiProvider.request(request);
        if (response != null) {
          return User.fromJson(response);
        }
      } catch (e) {
        print('Get current user error: $e');
        rethrow;
      }
    }
    return null;
  }
}
