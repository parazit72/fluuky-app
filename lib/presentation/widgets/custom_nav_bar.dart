import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/presentation/controllers/controllers.dart';
import 'package:get/get.dart';

class CustomNavBar extends StatelessWidget {
  final NavBarController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return BottomNavigationBar(
        elevation: 0,
        selectedFontSize: 15,
        unselectedFontSize: 15,
        currentIndex: controller.selectedIndex.value,
        onTap: (index) {
          controller.changeIndex(index);
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, home);
              break;
            case 1:
              Navigator.pushReplacementNamed(context, drawsList);
              break;
            case 2:
              Navigator.pushReplacementNamed(context, profile);
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
          _buildNavItem(
            context,
            iconPath: 'assets/images/profile.svg',
            activeIconPath: 'assets/images/profile-active.svg',
            label: 'Profile',
            index: 2,
          ),
        ],
      );
    });
  }

  BottomNavigationBarItem _buildNavItem(BuildContext context,
      {required String iconPath, required String activeIconPath, required String label, required int index}) {
    return BottomNavigationBarItem(
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (controller.selectedIndex.value == index)
            Container(
              width: 125,
              height: 2,
              color: Theme.of(context).primaryColor,
            ),
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
