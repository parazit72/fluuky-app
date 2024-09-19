import 'package:fluuky/data/models/detail_model.dart';
import 'package:fluuky/domain/entities/user_entity.dart';

class UserModel {
  String? firstName;
  String? lastName;
  String? avatar;
  String? birthDate;
  String? username;
  String? email;
  String? phone;
  String? countryCode;
  bool? acceptedTermsAndConditions;
  DetailModel? detail;

  UserModel({
    this.firstName,
    this.lastName,
    this.avatar,
    this.birthDate,
    this.username,
    this.email,
    this.phone,
    this.countryCode,
    this.acceptedTermsAndConditions,
    this.detail,
  });

  // JSON Deserialization
  UserModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
    birthDate = json['birth_date'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    countryCode = json['country_code'];
    acceptedTermsAndConditions = json['accepted_terms_and_conditions'];
    detail = json['detail'] != null ? DetailModel.fromJson(json['detail']) : null;
  }

  // JSON Serialization
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['avatar'] = avatar;
    data['birth_date'] = birthDate;
    data['username'] = username;
    data['email'] = email;
    data['phone'] = phone;
    data['country_code'] = countryCode;
    data['accepted_terms_and_conditions'] = acceptedTermsAndConditions;
    if (detail != null) {
      data['detail'] = detail!.toJson();
    }
    return data;
  }

  // Convert UserModel to UserEntity
  UserEntity toEntity() {
    return UserEntity(
      firstName: firstName ?? '',
      lastName: lastName ?? '',
      email: email ?? '',
      phone: phone ?? '',
      avatar: avatar,
      birthDate: birthDate != null ? DateTime.tryParse(birthDate!) : null,
      acceptedTermsAndConditions: acceptedTermsAndConditions ?? false,
    );
  }
}
