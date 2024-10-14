import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/domain/entities/user_entity.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/controllers.dart';
import 'package:get/get.dart';

class CustomNavBar extends StatelessWidget {
  final NavBarController navBarController = Get.find();
  final AuthController _authController = Get.find<AuthController>();
  bool userIsLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    UserEntity? user = _authController.user.value;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      switch (Get.currentRoute) {
        case home:
          navBarController.selectedIndex.value = 0;
          break;
        case drawsList:
          navBarController.selectedIndex.value = 1;
          break;
        case profile:
          navBarController.selectedIndex.value = 2;
          break;
        default:
          navBarController.selectedIndex.value = 1; // Default to drawlist if route is unknown
      }
    });
    return Obx(() {
      return NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
            (Set<WidgetState> states) =>
                states.contains(WidgetState.selected) ? TextStyle(color: FluukyTheme.primaryColor) : const TextStyle(color: Colors.black),
          ),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          selectedFontSize: 15.w,
          unselectedFontSize: 15.w,
          type: BottomNavigationBarType.fixed,
          currentIndex: navBarController.selectedIndex.value,
          onTap: (index) {
            userIsLoggedIn = _authController.checkAuthAndShowSheet(index: index);
            if (!userIsLoggedIn && index != 1) return;

            navBarController.changeIndex(index);
            switch (index) {
              case 0:
                Get.toNamed(home);
                break;
              case 1:
                Get.toNamed(drawsList);
                break;
              case 2:
                Get.toNamed(profile);
                break;
            }
            navBarController.changeIndex(index); // Ensure the index is updated
          },
          items: [
            _buildNavItem(
              context,
              iconPath: 'assets/images/home.svg',
              activeIconPath: 'assets/images/home-active.svg',
              label: t.translate('Home'),
              index: 0,
            ),
            _buildNavItem(
              context,
              iconPath: 'assets/images/draw.svg',
              activeIconPath: 'assets/images/draw-active.svg',
              label: t.translate('Draws'),
              index: 1,
            ),
            BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (navBarController.selectedIndex.value == 2) Container(width: 125.w, height: 2.h, color: FluukyTheme.primaryColor),
                  SizedBox(height: 8.h),
                  Container(
                    width: 24.w,
                    height: 24.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: navBarController.selectedIndex.value == 2 ? Border.all(color: FluukyTheme.primaryColor, width: 2.w) : null,
                    ),
                    child: CircleAvatar(
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
                  ),
                ],
              ),
              label: t.translate('Profile'),
            )
          ],
        ),
      );
    });
  }

  BottomNavigationBarItem _buildNavItem(BuildContext context,
      {required String iconPath, required String activeIconPath, required String label, required int index}) {
    return BottomNavigationBarItem(
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (navBarController.selectedIndex.value == index) Container(width: 125.w, height: 2.h, color: FluukyTheme.primaryColor),
          SizedBox(height: 11.h),
          SvgPicture.asset(
            navBarController.selectedIndex.value == index ? activeIconPath : iconPath,
            width: 20.w,
          ),
        ],
      ),
      label: label,
    );
  }
}
