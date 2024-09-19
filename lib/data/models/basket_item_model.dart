import 'package:fluuky/domain/entities/basket_item_entity.dart';

import 'raffle_model.dart';

class BasketItemModel {
  final int id;
  final int quantity;
  final double price;
  final RaffleModel raffle;

  BasketItemModel({required this.id, required this.quantity, required this.raffle, required this.price});

  BasketItemEntity toEntity() {
    return BasketItemEntity(
      id: id,
      quantity: quantity,
      price: price,
      raffle: raffle.toEntity(),
    );
  }

  factory BasketItemModel.fromJson(Map<String, dynamic> json) {
    return BasketItemModel(
      id: json['id'],
      price: json['price'].toDouble(),
      quantity: json['quantity'],
      raffle: RaffleModel.fromJson(json['raffle']),
    );
  }
}
