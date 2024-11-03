import 'package:fluuky/data/models/raffle_model.dart';
import 'package:fluuky/domain/entities/raffle_category_entity.dart';

class RaffleCategoryModel {
  String? id;
  String? name;
  String? slug;
  String? description;
  String? status;
  String? activeIconPath;
  String? inactiveIconPath;
  String? parentId;
  List<RaffleModel>? raffles;

  RaffleCategoryModel({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.status,
    this.parentId,
    this.raffles,
    this.activeIconPath,
    this.inactiveIconPath,
  });

  RaffleCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    status = json['status'];
    parentId = json['parent_id'];
    activeIconPath = json['active_icon_path'];
    inactiveIconPath = json['inactive_icon_path'];
    if (json['raffles'] != null) {
      raffles = <RaffleModel>[];
      json['raffles'].forEach((raffle) {
        raffles!.add(RaffleModel.fromJson(raffle));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['description'] = description;
    data['active_icon_path'] = activeIconPath;
    data['inactive_icon_path'] = inactiveIconPath;
    data['status'] = status;
    data['parent_id'] = parentId;
    if (raffles != null) {
      data['raffles'] = raffles!.map((raffle) => raffle.toJson()).toList();
    }
    return data;
  }

  // Method to convert RaffleModel to RaffleEntity
  RaffleCategoryEntity toEntity() {
    return RaffleCategoryEntity(
      id: id as int?,
      name: name,
      slug: slug,
      description: description,
      status: status as int?,
      parentId: parentId as int?,
      activeIconPath: activeIconPath,
      inactiveIconPath: inactiveIconPath,
      raffles: raffles?.map((raffle) => raffle.toEntity()).toList(),
    );
  }
}
