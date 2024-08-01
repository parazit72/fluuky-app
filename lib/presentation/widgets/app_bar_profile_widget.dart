import 'package:flutter/material.dart';
import 'package:fluuky/presentation/controllers/controllers.dart';
import 'package:fluuky/presentation/pages/notification_screen.dart';
import 'package:get/get.dart';

class AppBarProfile extends StatelessWidget implements PreferredSizeWidget {
  final String username;

  AppBarProfile({super.key, required this.username});

  void goNotification() {
    Get.offAll(() => const NotificationScreen());
  }

  @override
  Widget build(BuildContext context) {
    final NotificationController notificationController = Get.find();
    return AppBar(
      leading: const Padding(
        padding: EdgeInsets.all(8.0),
        child: CircleAvatar(backgroundImage: AssetImage('assets/images/avatar.jpg')),
      ),
      title: Text('Welcome, $username'),
      actions: [
        Stack(
          children: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () => goNotification(),
            ),
            Positioned(
              right: 11,
              top: 11,
              child: Obx(() {
                return notificationController.notificationCount.value > 0
                    ? Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 14,
                          minHeight: 14,
                        ),
                        child: Text(
                          '${notificationController.notificationCount.value}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    : Container();
              }),
            ),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.shopping_basket),
          onPressed: () {
            // Navigate to cart page
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
