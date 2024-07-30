import 'package:fluuky/data/models/user_model.dart';
import 'package:fluuky/data/providers/network/apis/auth_api.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluuky/data/providers/network/api_provider.dart';

class AuthService extends GetxService {
  final _user = Rxn<UserModel>();
  final _secureStorage = FlutterSecureStorage();
  final APIProvider _apiProvider = Get.find<APIProvider>();

  UserModel? get user => _user.value;
  bool get isLoggedIn => _user.value != null;

  Future<void> login(String email, String password) async {
    try {
      final request = AuthAPI(
        authEndpoint: AuthEndpoint.login,
        bodyData: {'email': email, 'password': password},
      );
      final response = await _apiProvider.request(request);
      final user = UserModel.fromJson(response);

      _user.value = user;
      await _secureStorage.write(key: 'token', value: user.token);
    } catch (e) {
      throw Exception('Login failed: ${e.toString()}');
    }
  }

  Future<void> logout() async {
    try {
      final request = AuthAPI(authEndpoint: AuthEndpoint.logout);
      await _apiProvider.request(request);
    } finally {
      _user.value = null;
      await _secureStorage.delete(key: 'token');
    }
  }

  Future<void> refreshToken() async {
    try {
      final request = AuthAPI(authEndpoint: AuthEndpoint.refreshToken);
      final response = await _apiProvider.request(request);
      final newToken = response['token'] as String;

      _user.value = _user.value?.copyWith(token: newToken);
      await _secureStorage.write(key: 'token', value: newToken);
    } catch (e) {
      throw Exception('Token refresh failed: ${e.toString()}');
    }
  }

  Future<String?> getToken() async {
    return await _secureStorage.read(key: 'token');
  }

  Future<void> createPassword(String email, String password) async {
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
  }

  Future<UserModel> register(String firstName, String lastName, String mobile, String email, String referalCode) async {
    try {
      final request = AuthAPI(
        authEndpoint: AuthEndpoint.register,
        bodyData: {'firstName': firstName, 'lastName': lastName, 'mobile': mobile, 'email': email, 'referalCode': referalCode},
      );
      final response = await _apiProvider.request(request);
      final user = UserModel.fromJson(response);

      await _secureStorage.write(key: 'token', value: response['token']);
      return user;
    } catch (e) {
      throw Exception('Registration failed: ${e.toString()}');
    }
  }

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

  Future<UserModel?> getCurrentUser() async {
    final token = await _secureStorage.read(key: 'token');
    if (token != null) {
      try {
        final request = AuthAPI(authEndpoint: AuthEndpoint.getCurrentUser);
        final response = await _apiProvider.request(request);
        return UserModel.fromJson(response);
      } catch (e) {
        throw Exception('Get current user failed: ${e.toString()}');
      }
    }
    return null;
  }
}
