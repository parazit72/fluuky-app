class UserEntity {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String? avatar;
  final DateTime? birthDate;
  final bool acceptedTermsAndConditions;

  UserEntity({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    this.avatar,
    this.birthDate,
    required this.acceptedTermsAndConditions,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phone: json['phone'],
      avatar: json['avatar'],
      birthDate: json['birth_date'],
      acceptedTermsAndConditions: json['accepted_terms_and_conditions'],
    );
  }
}
