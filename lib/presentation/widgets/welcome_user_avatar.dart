import 'package:flutter/material.dart';
import 'package:fluuky/domain/entities/user_entity.dart';
import 'package:fluuky/presentation/controllers/auth_controller.dart';
import 'package:fluuky/presentation/widgets/locale_toggle_button.dart';
import 'package:get/get.dart';

class WelcomeUserAvatar extends StatelessWidget {
  final AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    UserEntity? user = _authController.user.value;
    user = UserEntity(
        firstName: 'John',
        lastName: 'Doe',
        email: 'john.doe@example.com',
        avatar: 'assets/images/avatar.jpg',
        acceptedTermsAndConditions: false,
        phone: '',
        birthDate: DateTime.now());
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 29),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          CircleAvatar(
            minRadius: 18,
            maxRadius: 20,
            backgroundImage: AssetImage(user.avatar ?? 'assets/images/avatar.jpg'),
          ),
          const SizedBox(width: 16),
          Text(' ${user.firstName}', style: Get.textTheme.titleLarge),
        ],
      ),
    );
  }
}
