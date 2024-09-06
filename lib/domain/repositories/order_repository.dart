import 'package:flutter/material.dart';

import '../entities/order_entity.dart';

abstract class OrderRepository {
  Future<List<OrderEntity>> getOrders();
  Future<List<OrderEntity>> getOrdersByTime(DateTimeRange timeRange);
  Future<OrderEntity> getOrder(int id);
}
