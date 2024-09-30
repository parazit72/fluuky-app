import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/presentation/controllers/auth_controller.dart';
import 'package:fluuky/presentation/controllers/items_controller.dart';
import 'package:get/get.dart';

Widget TypeButtonWidget({required ItemType type, required String text}) {
  final ItemsController itemsController = Get.find();
  final AuthController authController = Get.find();

  return Obx(() {
    bool isSelected = itemsController.selectedItemType.value == type;

    return Expanded(
      child: Container(
        // margin: const EdgeInsets.only(left: 8, bottom: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.w),
          boxShadow: [
            BoxShadow(color: FluukyTheme.primaryColor.withOpacity(0.15)),
            BoxShadow(color: FluukyTheme.fourthColor, spreadRadius: -4.0, blurRadius: 8.6),
          ],
        ),
        height: 32.h,
        width: 335.w,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(elevation: 0, backgroundColor: isSelected ? FluukyTheme.primaryColor : Colors.transparent),
          onPressed: () {
            if (type == ItemType.winners) {
              var userIsLoggedIn = authController.checkAuthAndShowSheet();
              if (userIsLoggedIn) {
                itemsController.selectedItemType.value = type;
              }
              if (type == ItemType.winners || type == ItemType.announcements) {
                itemsController.viewType.value = ViewType.list;
              }
            } else {
              itemsController.selectedItemType.value = type;
              itemsController.viewType.value = ViewType.list;
            }
          },
          child: Text(
            text,
            softWrap: false,
            style: isSelected
                ? FluukyTheme.lightTheme.textTheme.bodyMedium!.copyWith(color: Colors.white, fontSize: 16.h)
                : FluukyTheme.lightTheme.textTheme.labelMedium!.copyWith(color: FluukyTheme.primaryColor, fontSize: 16.h),
          ),
        ),
      ),
    );
  });
}
