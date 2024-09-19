import '../../domain/entities/raffle_entity.dart';

class RaffleModel {
  final int id;
  final int categoryId;
  final int brandId;
  final int adminId;
  final String name;
  final String slug;
  final String description;
  final int capacity;
  final String mainImage;
  final List<String> image;
  final double price;
  final String status;
  final DateTime deadline;

  RaffleModel({
    required this.id,
    required this.categoryId,
    required this.brandId,
    required this.adminId,
    required this.name,
    required this.slug,
    required this.description,
    required this.capacity,
    required this.image,
    required this.mainImage,
    required this.price,
    required this.status,
    required this.deadline,
  });

  // Factory method to create a RaffleModel from JSON
  factory RaffleModel.fromJson(Map<String, dynamic> json) {
    return RaffleModel(
      id: json['id'],
      categoryId: json['category_id'],
      brandId: json['brand_id'],
      adminId: json['admin_id'],
      name: json['name'],
      slug: json['slug'],
      description: json['description'],
      mainImage: json['main_image'],
      capacity: json['capacity'],
      image: List<String>.from(json['image']),
      price: json['price'].toDouble(),
      status: json['status'],
      deadline: DateTime.parse(json['deadline']),
    );
  }

  // Method to convert RaffleModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category_id': categoryId,
      'brand_id': brandId,
      'admin_id': adminId,
      'name': name,
      'slug': slug,
      'description': description,
      'capacity': capacity,
      'image': image,
      'mainImage': mainImage,
      'price': price,
      'status': status,
      'deadline': deadline.toIso8601String(),
    };
  }

  // Method to convert RaffleModel to RaffleEntity
  RaffleEntity toEntity() {
    return RaffleEntity(
      id: id,
      categoryId: categoryId,
      brandId: brandId,
      adminId: adminId,
      name: name,
      slug: slug,
      description: description,
      capacity: capacity,
      image: image,
      price: price,
      status: status,
      deadline: deadline,
      mainImage: mainImage,
    );
  }
}
