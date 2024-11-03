import 'package:fluuky/data/models/basket_model.dart';

abstract class BasketRepository {
  Future<BasketModel?> fetchBasket();
  Future<void> clearBasket();
  Future<void> addToBasket(int raffleId, int quantity);
}
