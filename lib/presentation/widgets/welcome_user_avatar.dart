import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/domain/entities/user_entity.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/auth_controller.dart';
import 'package:get/get.dart';

class WelcomeUserAvatar extends StatelessWidget {
  final AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
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
      padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 20.w),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          CircleAvatar(
            radius: 16.w,
            backgroundImage: AssetImage(user.avatar ?? 'assets/images/avatar.jpg'),
          ),
          SizedBox(width: 12.w),
          Text('${t.translate('Welcome, ')} ${user.firstName}', style: FluukyTheme.lightTheme.textTheme.labelMedium),
        ],
      ),
    );
  }
}
