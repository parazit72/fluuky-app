import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/items_controller.dart';
// import 'package:fluuky/presentation/controllers/raffle_controller.dart';
import 'package:fluuky/presentation/widgets/category_tabs_widgets/category_tabs_widgets.dart';
import 'package:get/get.dart';

class CategoryTabsSection extends StatelessWidget {
  final ItemsController itemsController = Get.find();
  // final RaffleController raffleController = Get.find();
  var t = AppLocalizations.of(Get.context!)!;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 14),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TypeButtonWidget(type: ItemType.draws, text: t.translate('Draws')),
                SizedBox(width: 16.w),
                TypeButtonWidget(type: ItemType.winners, text: t.translate('Winners')),
              ],
            ),
          ),
          Obx(() {
            if (itemsController.selectedItemType.value != ItemType.draws) {
              return Container();
            }
            {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(height: 40.h),
                    Obx(() {
                      final ItemsController controller = Get.find();
                      final selectedTypeName = () {
                        switch (controller.selectedItemType.value) {
                          case ItemType.draws:
                            return t.translate('Draws');
                          case ItemType.winners:
                            return t.translate('Winners');
                          // case ItemType.announcements:
                          //   return t.translate('Winning Announcements');
                          default:
                            return '';
                        }
                      }();

                      return Text(
                        selectedTypeName.capitalizeFirst!,
                        style: FluukyTheme.lightTheme.textTheme.titleLarge,
                        textAlign: TextAlign.start,
                      );
                    }),
                    SizedBox(height: 24.h),
                    // buildViewButtons(context),
                  ],
                ),
              );
            }
          }),
          SizedBox(
            width: 375.w,
            // padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(() {
                  if (itemsController.selectedItemType.value == ItemType.draws && itemsController.viewType.value != ViewType.grid) {
                    return buildCategoryButtons(context);
                  } else {
                    return const SizedBox.shrink();
                  }
                }),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Divider(height: 40.h),
                ),
                buildItemsList(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
