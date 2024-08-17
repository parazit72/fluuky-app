import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluuky/presentation/controllers/items_controller.dart';
import 'package:get/get.dart';

Widget buildCategoryButtons() {
  final ItemsController controller = Get.find();
  return Obx(() {
    if (controller.selectedItemType.value == ItemType.draws) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: controller.raffleCategories.map((category) => _buildCategoryButton(category.id, category.name, category.iconPath)).toList(),
      );
    } else {
      return const SizedBox.shrink();
    }
  });
}

Widget _buildCategoryButton(int id, String text, String? iconPath) {
  final ItemsController controller = Get.find();
  return Obx(() {
    bool isSelected = controller.selectedCategory.value == id;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
              decoration: BoxDecoration(
                // backgroundBlendMode: BlendMode.colorBurn,
                color: isSelected ? const Color(0xFFE9EFEB) : Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                boxShadow: const [BoxShadow(color: Colors.black26, spreadRadius: -4, blurRadius: 17)],
              ),
              child: IconButton(
                style: ElevatedButton.styleFrom(splashFactory: NoSplash.splashFactory, elevation: 0),
                onPressed: () => controller.selectedCategory.value = id,
                icon: SvgPicture.asset('assets/images/${iconPath ?? 'bag.svg'}',
                    width: 20,
                    height: 20,
                    colorFilter: ColorFilter.mode(isSelected ? Theme.of(Get.context!).primaryColor : const Color(0xFFB3B3B3), BlendMode.srcIn)),
              )),
          const SizedBox(height: 6),
          Text(
            text.capitalizeFirst!,
            style: isSelected
                ? Theme.of(Get.context!).textTheme.titleMedium!.copyWith(color: Theme.of(Get.context!).primaryColor)
                : Theme.of(Get.context!).textTheme.bodyLarge!.copyWith(color: const Color(0xFFB3B3B3)),
          ),
        ],
      ),
    );
  });
}
