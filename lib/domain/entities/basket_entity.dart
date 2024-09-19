import 'basket_item_entity.dart';

class BasketEntity {
  final double totalPrice;
  final List<BasketItemEntity> raffles;

  BasketEntity({required this.totalPrice, required this.raffles});
}
