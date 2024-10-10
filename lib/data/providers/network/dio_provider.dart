import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class DioProvider {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  static const String _tokenKey = 'auth_token';
  static const String _baseUrl = 'https://dev-flukky.snatch.digital/api/v1';
  static const Duration _timeout = Duration(seconds: 30);

  Dio createDio() {
    final Dio dio = Dio(BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: _timeout,
      receiveTimeout: _timeout,
    ));

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        options.headers.addAll(await _defaultHeaders());
        return handler.next(options);
      },
      onResponse: (response, handler) => handler.next(response),
      onError: (DioException e, handler) => handler.next(e),
    ));

    return dio;
  }

  Future<Map<String, String>> _defaultHeaders() async {
    final token = await _secureStorage.read(key: _tokenKey);
    final locale = Get.locale ?? const Locale('en');

    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (token != null) 'Authorization': 'bearer $token',
      'Accept-Language': locale.languageCode,
    };
  }
}
