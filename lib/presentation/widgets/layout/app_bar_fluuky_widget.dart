import 'package:flutter/material.dart';
import 'package:fluuky/presentation/controllers/controllers.dart';
import 'package:fluuky/presentation/pages/basket/basket_screen.dart';
import 'package:fluuky/presentation/pages/notification_screen.dart';
import 'package:get/get.dart';

class AppBarFluuky extends StatelessWidget implements PreferredSizeWidget {
  const AppBarFluuky({super.key});

  void goNotification() {
    Get.to(() => const NotificationScreen());
  }

  void goBasket() {
    Get.to(() => BasketScreen());
  }

  @override
  Widget build(BuildContext context) {
    final NotificationController notificationController = Get.find();
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0xFFF7F7F7),
      title: Image.asset('assets/images/fluuky.png', height: 16, fit: BoxFit.contain, width: 100),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.notifications_outlined, size: 26),
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
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 14,
                              minHeight: 14,
                            ),
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
              icon: Image.asset('assets/images/basket.png', width: 26),
              onPressed: () => goBasket(),
            ),
          ],
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
