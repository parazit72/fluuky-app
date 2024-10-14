import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fluuky/app/utils/check_internet_connection.dart';
import 'package:fluuky/data/models/auth_model.dart';
import 'package:fluuky/data/models/user_model.dart';
import 'package:fluuky/data/providers/network/auth_remote_data_source.dart';
import 'package:fluuky/domain/entities/user_entity.dart';
import 'package:fluuky/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  late final AuthRemoteDataSource _remoteDataSource = AuthRemoteDataSource();
  late final AuthModel _authModel = AuthModel();
  @override
  Future<UserEntity?> login(String email, String password) async {
    try {
      final response = await _remoteDataSource.login(email, password);

      // Assume the API returns a token on successful login
      if (response.token != null) {
        await _authModel.saveToken(response.token!); // Save the token
        final UserEntity? user = response.toEntity().user;
        await _authModel.saveUser(user!); // Save the user
        return user;
      }

      return null; // Return null if token is not present
    } catch (e) {
      if (e is DioException) {
        // Check the HTTP status code
        if (e.response?.statusCode == 422) {
          throw Exception('Validation failed:\nInvalid email or password.');
        } else if (e.response?.statusCode == 401) {
          throw Exception('Unauthorized:\nIncorrect credentials.');
        } else if (e.response?.statusCode == 500) {
          throw Exception('Server error:\nPlease try again later.');
        } else {
          // Handle other Dio-specific errors
          throw Exception('Failed to login:\nPlease check your internet cnnection and try again.');
        }
      } else {
        // Handle non-Dio errors
        throw Exception('Unexpected error:\n$e');
      }
    }
  }

  @override
  Future<bool?> resendCode(String email) async {
    try {
      return await _remoteDataSource.resendCode(email);
    } catch (e) {
      throw Exception('Failed to resend code: $e');
    }
  }

  @override
  Future<void> refreshToken() async {
    try {
      await _remoteDataSource.refreshToken();
    } catch (e) {
      throw Exception('Failed to refresh token: $e');
    }
  }

  @override
  Future<bool?> createPassword(String email, String password) async {
    try {
      return await _remoteDataSource.createPassword(email, password);
    } catch (e) {
      throw Exception('Failed to create password: $e');
    }
  }

  @override
  Future<UserEntity?> register(String firstName, String lastName, String mobile, String email, String referralCode) async {
    try {
      final UserModel? userModel = await _remoteDataSource.register(firstName, lastName, mobile, email, referralCode);
      return userModel?.toEntity();
    } catch (e) {
      throw Exception('Registration failed: $e');
    }
  }

  @override
  Future<bool> detailsAboutYou(String day, String month, String year, String gender) async {
    try {
      return await _remoteDataSource.detailsAboutYou(day, month, year, gender);
    } catch (e) {
      throw Exception('Failed to update details: $e');
    }
  }

  @override
  Future<bool> logout() async {
    try {
      return await _remoteDataSource.logout();
    } catch (e) {
      throw Exception('Logout failed: $e');
    }
  }

  @override
  Future<void> verifyCode(String code) async {
    try {
      await _remoteDataSource.verifyCode(code);
    } catch (e) {
      throw Exception('Failed to verify code: $e');
    }
  }

  @override
  Future<String?> uploadAvatar(File image) async {
    try {
      final response = await _remoteDataSource.uploadAvatar(image);
      return response;
    } catch (e) {
      // Handle the error
      return null;
    }
  }

  @override
  Future<UserEntity?> getCurrentUser() async {
    try {
      if (await checkInternetConnection()) {
        final UserModel? remoteUserModel = await _remoteDataSource.getCurrentUser();
        return remoteUserModel?.toEntity();
      }

      // Fallback to local data if remote fetch fails or no internet
      final UserEntity? localUserModel = await _authModel.getUser();
      return localUserModel;
    } catch (e) {
      // Handle the error (remote fetch failed)
      print('Remote fetch failed, falling back to local: $e');
    }
    return null;
  }
}
