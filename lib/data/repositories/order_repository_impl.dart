import 'package:dio/dio.dart';
import 'package:flutter/src/material/date.dart';
import 'package:fluuky/domain/entities/order_entity.dart';
import 'package:fluuky/domain/repositories/order_repository.dart';
import 'package:fluuky/data/providers/network/dio_provider.dart';

class OrderRepositoryImpl implements OrderRepository {
  final Dio _dio;

  OrderRepositoryImpl() : _dio = DioProvider().createDio();

  @override
  Future<List<OrderEntity>> getOrders() async {
    try {
      final response = await _dio.get('/orders');
      final data = response.data['data'] as List;
      return data.map((order) => OrderEntity.fromJson(order)).toList();
    } on DioException catch (e) {
      throw Exception('Failed to fetch orders: ${e.response?.data['message'] ?? e.message}');
    }
  }

  @override
  Future<OrderEntity> getOrder(int id) async {
    try {
      final response = await _dio.get('/order/$id');
      return OrderEntity.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to fetch order: ${e.response?.data['message'] ?? e.message}');
    }
  }

  @override
  Future<List<OrderEntity>> getOrdersByTime(DateTimeRange timeRange) async {
    try {
      final response = await _dio.get('/orders', queryParameters: {
        'start_date': timeRange.start.toIso8601String(),
        'end_date': timeRange.end.toIso8601String(),
      });
      return (response.data as List).map((order) => OrderEntity.fromJson(order)).toList();
    } on DioException catch (e) {
      throw Exception('Failed to fetch orders by time: ${e.response?.data['message'] ?? e.message}');
    }
  }
}
