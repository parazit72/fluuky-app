import 'package:flutter/material.dart';
import 'package:fluuky/data/models/basket_item_model.dart';
import 'package:fluuky/data/models/basket_model.dart';
import 'package:fluuky/domain/entities/raffle_entity.dart';
import 'package:fluuky/domain/repositories/basket_repository.dart';
import 'package:get/get.dart';

class BasketController extends GetxController {
  final BasketRepository basketRepository;
  var currentBasket = Rx<BasketModel?>(null);
  var isLoading = false.obs;
  var quantity = 1.obs;

  BasketController({required BasketRepository repository}) : basketRepository = repository;

  @override
  void onInit() {
    super.onInit();
    fetchBasket();
  }

  Future<void> fetchBasket() async {
    try {
      isLoading(true);
      var fetchedBasket = await basketRepository.fetchBasket();
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

  Future<void> addToCart(RaffleEntity raffle, int quantity) async {
    print(currentBasket);
    if (currentBasket.value != null) {
      // Create a new BasketItemModel from the RaffleEntity and quantity
      var newItem = BasketItemModel(
        id: raffle.id,
        quantity: quantity,
        price: raffle.price,
        raffle: raffle,
      );

      BasketItemModel? existingItem = currentBasket.value!.items.firstWhereOrNull(
        (item) => item.raffle.id == raffle.id,
      );

      if (existingItem != null) {
        // Update the quantity if the item already exists
        existingItem.quantity = quantity;
      } else {
        currentBasket.value!.items.add(newItem);
      }

      // Recalculate the total price based on updated items
      _calculateTotalPrice();

      // Update the repository (if necessary)
      await basketRepository.addToBasket(raffle.id, quantity);
      print('Added to cart: ${raffle.name}');
    } else {
      Get.snackbar('Error', 'Basket is empty, cannot add item.');
    }
  }

  void _calculateTotalPrice() {
    currentBasket.value!.totalPrice = currentBasket.value!.items.fold(
      0.0,
      (sum, item) => sum + (item.price * item.quantity),
    );
  }

  Future<void> removeFromCart(int raffleId) async {
    if (currentBasket.value != null) {
      // Remove the item with matching raffle ID
      currentBasket.value!.items.removeWhere((item) => item.raffle.id == raffleId);

      // Recalculate the total price
      _calculateTotalPrice();

      // Update the repository
      await basketRepository.addToBasket(raffleId, 0);
    } else {
      Get.snackbar('Error', 'Basket is empty, cannot remove item.');
    }
  }

  Future<void> clearBasket() async {
    currentBasket.value?.items.clear();
    currentBasket.value?.totalPrice = 0.0;
    // Optionally, update the repository if needed
    await basketRepository.clearBasket();
    print('Cleared basket');
  }

  void incrementQuantity() {
    quantity++;
  }

  void decrementQuantity() {
    if (quantity > 1) quantity--;
  }
}
