import 'package:cached_network_image/cached_network_image.dart';
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
    UserEntity? user = _authController.user.value;
    var t = AppLocalizations.of(context)!;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 0.w),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          CircleAvatar(
            radius: 16.w,
            backgroundColor: FluukyTheme.secondaryColor,
            child: user != null && user.avatar != null
                ? ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: user.avatar!,
                      width: 32.w,
                      height: 32.w,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(),
                      errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.white),
                    ),
                  )
                : Container(),
          ),
          SizedBox(width: 12.w),
          Text(
            user != null ? '${t.translate('Welcome, ')} ${user.firstName}' : t.translate('Welcome, Guest'), // Handle null user
            style: FluukyTheme.lightTheme.textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}
