import 'package:fluuky/data/models/basket_model.dart';
import 'package:fluuky/domain/repositories/basket_repository.dart';
import 'package:get/get.dart';

class BasketController extends GetxController {
  final BasketRepository repository;
  var currentBasket = Rx<BasketModel?>(null); // nullable type
  var isLoading = false.obs;

  BasketController(this.repository);

  Future<void> fetchBasket() async {
    try {
      isLoading(true);
      var fetchedBasket = await repository.fetchBasket();
      currentBasket.value = fetchedBasket;

      // Check if the basket is not null before accessing properties
      if (currentBasket.value != null) {
        print('Total Price: ${currentBasket.value!.totalPrice}');
        for (var item in currentBasket.value!.items) {
          print('Raffle: ${item.raffle.name}');
        }
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchRecommendations() async {
    try {
      isLoading(true);
      var fetchedBasket = await repository.fetchBasket();
      currentBasket.value = fetchedBasket;

      // Check if the basket is not null before accessing properties
      if (currentBasket.value != null) {
        print('Total Price: ${currentBasket.value!.totalPrice}');
        for (var item in currentBasket.value!.items) {
          print('Raffle: ${item.raffle.name}');
        }
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
