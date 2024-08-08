import 'package:flutter/material.dart';
import 'package:fluuky/domain/entities/user_entity.dart';
import 'package:fluuky/presentation/controllers/controllers.dart';
import 'package:fluuky/presentation/pages/notification_screen.dart';
import 'package:get/get.dart';

class AppBarProfile extends StatelessWidget implements PreferredSizeWidget {
  AppBarProfile({super.key});

  final AuthController _authController = Get.find<AuthController>();

  void goNotification() {
    Get.offAll(() => const NotificationScreen());
  }

  @override
  Widget build(BuildContext context) {
    UserEntity? user = _authController.user.value;
    final NotificationController notificationController = Get.find();
    user = UserEntity(id: '1', name: 'John Doe', email: 'john.doe@example.com', avatar: 'assets/images/avatar.jpg', token: '');
    return AppBar(
      backgroundColor: const Color(0xFFF7F7F7),
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(backgroundImage: AssetImage(user!.avatar != '' ? user.avatar : 'assets/images/avatar.jpg')),
      ),
      title: Text('Welcome, ${user.name}'),
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
                        constraints: const BoxConstraints(minWidth: 14, minHeight: 14),
                        child: Text(
                          '${notificationController.notificationCount.value}',
                          style: const TextStyle(color: Colors.white, fontSize: 8),
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
