import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluuky/data/models/user_model.dart';
import 'package:fluuky/domain/entities/auth_entity.dart';
import 'package:fluuky/domain/entities/user_entity.dart';

class AuthModel {
  static const _tokenKey = 'auth_token';
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
    await _secureStorage.write(key: _tokenKey, value: token);
  }

  // Save user
  Future<void> saveUser(UserEntity userEntity) async {
    await _secureStorage.write(key: 'user', value: jsonEncode(userEntity.toJson()));
  }

  // Get user
  Future<UserEntity?> getUser() async {
    final String? userData = await _secureStorage.read(key: 'user');
    print(userData);
    if (userData != null) {
      return UserEntity.fromJson(jsonDecode(userData));
    }

    return null;
  }

  // Get token
  Future<String?> getToken() async {
    return await _secureStorage.read(key: _tokenKey);
  }

  // Delete token
  Future<void> deleteToken() async {
    await _secureStorage.delete(key: _tokenKey);
  }
}
