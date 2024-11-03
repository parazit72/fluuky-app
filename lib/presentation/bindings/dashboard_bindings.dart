import 'package:fluuky/domain/repositories/order_repository.dart';
import 'package:fluuky/domain/repositories/transaction_repository.dart';
import 'package:fluuky/presentation/controllers/order_controller.dart';
import 'package:fluuky/presentation/controllers/transaction_controller.dart';
import 'package:get/get.dart';

class DashboardBindings extends Bindings {
  @override
  void dependencies() async {
    // Register OrderRepository

    // Register OrderController with OrderRepository
    Get.lazyPut<OrderController>(() => OrderController(repository: Get.find<OrderRepository>()));
    Get.lazyPut<TransactionController>(() => TransactionController(repository: Get.find<TransactionRepository>()));

    // Register any use cases related to orders
    // Get.lazyPut<GetOrdersUseCase>(() => GetOrdersUseCase(Get.find<OrderRepository>()));
    // Get.lazyPut<PlaceOrderUseCase>(() => PlaceOrderUseCase(Get.find<OrderRepository>()));

    // Register any additional dependencies related to orders
    // Get.lazyPut<OrderItemsProvider>(() => OrderItemsProvider());
  }
}
