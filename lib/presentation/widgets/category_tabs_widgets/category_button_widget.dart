import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/items_controller.dart';
import 'package:get/get.dart';

Widget buildCategoryButtons(context) {
  final ItemsController controller = Get.find();
  return Obx(() {
    if (controller.selectedItemType.value == ItemType.draws) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:
            controller.raffleCategories.map((category) => _buildCategoryButton(category.id, category.name, category.iconPath, context)).toList(),
      );
    } else {
      return const SizedBox.shrink();
    }
  });
}

Widget _buildCategoryButton(int id, String text, String? iconPath, context) {
  final ItemsController controller = Get.find();
  var t = AppLocalizations.of(context)!;
  return Obx(() {
    bool isSelected = controller.selectedCategory.value == id;
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
            decoration: BoxDecoration(
              // backgroundBlendMode: BlendMode.colorBurn,
              color: isSelected ? FluukyTheme.fourthColor : Colors.transparent,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              boxShadow: [
                BoxShadow(color: FluukyTheme.secondaryColor),
                BoxShadow(color: isSelected ? FluukyTheme.fourthColor : Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
              ],
            ),
            child: IconButton(
              style: ElevatedButton.styleFrom(splashFactory: NoSplash.splashFactory, elevation: 0),
              onPressed: () => controller.selectedCategory.value = id,
              icon: SvgPicture.asset('assets/images/${iconPath ?? 'bag.svg'}',
                  width: 20.w,
                  height: 20.h,
                  colorFilter: ColorFilter.mode(isSelected ? FluukyTheme.primaryColor : FluukyTheme.fifthColor, BlendMode.srcIn)),
            )),
        SizedBox(height: 6.h),
        Text(
          t.translate(text.capitalizeFirst!),
          style: isSelected
              ? FluukyTheme.lightTheme.textTheme.labelSmall!.copyWith(color: FluukyTheme.primaryColor, fontWeight: FontWeight.w600)
              : FluukyTheme.lightTheme.textTheme.labelSmall!.copyWith(color: FluukyTheme.fifthColor, fontWeight: FontWeight.w600),
        ),
      ],
    );
  });
}
