class WinnerCategoryEntity {
  final int id;
  final String name;
  final String slug;
  final String description;
  final int status;
  final int? parentId;
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
