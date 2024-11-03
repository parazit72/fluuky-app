import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluuky/domain/entities/transaction_entity.dart';
import 'package:fluuky/domain/repositories/transaction_repository.dart';
import 'package:fluuky/data/providers/network/dio_provider.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final Dio _dio;

  TransactionRepositoryImpl() : _dio = DioProvider().createDio();

  @override
  Future<TransactionEntity> getTransaction(int id) async {
    try {
      final response = await _dio.get('/transaction/$id');
      return TransactionEntity.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to fetch transaction: ${e.response?.data['message'] ?? e.message}');
    }
  }

  @override
  Future<List<TransactionEntity>> getTransactionsByTime(DateTimeRange? timeRange) async {
    try {
      final date = timeRange?.start.toIso8601String() ?? DateTime(2024, 1, 1).toIso8601String();
      final response = await _dio.get('/transactions', queryParameters: {
        'date': date,
      });
      return (response.data as List).map((transaction) => TransactionEntity.fromJson(transaction)).toList();
    } on DioException catch (e) {
      throw Exception('Failed to fetch transactions by date: ${e.response?.data['message'] ?? e.message}');
    }
  }
}
