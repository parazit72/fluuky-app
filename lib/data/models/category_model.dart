import 'package:fluuky/data/models/raffle_model.dart';
import 'package:fluuky/domain/entities/category_entity.dart';
import 'package:fluuky/domain/entities/raffle_entity.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({
    required super.id,
    required super.name,
    required super.slug,
    required super.description,
    required super.status,
    required super.iconPath,
    // required List<RaffleModel> raffles,
  }) : super(
        // raffles: raffles.cast<RaffleEntity>(),
        );

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      description: json['description'],
      status: json['status'],
      iconPath: json['iconPath'] ?? '',
      // raffles: (json['raffles'] as List).map((raffle) => RaffleModel.fromJson(raffle)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'description': description,
      'status': status,
      'iconPath': iconPath,
      // 'raffles': raffles.map((raffle) => (raffle as RaffleModel).toJson()).toList(),
    };
  }
}
