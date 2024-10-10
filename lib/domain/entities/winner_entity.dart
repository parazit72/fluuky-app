import 'package:fluuky/domain/entities/raffle_entity.dart';

class WinnerEntity {
  String? firstName;
  String? lastName;
  String? avatar;
  String? birthDate;
  String? username;
  String? email;
  String? phone;
  String? countryCode;
  bool? acceptedTermsAndConditions;
  RaffleEntity? raffle;

  WinnerEntity(
      {this.firstName,
      this.lastName,
      this.avatar,
      this.birthDate,
      this.username,
      this.email,
      this.phone,
      this.countryCode,
      this.acceptedTermsAndConditions,
      this.raffle});

  WinnerEntity.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
    birthDate = json['birth_date'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    countryCode = json['country_code'];
    acceptedTermsAndConditions = json['accepted_terms_and_conditions'];
    raffle = json['raffle'] != null ? RaffleEntity.fromJson(json['raffle']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['avatar'] = avatar;
    data['birth_date'] = birthDate;
    data['username'] = username;
    data['email'] = email;
    data['phone'] = phone;
    data['country_code'] = countryCode;
    data['accepted_terms_and_conditions'] = acceptedTermsAndConditions;
    if (raffle != null) {
      data['raffle'] = raffle!.toJson();
    }
    return data;
  }
}
