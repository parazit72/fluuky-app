import 'package:flutter/material.dart';
import 'package:fluuky/domain/entities/announcement_entity.dart';
import 'package:fluuky/domain/entities/raffle_entity.dart';
import 'package:fluuky/domain/entities/winner_entity.dart';
import 'package:fluuky/presentation/controllers/items_controller.dart';
import 'package:fluuky/presentation/controllers/raffle_controller.dart';
import 'package:fluuky/presentation/widgets/category_tabs_widgets/announcement_card_widget.dart';
import 'package:fluuky/presentation/widgets/category_tabs_widgets/raffle_card_widget.dart';
import 'package:fluuky/presentation/widgets/category_tabs_widgets/winner_card_widget.dart';
import 'package:get/get.dart';

Widget buildItemsList() {
  final ItemsController controller = Get.find();
  final RaffleController raffleController = Get.find();
  return Obx(() {
    if (controller.selectedItemType.value == ItemType.draws) {
      if (controller.viewType.value == ViewType.list) {
        return _buildItemsView<RaffleEntity>(
          raffleController.raffles,
          (raffle) => RaffleCardWidget(
            raffle: raffle,
            viewType: ViewType.list,
          ),
        );
      } else {
        return _buildCategoryGridView<RaffleEntity>(
          raffleController.raffles,
          (raffle) => RaffleCardWidget(
            raffle: raffle,
            viewType: ViewType.grid,
          ),
        );
      }
    } else if (controller.selectedItemType.value == ItemType.winners) {
      return _buildItemsView<WinnerEntity>(
        controller.winners,
        (winner) => WinnerCardWidget(winner: winner),
      );
    } else {
      return _buildItemsView<AnnouncementEntity>(
        controller.announcements,
        (announcement) => AnnouncementCardWidget(announcement: announcement),
      );
    }
  });
}

Widget _buildItemsView<T>(
  List<T> items,
  Widget Function(T) itemBuilder,
) {
  final ItemsController controller = Get.find();
  if (controller.viewType.value == ViewType.list) {
    return SingleChildScrollView(
      child: Column(
        children: items.map((item) => itemBuilder(item)).toList(),
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
  final ItemsController controller = Get.find();
  return Column(
    children: controller.categories.map((category) {
      final categoryItems = items.where((item) => (item as dynamic).categoryId == category.id).toList();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category.name.capitalizeFirst!,
            style: Theme.of(Get.context!).textTheme.titleLarge,
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: categoryItems.map((item) => itemBuilder(item)).toList()),
          ),
          const Divider(height: 20),
        ],
      );
    }).toList(),
  );
}
