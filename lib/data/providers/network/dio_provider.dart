import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class DioProvider {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  static const _tokenKey = 'auth_token';
  Locale locale = Get.locale ?? const Locale('ar');

  Dio createDio() {
    final Dio dio = Dio(BaseOptions(
      baseUrl: 'https://dev-flukky.snatch.digital/api/v1',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await _secureStorage.read(key: _tokenKey);
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }

        final Locale locale = Get.locale ?? const Locale('ar');
        options.headers['Accept-Language'] = locale.languageCode == 'ar' ? 'ar' : 'en';

        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        return handler.next(e);
      },
    ));

    return dio;
  }
}
