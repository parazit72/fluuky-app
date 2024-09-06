import 'package:fluuky/domain/entities/raffle_entity.dart';

class OrderEntity {
  int? id;
  int? userId;
  int? totalPrice;
  String? status;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? country;
  String? city;
  String? addressLine1;
  String? addressLine2;
  Null? zipCode;
  List<Items>? items;

  OrderEntity(
      {this.id,
      this.userId,
      this.totalPrice,
      this.status,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.country,
      this.city,
      this.addressLine1,
      this.addressLine2,
      this.zipCode,
      this.items});

  OrderEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    totalPrice = json['total_price'];
    status = json['status'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    country = json['country'];
    city = json['city'];
    addressLine1 = json['address_line_1'];
    addressLine2 = json['address_line_2'];
    zipCode = json['zip_code'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['total_price'] = totalPrice;
    data['status'] = status;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['country'] = country;
    data['city'] = city;
    data['address_line_1'] = addressLine1;
    data['address_line_2'] = addressLine2;
    data['zip_code'] = zipCode;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? id;
  int? quantity;
  int? price;
  RaffleEntity? raffle;

  Items({this.id, this.quantity, this.price, this.raffle});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    price = json['price'];
    raffle = json['raffle'] != null ? RaffleEntity.fromJson(json['raffle']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['quantity'] = quantity;
    data['price'] = price;
    if (raffle != null) {
      data['raffle'] = raffle!.toJson();
    }
    return data;
  }
}
