import 'package:fluuky/data/providers/network/apis/auth_api.dart';
import 'package:fluuky/data/providers/network/api_provider.dart';
import 'package:fluuky/domain/entities/user_entity.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluuky/domain/repositories/auth_repository.dart';
import 'package:get/get.dart';

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

      final responseBody = await _apiProvider.request(request);

      if (responseBody['token'] != null) {
        await _secureStorage.write(key: 'token', value: responseBody['token']);
      } else {
        throw Exception('Login failed: ${responseBody['message'] ?? 'Unknown error'}');
      }
    } catch (e) {
      throw Exception('Login failed: ${e.toString()}');
    }
  }

  @override
  Future<void> logout() async {
    try {
      final request = AuthAPI(authEndpoint: AuthEndpoint.logout);
      await APIProvider.instance.request(request);

      await _secureStorage.delete(key: 'token');
      Get.snackbar('Success', 'Logged out successfully');
    } on TimeOutException catch (e) {
      Get.snackbar('Timeout', 'The request timed out. Please try again later.');
    } on FetchDataException catch (e) {
      Get.snackbar('Network Error', 'No Internet connection. Please try again later.');
    } on UnauthorisedException catch (e) {
      await _secureStorage.delete(key: 'token');
      Get.snackbar('Unauthorised', 'Session expired. You have been logged out.');
    } catch (e) {
      Get.snackbar('Error', 'An error occurred. Please try again.');
    } finally {
      await _secureStorage.delete(key: 'token');
      // Get.offAllNamed(login);
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
  Future<UserEntity> register(String firstName, String lastName, String mobile, String email, String referalCode) async {
    try {
      final request = AuthAPI(
        authEndpoint: AuthEndpoint.register,
        bodyData: {'firstName': firstName, 'lastName': lastName, 'mobile': mobile, 'email': email, 'referalCode': referalCode},
      );
      final response = await _apiProvider.request(request);
      final user = UserEntity.fromJson(response);
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
  Future<UserEntity?> getCurrentUser() async {
    final token = await _secureStorage.read(key: 'token');
    if (token != null) {
      try {
        final request = AuthAPI(authEndpoint: AuthEndpoint.getCurrentUser);
        final response = await _apiProvider.request(request);
        return UserEntity.fromJson(response);
      } catch (e) {
        throw Exception('Get current user failed: ${e.toString()}');
      }
    }
    return null;
  }
}
