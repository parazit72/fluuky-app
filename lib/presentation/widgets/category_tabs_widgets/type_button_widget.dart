import 'package:flutter/material.dart';
import 'package:fluuky/presentation/controllers/items_controller.dart';
import 'package:get/get.dart';

Widget TypeButtonWidget({required ItemType type, required String text}) {
  final ItemsController itemsController = Get.find();

  return Obx(() {
    bool isSelected = itemsController.selectedItemType.value == type;

    return IntrinsicWidth(
      child: Container(
        margin: const EdgeInsets.only(left: 8, bottom: 8),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(color: Color(0xFFE9EFEB)),
            BoxShadow(color: Colors.white, spreadRadius: -4, blurRadius: 8.6),
          ],
        ),
        height: 38,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(elevation: 0, backgroundColor: isSelected ? Theme.of(Get.context!).primaryColor : const Color(0XFFE9EFEB)),
          onPressed: () {
            itemsController.selectedItemType.value = type;
            if (type == ItemType.winners || type == ItemType.announcements) {
              itemsController.viewType.value = ViewType.list;
            }
          },
          child: Text(
            text,
            softWrap: false,
            style: isSelected
                ? Theme.of(Get.context!).textTheme.titleMedium!.copyWith(color: Colors.white)
                : Theme.of(Get.context!).textTheme.bodyLarge!.copyWith(color: Theme.of(Get.context!).primaryColor),
          ),
        ),
      ),
    );
  });
}
