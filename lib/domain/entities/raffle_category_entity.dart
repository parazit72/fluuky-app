import 'package:fluuky/domain/entities/raffle_entity.dart';

class RaffleCategoryEntity {
  int? id;
  String? name;
  String? slug;
  String? description;
  String? status;
  int? parentId;
  String? activeIconPath;
  String? inactiveIconPath;
  List<RaffleEntity>? raffles;

  RaffleCategoryEntity(
      {this.id, this.name, this.slug, this.description, this.status, this.parentId, this.raffles, this.activeIconPath, this.inactiveIconPath});

  RaffleCategoryEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    activeIconPath = json['active_icon_path'];
    inactiveIconPath = json['inactive_icon_path'];
    status = json['status'];
    parentId = json['parent_id'];
    if (json['raffles'] != null) {
      raffles = <RaffleEntity>[];
      json['raffles'].forEach((v) {
        raffles!.add(RaffleEntity.fromJson(v));
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
      data['raffles'] = raffles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
