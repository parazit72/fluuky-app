import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/domain/entities/announcement_entity.dart';
import 'package:fluuky/domain/entities/raffle_entity.dart';
import 'package:fluuky/domain/entities/winner_entity.dart';
import 'package:fluuky/presentation/controllers/items_controller.dart';
import 'package:fluuky/presentation/widgets/announcement_card_widget.dart';
import 'package:fluuky/presentation/widgets/raffle_card_widget.dart';
import 'package:fluuky/presentation/widgets/winner_card_widget.dart';
import 'package:get/get.dart';

class CategoryTabsWidget extends StatelessWidget {
  final ItemsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 14),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildTypeButton(ItemType.draws, 'Draws'),
              _buildTypeButton(ItemType.winners, 'Winners'),
              _buildTypeButton(ItemType.announcements, 'Winning Announcements'),
            ],
          ),
        ),
        // Item Type Buttons
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              const Divider(height: 40),
              Obx(() {
                final selectedTypeName = _getSelectedTypeName(controller.selectedItemType.value);
                return Text(
                  selectedTypeName.capitalizeFirst!,
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.start,
                );
              }),

              Container(
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
              ),

              // Categories Buttons (only visible for raffles)
              Obx(() {
                if (controller.selectedItemType.value == ItemType.draws) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: controller.categories.map((category) => _buildCategoryButton(category.id, category.name, category.iconPath)).toList(),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              }),
              const Divider(height: 40),

              // Items List/Grid
              Expanded(
                child: Obx(() {
                  if (controller.selectedItemType.value == ItemType.draws) {
                    return _buildItemsView<RaffleEntity>(
                      controller.filteredRaffles,
                      (raffle) => RaffleCardWidget(raffle: raffle),
                    );
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
                }),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTypeButton(ItemType type, String text) {
    return Obx(() {
      bool isSelected = controller.selectedItemType.value == type;

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
            style:
                ElevatedButton.styleFrom(elevation: 0, backgroundColor: isSelected ? Theme.of(Get.context!).primaryColor : const Color(0XFFE9EFEB)),
            onPressed: () => controller.selectedItemType.value = type,
            child: Text(
              text,
              softWrap: false,
              style: isSelected
                  ? Theme.of(Get.context!).textTheme.titleLarge!.copyWith(color: Colors.white)
                  : Theme.of(Get.context!).textTheme.bodyLarge!.copyWith(color: Theme.of(Get.context!).primaryColor),
            ),
          ),
        ),
      );
    });
  }

  Widget _buildCategoryButton(int id, String text, String? iconPath) {
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
                  ? Theme.of(Get.context!).textTheme.titleLarge!.copyWith(color: Theme.of(Get.context!).primaryColor)
                  : Theme.of(Get.context!).textTheme.bodyLarge!.copyWith(color: const Color(0xFFB3B3B3)),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildViewButton(ViewType type, IconData icon) {
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
                    style: Theme.of(Get.context!)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: isSelected ? Theme.of(Get.context!).primaryColor : Colors.black)),
              ],
            ),
            onPressed: () => controller.viewType.value = type,
          ),
        ),
      );
    });
  }

  Widget _buildItemsView<T>(
    List<T> items,
    Widget Function(T) itemBuilder,
  ) {
    if (controller.viewType.value == ViewType.list) {
      return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => itemBuilder(items[index]),
      );
    } else {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: items.length,
        itemBuilder: (context, index) => itemBuilder(items[index]),
      );
    }
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
}
