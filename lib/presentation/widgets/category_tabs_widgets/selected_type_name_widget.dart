import 'package:flutter/material.dart';
import 'package:fluuky/presentation/controllers/items_controller.dart';
import 'package:get/get.dart';

Widget buildSelectedTypeName(BuildContext context) {
  return Obx(() {
    final ItemsController controller = Get.find();

    final selectedTypeName = _getSelectedTypeName(controller.selectedItemType.value);
    return Text(
      selectedTypeName.capitalizeFirst!,
      style: Theme.of(context).textTheme.titleLarge,
      textAlign: TextAlign.start,
    );
  });
}

String _getSelectedTypeName(ItemType type) {
  switch (type) {
    case ItemType.draws:
      return 'Draws';
    case ItemType.winners:
      return 'Winners';
    case ItemType.announcements:
      return 'Winning Announcements';
    default:
      return '';
  }
}
