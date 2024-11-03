import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluuky/app/config/string_constants.dart';
import 'package:fluuky/data/models/user_model.dart';
import 'package:fluuky/domain/entities/auth_entity.dart';
import 'package:fluuky/domain/entities/user_entity.dart';

class AuthModel {
  String? token;
  int? expiresIn; // Token expiration time in seconds
  String? message;
  UserModel? user;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  AuthModel({this.token, this.expiresIn, this.message, this.user});

  // JSON Deserialization
  AuthModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    expiresIn = json['expires_in'];
    message = json['message'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
  }

  // JSON Serialization
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['token'] = token;
    data['expires_in'] = expiresIn;
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }

  // Convert AuthModel to AuthEntity if needed
  AuthEntity toEntity() {
    return AuthEntity(
      token: token ?? '',
      expiresIn: expiresIn ?? 0,
      message: message ?? '',
      user: user?.toEntity(),
    );
  }

  // Save token
  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: StringConstants.authToken, value: token);
  }

  // Save user
  Future<void> saveUser(UserEntity userEntity) async {
    await _secureStorage.write(key: StringConstants.user, value: jsonEncode(userEntity.toJson()));
  }

  // Get user
  Future<UserEntity?> getUser() async {
    final String? userData = await _secureStorage.read(key: StringConstants.user);
    if (userData != null) {
      return UserModel.fromJson(jsonDecode(userData)).toEntity();
    }

    return null;
  }

  // Get token
  Future<String?> getToken() async {
    return await _secureStorage.read(key: StringConstants.authToken);
  }

  // Delete token
  Future<void> deleteToken() async {
    await _secureStorage.delete(key: StringConstants.authToken);
  }
}
