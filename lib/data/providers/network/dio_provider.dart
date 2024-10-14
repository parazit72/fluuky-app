import 'dart:math';

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
      onError: (DioException e, handler) {
        // ErrorHandler.handleError(e);
        return handler.next(e);
      },
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

class ErrorHandler {
  static void handleError(DioException e) {
    String message;
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        message = 'Connection timed out. Please try again.';
        break;
      case DioExceptionType.receiveTimeout:
        message = 'Receiving data timed out. Please try again.';
        break;
      case DioExceptionType.badResponse:
        message = 'Received invalid status code: ${e.response?.statusCode}';
        break;
      case DioExceptionType.unknown:
        message = 'An unexpected error occurred. Please try again.';
        break;
      default:
        message = 'An unknown error occurred.';
    }

    Get.snackbar(
      'Error',
      message,
      snackPosition: SnackPosition.TOP,
    );
  }
}
