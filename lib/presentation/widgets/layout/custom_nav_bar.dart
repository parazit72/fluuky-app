import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/domain/entities/user_entity.dart';
import 'package:fluuky/presentation/controllers/controllers.dart';
import 'package:get/get.dart';

class CustomNavBar extends StatelessWidget {
  final NavBarController controller = Get.find();
  final AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    UserEntity? user = _authController.user.value;
    user = UserEntity(id: '1', name: 'John Doe', email: 'john.doe@example.com', avatar: 'assets/images/avatar.jpg', token: '');
    return Obx(() {
      return NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
            (Set<WidgetState> states) =>
                states.contains(WidgetState.selected) ? TextStyle(color: FluukyTheme.primaryColor) : const TextStyle(color: Colors.black),
          ),
        ),
        child: BottomNavigationBar(
          // backgroundColor: Colors.transparent,
          elevation: 0,
          selectedFontSize: 15,
          unselectedFontSize: 15,
          currentIndex: controller.selectedIndex.value,
          onTap: (index) {
            controller.changeIndex(index);
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
          },
          items: [
            _buildNavItem(
              context,
              iconPath: 'assets/images/home.svg',
              activeIconPath: 'assets/images/home-active.svg',
              label: 'Home',
              index: 0,
            ),
            _buildNavItem(
              context,
              iconPath: 'assets/images/draw.svg',
              activeIconPath: 'assets/images/draw-active.svg',
              label: 'Draws',
              index: 1,
            ),
            BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (controller.selectedIndex.value == 2) Container(width: 125, height: 2, color: Theme.of(context).primaryColor),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: controller.selectedIndex.value == 2 ? Border.all(color: FluukyTheme.primaryColor, width: 2.0) : null,
                    ),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(user!.avatar != '' ? user.avatar : 'assets/images/avatar.jpg'),
                      minRadius: 15,
                      maxRadius: 15,
                    ),
                  ),
                ],
              ),
              label: 'Profile',
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
          if (controller.selectedIndex.value == index) Container(width: 125, height: 2, color: Theme.of(context).primaryColor),
          const SizedBox(height: 11),
          SvgPicture.asset(
            controller.selectedIndex.value == index ? activeIconPath : iconPath,
            width: 25,
          ),
        ],
      ),
      label: label,
    );
  }
}
