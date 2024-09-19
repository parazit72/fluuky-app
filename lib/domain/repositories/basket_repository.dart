import 'package:fluuky/data/models/basket_model.dart';

abstract class BasketRepository {
  Future<BasketModel> fetchBasket();
}
