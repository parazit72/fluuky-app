import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  var notificationCount = 0.obs;

  void increment() {
    notificationCount.value++;
  }

  void clear() {
    notificationCount.value = 0;
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String username;
  final NotificationController notificationController = Get.put(NotificationController());

  CustomAppBar({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Padding(
        padding: EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/images/avatar.jpg'),
        ),
      ),
      title: Text('Welcome, $username'),
      actions: [
        Stack(
          children: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                // Navigate to notifications page
              },
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
