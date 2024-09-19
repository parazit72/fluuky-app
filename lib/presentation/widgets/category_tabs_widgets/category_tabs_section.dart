import 'package:flutter/material.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/items_controller.dart';
// import 'package:fluuky/presentation/controllers/raffle_controller.dart';
import 'package:fluuky/presentation/widgets/category_tabs_widgets/category_tabs_widgets.dart';
import 'package:get/get.dart';

class CategoryTabsSection extends StatelessWidget {
  final ItemsController controller = Get.find();
  // final RaffleController raffleController = Get.find();

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
    var t = AppLocalizations.of(context)!;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(width: 8),
              TypeButtonWidget(type: ItemType.draws, text: t.translate('Draws')),
              TypeButtonWidget(type: ItemType.winners, text: t.translate('Winners')),
              TypeButtonWidget(type: ItemType.announcements, text: t.translate('Winning Announcements')),
              const SizedBox(width: 8)
            ],
          ),
        ),
        Obx(() {
          if (controller.selectedItemType.value != ItemType.draws) {
            return Container();
          }
          {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(height: 40),
                  buildSelectedTypeName(context),
                  buildViewButtons(context),
                ],
              ),
            );
          }
        }),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      // padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(() {
            if (controller.selectedItemType.value == ItemType.draws && controller.viewType.value != ViewType.grid) {
              return buildCategoryButtons(context);
            } else {
              return const SizedBox.shrink();
            }
          }),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(height: 0),
          ),
          buildItemsList(),
        ],
      ),
    );
  }
}
