import 'package:hive/hive.dart';

part 'raffle_model.g.dart';

@HiveType(typeId: 2)
class RaffleModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final int categoryId;

  @HiveField(2)
  final int brandId;

  @HiveField(3)
  final int adminId;

  @HiveField(4)
  final String name;

  @HiveField(5)
  final String slug;

  @HiveField(6)
  final String description;

  @HiveField(7)
  final int capacity;

  @HiveField(8)
  final List<String> images;

  @HiveField(9)
  final double price;

  @HiveField(10)
  final String status;

  @HiveField(11)
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
    required this.images,
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
      capacity: json['capacity'],
      images: List<String>.from(json['image']),
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
      'image': images,
      'price': price,
      'status': status,
      'deadline': deadline.toIso8601String(),
    };
  }
}
