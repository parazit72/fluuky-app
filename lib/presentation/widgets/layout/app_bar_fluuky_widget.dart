import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/presentation/controllers/controllers.dart';
import 'package:fluuky/presentation/pages/basket/basket_screen.dart';
import 'package:fluuky/presentation/pages/notification_screen.dart';
import 'package:fluuky/presentation/widgets/welcome_user_avatar.dart';
import 'package:get/get.dart';

class AppBarFluuky extends StatelessWidget implements PreferredSizeWidget {
  final bool showIcon;
  const AppBarFluuky({super.key, this.showIcon = false});
  void goNotification() {
    Get.to(() => const NotificationScreen());
  }

  void goBasket() {
    Get.to(() => const BasketScreen());
  }

  @override
  Widget build(BuildContext context) {
    final NotificationController notificationController = Get.find();
    return AppBar(
      toolbarHeight: 64.h,
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0xFFF7F7F7),
      title: showIcon ? SvgPicture.asset('assets/images/fluuky.svg', height: 16.h) : WelcomeUserAvatar(),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                IconButton(
                  icon: Icon(Icons.notifications_outlined, size: 20.w),
                  onPressed: () => goNotification(),
                ),
                Positioned(
                  right: 11.w,
                  top: 11.w,
                  child: Obx(() {
                    return notificationController.notificationCount.value > 0
                        ? Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            constraints: BoxConstraints(
                              minWidth: 14.w,
                              minHeight: 14.w,
                            ),
                            child: Text(
                              '${notificationController.notificationCount.value}',
                              style: TextStyle(color: Colors.white, fontSize: 8.w),
                              textAlign: TextAlign.center,
                            ),
                          )
                        : Container();
                  }),
                ),
              ],
            ),
            IconButton(
              icon: SvgPicture.asset('assets/images/basket.svg', height: 20.w),
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
