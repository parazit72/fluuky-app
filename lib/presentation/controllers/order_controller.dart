import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluuky/domain/entities/order_entity.dart';
import 'package:fluuky/domain/repositories/order_repository.dart';

class OrderController extends GetxController {
  final OrderRepository orderRepository;

  RxBool isLoading = false.obs;
  var orders = <OrderEntity>[].obs;
  var currentOrder = Rxn<OrderEntity>();
  var filteredOrders = <OrderEntity>[].obs;
  RxString timeFilter = ''.obs;

  OrderController({required this.orderRepository});

  @override
  void onInit() {
    super.onInit();
    fetchOrders();
  }

  // Fetch all orders
  Future<void> fetchOrders() async {
    try {
      isLoading.value = true;
      final fetchedOrders = await orderRepository.getOrders();
      orders.assignAll(fetchedOrders);
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }

  // Fetch orders by date range
  Future<void> fetchOrdersByDateRange(DateTimeRange dateRange) async {
    try {
      isLoading.value = true;
      final fetchedOrders = await orderRepository.getOrdersByTime(dateRange);
      filteredOrders.assignAll(fetchedOrders);
      timeFilter.value = '${dateRange.start.toString().split(' ')[0]} - ${dateRange.end.toString().split(' ')[0]}';
    } catch (e) {
      isLoading.value = false;
      print('Error fetching orders by date range: $e');
    }
  }

  // Clear date range filter
  void clearDateRangeFilter() {
    filteredOrders.clear();
    timeFilter.value = '';
  }

  // Fetch a single order by id
  Future<void> fetchOrderById(int id) async {
    try {
      isLoading.value = true;
      final order = await orderRepository.getOrder(id);
      currentOrder.value = order;
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }

  // Get the current order by ID
  OrderEntity? getCurrentOrder() {
    return currentOrder.value;
  }

  // Check if a specific order exists in the list
  bool orderExists(int id) {
    return orders.any((order) => order.id == id);
  }
}
