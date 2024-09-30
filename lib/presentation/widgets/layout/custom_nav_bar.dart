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
    user = UserEntity(
      firstName: 'John',
      lastName: 'Doe',
      email: 'john.doe@example.com',
      avatar: 'assets/images/avatar.jpg',
      phone: '',
      birthDate: DateTime.now(),
      acceptedTermsAndConditions: false,
    );
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
          navBarController.selectedIndex.value = 0; // Default to home if route is unknown
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
          currentIndex: navBarController.selectedIndex.value,
          onTap: (index) {
            navBarController.changeIndex(index);
            switch (index) {
              case 0:
                userIsLoggedIn = _authController.checkAuthAndShowSheet();
                if (userIsLoggedIn) Get.toNamed(home);
                break;
              case 1:
                Get.toNamed(drawsList);
                break;
              case 2:
                userIsLoggedIn = _authController.checkAuthAndShowSheet();
                if (userIsLoggedIn) Get.toNamed(profile);
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
                      backgroundImage: AssetImage(user!.avatar ?? 'assets/images/avatar.jpg'),
                      radius: 12.w,
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
          if (navBarController.selectedIndex.value == index) Container(width: 125.w, height: 2.h, color: Theme.of(context).primaryColor),
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
