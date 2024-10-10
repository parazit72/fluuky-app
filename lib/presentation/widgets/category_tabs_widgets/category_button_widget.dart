import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/items_controller.dart';
import 'package:fluuky/presentation/controllers/raffle_controller.dart';
import 'package:get/get.dart';

Widget buildCategoryButtons(context) {
  final ItemsController itemController = Get.find();
  final RaffleController raffleController = Get.find();

  return Obx(() {
    if (itemController.selectedItemType.value == ItemType.draws) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Get.locale == const Locale('en') ? SizedBox(width: 20.w) : Container(),
            ...raffleController.raffleCategories.asMap().entries.map((entry) {
              final isLast = entry.key == raffleController.raffleCategories.length - 1;
              final category = entry.value;
              return _buildCategoryButton(category.id!, category.name!, category.activeIconPath, context, isLast);
            }),
            Get.locale == const Locale('ar') ? SizedBox(width: 20.w) : Container(),
          ],
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  });
}

Widget _buildCategoryButton(int id, String text, String? iconPath, context, bool isLast) {
  final RaffleController raffleController = Get.find();
  var t = AppLocalizations.of(context)!;
  return Obx(() {
    bool isSelected = raffleController.selectedCategory.value == id;
    return Padding(
      padding: EdgeInsets.only(right: isLast ? 0 : 44.w),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.w)),
                boxShadow: [
                  BoxShadow(color: isSelected ? FluukyTheme.primaryShadowColor : FluukyTheme.secondaryColor, spreadRadius: 4.0),
                  BoxShadow(color: isSelected ? FluukyTheme.fourthColor : Colors.white70, spreadRadius: -4.0, blurRadius: 8.6),
                ],
              ),
              child: IconButton(
                style: ElevatedButton.styleFrom(splashFactory: NoSplash.splashFactory, elevation: 0),
                onPressed: () {
                  raffleController.selectedCategory.value = id;
                },
                icon: SvgPicture.asset('assets/images/${iconPath != "" ? iconPath : 'bag.svg'}',
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
      ),
    );
  });
}
