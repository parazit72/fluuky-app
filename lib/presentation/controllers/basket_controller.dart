import 'package:fluuky/data/models/basket_model.dart';
import 'package:fluuky/domain/repositories/basket_repository.dart';
import 'package:get/get.dart';

class BasketController extends GetxController {
  final BasketRepository repository;
  var basket = BasketModel(id: 0, userId: 0, totalPrice: 0, items: []).obs;
  var isLoading = false.obs;

  BasketController(this.repository);

  @override
  void onInit() {
    super.onInit();
    fetchBasket();
  }

  Future<void> fetchBasket() async {
    try {
      isLoading(true);
      var fetchedBasket = await repository.fetchBasket();
      basket.value = fetchedBasket;
      print('Total Price: ${basket.value.totalPrice}');
      for (var item in basket.value.items) {
        print('Raffle: ${item.raffle.name}');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
