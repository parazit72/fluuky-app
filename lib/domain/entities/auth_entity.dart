import 'package:fluuky/domain/entities/user_entity.dart';

class AuthEntity {
  final String token;
  final int expiresIn;
  final String message;
  final UserEntity? user;

  AuthEntity({
    required this.token,
    required this.expiresIn,
    required this.message,
    this.user,
  });
}
