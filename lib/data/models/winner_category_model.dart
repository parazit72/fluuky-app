import 'package:fluuky/domain/entities/winner_category_entity.dart';
import 'package:fluuky/domain/entities/winner_entity.dart';

class WinnerCategoryModel {
  final int id;
  final String name;
  final String slug;
  final String description;
  final List<WinnerEntity>? winners;

  WinnerCategoryModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
    this.winners,
  });

  factory WinnerCategoryModel.fromJson(Map<String, dynamic> json) {
    return WinnerCategoryModel(
      id: json['category_id'] ?? 0,
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      description: json['description'] ?? '',
      winners: json['winners'] != null ? (json['winners'] as List).map((winner) => WinnerEntity.fromJson(winner)).toList() : [],
    );
  }

  WinnerCategoryEntity toEntity() {
    return WinnerCategoryEntity(
      id: id,
      name: name,
      slug: slug,
      description: description,
      winnerEntities: winners,
    );
  }
}
