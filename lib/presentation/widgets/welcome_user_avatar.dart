import 'package:flutter/material.dart';
import 'package:fluuky/domain/entities/user_entity.dart';
import 'package:fluuky/presentation/controllers/auth/auth_controller.dart';
import 'package:get/get.dart';

class WelcomeUserAvatar extends StatelessWidget {
  final AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    UserEntity? user = _authController.user.value;
    user = UserEntity(id: '1', name: 'John Doe', email: 'john.doe@example.com', avatar: 'assets/images/avatar.jpg', token: '');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          CircleAvatar(
            minRadius: 18,
            maxRadius: 20,
            backgroundImage: AssetImage(user.avatar != '' ? user.avatar : 'assets/images/avatar.jpg'),
          ),
          const SizedBox(width: 16),
          Text('Welcome, ${user.name}', style: Get.textTheme.titleLarge),
        ],
      ),
    );
  }
}
