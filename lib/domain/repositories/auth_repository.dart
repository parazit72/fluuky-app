import 'dart:io';

import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity?> login(String email, String password);
  Future<bool?> resendCode(String email);
  Future<void> refreshToken();
  Future<bool?> createPassword(String email, String password);
  Future<UserEntity?> register(String firstName, String lastName, String mobile, String email, String referralCode);
  Future<bool> detailsAboutYou(String day, String month, String year, String gender);
  Future<bool> logout();
  Future<void> verifyCode(String code);
  Future<UserEntity?> getCurrentUser();
  Future<String?> uploadAvatar(File image);
}
