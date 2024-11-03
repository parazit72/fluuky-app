import 'package:fluuky/domain/entities/basket_item_entity.dart';
import 'package:fluuky/domain/entities/raffle_entity.dart';

class BasketItemModel {
  final int id;
  int quantity;
  final double price;
  final RaffleEntity raffle;

  BasketItemModel({required this.id, required this.quantity, required this.raffle, required this.price});

  BasketItemEntity toEntity() {
    return BasketItemEntity(
      id: id,
      quantity: quantity,
      price: price,
      raffle: raffle,
    );
  }

  factory BasketItemModel.fromJson(Map<String, dynamic> json) {
    return BasketItemModel(
      id: json['id'],
      price: json['price'].toDouble(),
      quantity: json['quantity'],
      raffle: RaffleEntity.fromJson(json['raffle']),
    );
  }
}
