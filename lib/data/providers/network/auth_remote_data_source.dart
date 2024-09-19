import 'package:dio/dio.dart';
import 'package:fluuky/data/models/auth_model.dart';
import 'package:fluuky/data/models/user_model.dart';
import 'package:fluuky/data/providers/network/dio_provider.dart';

class AuthRemoteDataSource {
  late final Dio _dio;
  final AuthModel authModel;

  AuthRemoteDataSource(DioProvider dioProvider, this.authModel) : _dio = dioProvider.createDio(); // Use DioProvider to create Dio

  Future<AuthModel> login(String email, String password) async {
    final response = await _dio.post('/auth/login', data: {
      'email': email,
      'password': password,
    });
    if (response.statusCode != 200) {
      throw Exception('Login failed');
    }
    return AuthModel.fromJson(response.data);
  }

  Future<bool?> resendCode(String email) async {
    final response = await _dio.post('/auth/resend-code', data: {
      'email': email,
    });

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<String> refreshToken() async {
    final response = await _dio.post('/auth/refresh-token');

    if (response.statusCode == 200) {
      return response.data['token'];
    } else {
      throw Exception('Failed to refresh token');
    }
  }

  Future<bool?> createPassword(String email, String password) async {
    final response = await _dio.post('/auth/create-password', data: {
      'email': email,
      'password': password,
    });

    return response.statusCode == 200;
  }

  Future<UserModel?> register(String firstName, String lastName, String mobile, String email, String referralCode) async {
    final response = await _dio.post('/auth/register', data: {
      'first_name': firstName,
      'last_name': lastName,
      'mobile': mobile,
      'email': email,
      'referral_code': referralCode,
    });

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data['user']);
    }
    return null;
  }

  Future<bool> detailsAboutYou(String day, String month, String year, String gender) async {
    final response = await _dio.post('/auth/details', data: {
      'day': day,
      'month': month,
      'year': year,
      'gender': gender,
    });

    return response.statusCode == 200;
  }

  Future<void> logout() async {
    final response = await _dio.post('/auth/logout');
    if (response.statusCode != 200) {
      throw Exception('Logout failed');
    }
  }

  Future<void> verifyCode(String code) async {
    final response = await _dio.post('/auth/verify-code', data: {
      'code': code,
    });

    if (response.statusCode != 200) {
      throw Exception('Verification failed');
    }
  }

  Future<UserModel?> getCurrentUser() async {
    final response = await _dio.get('/auth/current-user');

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data['user']);
    }
    return null;
  }
}
