import 'package:flutter/material.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/presentation/controllers/controllers.dart';
import 'package:get/get.dart';

class CustomNavBar extends StatelessWidget {
  final NavBarController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return BottomNavigationBar(
        currentIndex: controller.selectedIndex.value,
        onTap: (index) {
          controller.changeIndex(index);
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, home);
              break;
            case 1:
              Navigator.pushReplacementNamed(context, draws);
              break;
            case 2:
              Navigator.pushReplacementNamed(context, profile);
              break;
          }
        },
        items: [
          _buildNavItem(
            context,
            icon: Icons.home,
            label: 'Home',
            index: 0,
          ),
          _buildNavItem(
            context,
            icon: Icons.card_giftcard,
            label: 'Draws',
            index: 1,
          ),
          _buildNavItem(
            context,
            icon: Icons.person,
            label: 'Profile',
            index: 2,
          ),
        ],
      );
    });
  }

  BottomNavigationBarItem _buildNavItem(BuildContext context, {required IconData icon, required String label, required int index}) {
    return BottomNavigationBarItem(
      icon: Stack(
        children: [
          Icon(
            icon,
            color: controller.selectedIndex.value == index ? Theme.of(context).primaryColor : Colors.grey,
          ),
          if (controller.selectedIndex.value == index)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 2,
                color: Theme.of(context).primaryColor,
              ),
            ),
        ],
      ),
      label: label,
    );
  }
}
