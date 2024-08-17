import 'package:hive/hive.dart';

part 'winner_category_entity.g.dart';

@HiveType(typeId: 3)
class WinnerCategoryEntity {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String slug;

  @HiveField(3)
  final String description;

  @HiveField(4)
  final int status;

  @HiveField(5)
  final int? parentId;

  @HiveField(6)
  final String? iconPath;

  WinnerCategoryEntity({
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
    required this.status,
    required this.iconPath,
    this.parentId,
  });
}
