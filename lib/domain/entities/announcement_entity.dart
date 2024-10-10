import 'package:fluuky/domain/entities/winner_entity.dart';

class AnnouncementEntity {
  int? id;
  int? categoryId;
  int? brandId;
  int? adminId;
  String? name;
  String? slug;
  String? description;
  int? capacity;
  String? mainImage;
  List<String>? image;
  int? price;
  String? status;
  String? deadline;
  String? lotteryVideo;
  WinnerEntity? winner;

  AnnouncementEntity(
      {this.id,
      this.categoryId,
      this.brandId,
      this.adminId,
      this.name,
      this.slug,
      this.description,
      this.capacity,
      this.mainImage,
      this.image,
      this.price,
      this.status,
      this.deadline,
      this.lotteryVideo,
      this.winner});

  AnnouncementEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    brandId = json['brand_id'];
    adminId = json['admin_id'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    capacity = json['capacity'];
    mainImage = json['main_image'];
    image = json['image'].cast<String>();
    price = json['price'];
    status = json['status'];
    deadline = json['deadline'];
    lotteryVideo = json['lottery_video'];
    winner = json['winner'] != null ? WinnerEntity.fromJson(json['winner']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['brand_id'] = brandId;
    data['admin_id'] = adminId;
    data['name'] = name;
    data['slug'] = slug;
    data['description'] = description;
    data['capacity'] = capacity;
    data['main_image'] = mainImage;
    data['image'] = image;
    data['price'] = price;
    data['status'] = status;
    data['deadline'] = deadline;
    data['lottery_video'] = lotteryVideo;
    if (winner != null) {
      data['winner'] = winner!.toJson();
    }
    return data;
  }
}
