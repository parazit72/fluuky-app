class UserEntity {
  final String id;
  final String email;
  final String name;
  String token = '';
  String avatar = '';

  UserEntity({required this.id, required this.email, required this.name, required this.token, required this.avatar});

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json['id'],
      name: json['name'],
      token: json['token'],
      email: json['email'],
      avatar: json['avatar'],
    );
  }
}
