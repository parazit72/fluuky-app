import 'package:fluuky/domain/entities/basket_entity.dart';

import 'basket_item_model.dart';

class BasketModel {
  final double totalPrice;
  final List<BasketItemModel> items;

  BasketModel({required this.totalPrice, required this.items, required int id, required int userId});

  BasketEntity toEntity() {
    return BasketEntity(
      totalPrice: totalPrice,
      raffles: items.map((item) => item.toEntity()).toList(),
    );
  }

  factory BasketModel.fromJson(Map<String, dynamic> json) {
    return BasketModel(
      id: json['id'],
      userId: json['user_id'],
      totalPrice: json['total_price'].toDouble(),
      items: (json['items'] as List).map((itemJson) => BasketItemModel.fromJson(itemJson)).toList(),
    );
  }
}
