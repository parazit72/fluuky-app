import 'package:fluuky/domain/entities/winner_entity.dart';

class WinnerCategoryEntity {
  final int id;
  final String? name;
  final String? slug;
  final String? description;
  final List<WinnerEntity>? winnerEntities;

  WinnerCategoryEntity({
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
    this.winnerEntities,
  });
}
