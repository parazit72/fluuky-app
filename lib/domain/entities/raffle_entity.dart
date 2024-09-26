import 'package:get/get.dart';

class RaffleEntity {
  final int id;
  final int categoryId;
  final int brandId;
  final int adminId;
  final String name;
  final String slug;
  final int capacity;
  RxBool isFavorite = false.obs;
  final String description;
  final String mainImage;
  final List<String> image;
  final double price;
  final String status;
  final DateTime deadline;

  RaffleEntity({
    required this.id,
    required this.categoryId,
    required this.brandId,
    required this.adminId,
    required this.name,
    required this.slug,
    required this.description,
    required this.capacity,
    required this.mainImage,
    required this.image,
    required this.price,
    required this.status,
    required this.deadline,
    isFavorite,
  });

  factory RaffleEntity.fromJson(Map<String, dynamic> json) {
    return RaffleEntity(
      id: json['id'],
      name: json['name'],
      adminId: json['admin_id'],
      categoryId: json['category_id'],
      brandId: json['brand_id'],
      slug: json['slug'],
      description: json['description'],
      capacity: json['capacity'],
      mainImage: json['main_image'],
      price: json['price'].toDouble(),
      status: json['status'],
      isFavorite: json['isFavorite'] ?? false.obs,
      image: List<String>.from(json['image']),
      deadline: DateTime.parse(json['deadline']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'admin_id': adminId,
      'category_id': categoryId,
      'brand_id': brandId,
      'slug': slug,
      'description': description,
      'capacity': capacity,
      'image': image,
      'main_image': mainImage,
      'price': price,
      'isFavorite': isFavorite,
      'status': status,
      'deadline': deadline.toIso8601String(),
    };
  }
}
