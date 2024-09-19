class DetailModel {
  String? gender;
  String? location;
  String? nationality;
  String? interests;
  String? referralCode;
  String? country;
  String? city;
  String? addressLine1;
  String? addressLine2;
  String? state;
  String? zipCode;

  DetailModel({
    this.gender,
    this.location,
    this.nationality,
    this.interests,
    this.referralCode,
    this.country,
    this.city,
    this.addressLine1,
    this.addressLine2,
    this.state,
    this.zipCode,
  });

  // JSON Deserialization
  DetailModel.fromJson(Map<String, dynamic> json) {
    gender = json['gender'];
    location = json['location'];
    nationality = json['nationality'];
    interests = json['interests'];
    referralCode = json['referral_code'];
    country = json['country'];
    city = json['city'];
    addressLine1 = json['address_line_1'];
    addressLine2 = json['address_line_2'];
    state = json['state'];
    zipCode = json['zip_code'];
  }

  // JSON Serialization
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['gender'] = gender;
    data['location'] = location;
    data['nationality'] = nationality;
    data['interests'] = interests;
    data['referral_code'] = referralCode;
    data['country'] = country;
    data['city'] = city;
    data['address_line_1'] = addressLine1;
    data['address_line_2'] = addressLine2;
    data['state'] = state;
    data['zip_code'] = zipCode;
    return data;
  }
}
