import 'package:flutter/material.dart';
import 'package:fluuky/presentation/controllers/items_controller.dart';
import 'package:get/get.dart';

Widget buildViewButtons() {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8),
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      boxShadow: [
        BoxShadow(color: Color(0xFFDBDBDB)),
        BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildViewButton(ViewType.list, Icons.list),
        _buildViewButton(ViewType.grid, Icons.grid_on),
      ],
    ),
  );
}

Widget _buildViewButton(ViewType type, IconData icon) {
  final ItemsController controller = Get.find();
  return Obx(() {
    bool isSelected = controller.viewType.value == type;
    return Expanded(
      child: Container(
        height: 32,
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(7)),
        ),
        child: TextButton(
          style: TextButton.styleFrom(splashFactory: NoSplash.splashFactory),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Icon(icon, size: 16, color: isSelected ? Theme.of(Get.context!).primaryColor : Colors.black),
              ),
              Text(type.name.capitalizeFirst!,
                  style:
                      Theme.of(Get.context!).textTheme.titleMedium!.copyWith(color: isSelected ? Theme.of(Get.context!).primaryColor : Colors.black)),
            ],
          ),
          onPressed: () => controller.viewType.value = type,
        ),
      ),
    );
  });
}
