import 'raffle_entity.dart';

class BasketItemEntity {
  final int id;
  final int quantity;
  final double price;
  final RaffleEntity raffle;

  BasketItemEntity({required this.id, required this.quantity, required this.raffle, required this.price});
}
