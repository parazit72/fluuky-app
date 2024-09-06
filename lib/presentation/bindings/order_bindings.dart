import 'package:fluuky/data/repositories/order_repository_impl.dart';
import 'package:fluuky/domain/repositories/order_repository.dart';
import 'package:fluuky/presentation/controllers/order_controller.dart';
import 'package:get/get.dart';

class OrderBindings extends Bindings {
  @override
  void dependencies() async {
    // Register OrderRepository
    Get.lazyPut<OrderRepository>(() => OrderRepositoryImpl());

    // Register OrderController with OrderRepository
    Get.lazyPut<OrderController>(() => OrderController(orderRepository: Get.find<OrderRepository>()));

    // Register any use cases related to orders
    // Get.lazyPut<GetOrdersUseCase>(() => GetOrdersUseCase(Get.find<OrderRepository>()));
    // Get.lazyPut<PlaceOrderUseCase>(() => PlaceOrderUseCase(Get.find<OrderRepository>()));

    // Register any additional dependencies related to orders
    // Get.lazyPut<OrderItemsProvider>(() => OrderItemsProvider());
  }
}
