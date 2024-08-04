import 'package:fluuky/data/providers/network/apis/auth_api.dart';
import 'package:fluuky/data/providers/network/api_provider.dart';
import 'package:fluuky/domain/entities/user_entity.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluuky/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final APIProvider _apiProvider;
  final FlutterSecureStorage _secureStorage;

  AuthRepositoryImpl({String? baseUrl})
      : _apiProvider = APIProvider(),
        _secureStorage = const FlutterSecureStorage();

  @override
  Future<void> login(String email, String password) async {
    try {
      final request = AuthAPI(
        authEndpoint: AuthEndpoint.login,
        bodyData: {'email': email, 'password': password},
      );
      final response = await _apiProvider.request(request);
      final user = User.fromJson(response);
      await _secureStorage.write(key: 'token', value: response['token']);
    } catch (e) {
      throw Exception('Login failed: ${e.toString()}');
    }
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
  Future<void> refreshToken() async {
    try {
      final request = AuthAPI(authEndpoint: AuthEndpoint.refreshToken);
      final response = await _apiProvider.request(request);
      final newToken = response['token'] as String;
      await _secureStorage.write(key: 'token', value: newToken);
    } catch (e) {
      throw Exception('Token refresh failed: ${e.toString()}');
    }
  }

  @override
  Future<bool?> createPassword(String email, String password) async {
    try {
      final request = AuthAPI(
        authEndpoint: AuthEndpoint.createPassword,
        bodyData: {'email': email, 'password': password},
      );
      final response = await _apiProvider.request(request);
      await _secureStorage.write(key: 'token', value: response['token']);
    } catch (e) {
      throw Exception('Create password failed: ${e.toString()}');
    }
    return null;
  }

  @override
  Future<bool?> resendCode(String email) async {
    try {
      final request = AuthAPI(
        authEndpoint: AuthEndpoint.resendCode,
        bodyData: {'email': email},
      );
      final response = await _apiProvider.request(request);
      return response['success'] == true;
    } catch (e) {
      throw Exception('Create password failed: ${e.toString()}');
    }
  }

  @override
  Future<User> register(String firstName, String lastName, String mobile, String email, String referalCode) async {
    try {
      final request = AuthAPI(
        authEndpoint: AuthEndpoint.register,
        bodyData: {'firstName': firstName, 'lastName': lastName, 'mobile': mobile, 'email': email, 'referalCode': referalCode},
      );
      final response = await _apiProvider.request(request);
      final user = User.fromJson(response);
      await _secureStorage.write(key: 'token', value: response['token']);
      return user;
    } catch (e) {
      throw Exception('Registration failed: ${e.toString()}');
    }
  }

  @override
  Future<bool> detailsAboutYou(String day, String month, String year, String gender) async {
    try {
      final request = AuthAPI(
        authEndpoint: AuthEndpoint.detailsAboutYou,
        bodyData: {'day': day, 'month': month, 'year': year, 'gender': gender},
      );
      final response = await _apiProvider.request(request);
      return response['success'] == true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> verifyCode(String code) async {
    try {
      final request = AuthAPI(
        authEndpoint: AuthEndpoint.verifyCode,
        bodyData: {'code': code},
      );
      final response = await _apiProvider.request(request);
      return response['success'] == true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<User?> getCurrentUser() async {
    final token = await _secureStorage.read(key: 'token');
    if (token != null) {
      try {
        final request = AuthAPI(authEndpoint: AuthEndpoint.getCurrentUser);
        final response = await _apiProvider.request(request);
        return User.fromJson(response);
      } catch (e) {
        throw Exception('Get current user failed: ${e.toString()}');
      }
    }
    return null;
  }
}
