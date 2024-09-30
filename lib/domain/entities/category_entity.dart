import 'package:fluuky/domain/entities/raffle_entity.dart';

class CategoryEntity {
  final int id;
  final String name;
  final String slug;
  final String iconPath;
  final String description;
  final int status;
  // final List<RaffleEntity> raffles;

  CategoryEntity({
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
    required this.status,
    required this.iconPath,
    // required this.raffles,
  });
}
