import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fluuky/data/models/auth_model.dart';
import 'package:fluuky/data/models/user_model.dart';
import 'package:fluuky/data/providers/network/dio_provider.dart';

class AuthRemoteDataSource {
  final Dio _dio = DioProvider().createDio(); // Direct instantiation of Dio

  Future<AuthModel> login(String email, String password) async {
    final response = await _dio.post(
      '/auth/login',
      data: {
        'email': email,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      return AuthModel.fromJson(response.data);
    } else {
      throw Exception('Login failed: ${response.data['message'] ?? 'Unknown error'}');
    }
  }

  Future<String?> uploadAvatar(File image) async {
    try {
      // Use Dio or another HTTP client to upload the image
      FormData formData = FormData.fromMap({
        'avatar': await MultipartFile.fromFile(image.path),
      });
      final response = await _dio.post('/update-user-profile-avatar', data: formData);

      // Return the image URL or path if successful
      return response.data['avatarUrl'];
    } catch (e) {
      // Handle the error
      return null;
    }
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

  Future<bool> logout() async {
    final response = await _dio.post('/auth/logout');
    if (response.statusCode != 200) {
      throw Exception('Logout failed');
    }
    return true;
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
