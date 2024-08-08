import 'package:flutter/material.dart';
import 'package:fluuky/presentation/controllers/items_controller.dart';
import 'package:fluuky/presentation/controllers/raffle_controller.dart';
import 'package:fluuky/presentation/widgets/category_tabs_widgets/category_tabs_widgets.dart';
import 'package:get/get.dart';

class CategoryTabsSection extends StatelessWidget {
  final ItemsController controller = Get.find();
  final RaffleController raffleController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 14),
          _buildTopButtons(context),
          _buildContent(context),
        ],
      ),
    );
  }

  Widget _buildTopButtons(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              TypeButtonWidget(type: ItemType.draws, text: 'Draws'),
              TypeButtonWidget(type: ItemType.winners, text: 'Winners'),
              TypeButtonWidget(type: ItemType.announcements, text: 'Winning Announcements'),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(height: 40),
              buildSelectedTypeName(context),
              buildViewButtons(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(() {
            if (controller.selectedItemType.value == ItemType.draws && controller.viewType.value != ViewType.grid) {
              return buildCategoryButtons();
            } else {
              return const SizedBox.shrink();
            }
          }),
          const Divider(height: 40),
          buildItemsList(),
        ],
      ),
    );
  }
}
