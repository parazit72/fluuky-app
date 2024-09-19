import 'package:fluuky/data/repositories/basket_repository_impl.dart';
import 'package:fluuky/domain/repositories/basket_repository.dart';
import 'package:fluuky/presentation/controllers/basket_controller.dart';
import 'package:get/get.dart';

class BasketBindings extends Bindings {
  @override
  void dependencies() async {
    Get.put(BasketRepositoryImpl());
    Get.put<BasketRepository>(Get.find<BasketRepositoryImpl>());

    Get.put(BasketController(Get.find<BasketRepository>()));
  }
}
