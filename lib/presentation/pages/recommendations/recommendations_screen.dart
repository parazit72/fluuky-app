import 'package:flutter/material.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/domain/entities/category_entity.dart';
import 'package:fluuky/domain/entities/raffle_entity.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/items_controller.dart';

import 'package:fluuky/presentation/controllers/raffle_controller.dart';
import 'package:fluuky/presentation/widgets/category_tabs_widgets/raffle_card_widget.dart';

import 'package:fluuky/presentation/widgets/layout/app_bar_single.dart';
import 'package:fluuky/presentation/widgets/layout/background_scaffold.dart';
import 'package:get/get.dart';

class RecommendationsScreen extends StatefulWidget {
  const RecommendationsScreen({super.key});

  @override
  State<RecommendationsScreen> createState() => _RecommendationsScreenState();
}

class _RecommendationsScreenState extends State<RecommendationsScreen> {
  final RaffleController raffleController = Get.find();

  bool userIsSubscribed = true;

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return BackgroundScaffold(
      appBar: AppBarSingleWidget(title: t.translate('your_recommendations')),
      body: SingleChildScrollView(
        // Ensure the whole content is scrollable
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const UpdateYourInterestBoxWidget(),
            const SizedBox(height: 16),
            buildItemsList(raffleController),
          ],
        ),
      ),
    );
  }
}

Widget buildItemsList(RaffleController raffleController) {
  return Obx(() {
    return _buildCategoryGridView<RaffleEntity>(
      raffleController.raffles,
      (raffle) => RaffleCardWidget(raffle: raffle, viewType: ViewType.grid),
    );
  });
}

Widget _buildCategoryGridView<T>(
  List<T> items,
  Widget Function(T) itemBuilder,
) {
  RxList categories;
  final ItemsController itemsController = Get.find();
  RxList<CategoryEntity> raffleCategories = itemsController.raffleCategories;
  final locale = Get.locale;
  categories = raffleCategories;

  return Column(
    // Ensure this column can be part of a scrollable parent
    children: categories.map((category) {
      final categoryItems = items.where((item) => (item as dynamic).categoryId == category.id).toList();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(category.name, style: Theme.of(Get.context!).textTheme.titleMedium),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              if (locale?.languageCode != 'ar') const SizedBox(width: 20),
              ...categoryItems.map((item) => itemBuilder(item)),
            ]),
          ),
        ],
      );
    }).toList(),
  );
}

class UpdateYourInterestBoxWidget extends StatelessWidget {
  const UpdateYourInterestBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 18),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(color: Color(0xFFDBDBDB)),
          BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
        ],
        color: FluukyTheme.secondaryColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(t.translate('updateInterests'), style: Theme.of(context).textTheme.titleMedium),
          ),
          Text(
            t.translate('updateInterests_msg'),
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: OutlinedButton(
              onPressed: () => Get.toNamed(recommendationsForm),
              child: Text(t.translate('Update')),
            ),
          ),
        ],
      ),
    );
  }
}
