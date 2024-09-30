import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/domain/entities/announcement_entity.dart';
import 'package:fluuky/domain/entities/raffle_entity.dart';
import 'package:fluuky/domain/entities/winner_entity.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/items_controller.dart';
import 'package:fluuky/presentation/controllers/raffle_controller.dart';
import 'package:fluuky/presentation/widgets/category_tabs_widgets/announcement_card_widget.dart';
import 'package:fluuky/presentation/widgets/category_tabs_widgets/raffle_card_widget.dart';
import 'package:fluuky/presentation/widgets/category_tabs_widgets/winner_card_widget.dart';
import 'package:get/get.dart';

Widget buildItemsList(context) {
  final ItemsController itemsController = Get.find();
  final RaffleController raffleController = Get.find();
  var t = AppLocalizations.of(context)!;
  return Obx(() {
    if (itemsController.selectedItemType.value == ItemType.draws) {
      if (itemsController.viewType.value == ViewType.list) {
        return _buildItemsView<RaffleEntity>(
          raffleController.filteredRaffles,
          (raffle) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(t.translate('plantXTrees') + raffle.name, style: FluukyTheme.lightTheme.textTheme.titleLarge),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: RaffleCardWidget(raffle: raffle, viewType: ViewType.list),
              ),
            ],
          ),
        );
      } else {
        return _buildCategoryGridView<RaffleEntity>(
          raffleController.filteredRaffles,
          (raffle) => RaffleCardWidget(raffle: raffle, viewType: ViewType.grid),
        );
      }
    } else if (itemsController.selectedItemType.value == ItemType.winners) {
      return _buildCategoryGridView<WinnerEntity>(
        itemsController.winners,
        (winner) => WinnerCardWidget(winner: winner),
      );
    } else {
      return _buildItemsView<AnnouncementEntity>(
        itemsController.announcements,
        (announcement) => AnnouncementCardWidget(announcement: announcement),
      );
    }
  });
}

Widget _buildItemsView<T>(List<T> items, Widget Function(T) itemBuilder) {
  final ItemsController controller = Get.find();
  if (controller.viewType.value == ViewType.list) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(children: items.map((item) => itemBuilder(item)).toList()),
      ),
    );
  } else {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: items.length,
      itemBuilder: (context, index) => itemBuilder(items[index]),
    );
  }
}

Widget _buildCategoryGridView<T>(
  List<T> items,
  Widget Function(T) itemBuilder,
) {
  RxList categories;
  final ItemsController itemsController = Get.find();
  final RaffleController raffleController = Get.find();

  if (itemsController.selectedItemType.value == ItemType.draws) {
    categories = raffleController.raffleCategories;
  } else {
    categories = itemsController.winnerCategories;
  }

  return Column(
    children: categories.map((category) {
      final categoryItems = items.where((item) => (item as dynamic).categoryId == category.id).toList();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Text(
              category.name,
              style: FluukyTheme.lightTheme.textTheme.titleMedium,
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(height: 10.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [SizedBox(width: 20.w), ...categoryItems.map((item) => itemBuilder(item))]),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Divider(height: 20.h),
          ),
        ],
      );
    }).toList(),
  );
}
