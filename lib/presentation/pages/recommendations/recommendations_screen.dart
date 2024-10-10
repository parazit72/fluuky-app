import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/domain/entities/raffle_category_entity.dart';
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
            SizedBox(height: 16.h),
            const UpdateYourInterestBoxWidget(),
            SizedBox(height: 16.h),
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
      (raffle) => RaffleCardWidget(raffle: raffle, viewType: ViewType.list),
    );
  });
}

Widget _buildCategoryGridView<T>(List<T> items, Widget Function(T) itemBuilder) {
  RxList categories;
  final RaffleController raffleController = Get.find();
  RxList<RaffleCategoryEntity> raffleCategories = raffleController.raffleCategories;
  final locale = Get.locale;
  categories = raffleCategories;

  return Column(
    children: [
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(width: 20.w),
            tagBtnWidget(
              raffleController: raffleController,
              raffleCategoryEntity:
                  RaffleCategoryEntity(id: -1, name: 'All', slug: '', status: '1', description: '', activeIconPath: '', inactiveIconPath: ''),
              isAllButton: true,
            ),
            SizedBox(width: 8.w),
            // Other categories
            ...raffleCategories.map(
              (item) => Wrap(
                children: [
                  tagBtnWidget(raffleController: raffleController, raffleCategoryEntity: item),
                  SizedBox(width: 8.w),
                ],
              ),
            ),
            SizedBox(width: 20.w),
          ],
        ),
      ),
      SizedBox(height: 24.h),
      ...categories.map((category) {
        return SingleChildScrollView(
          child: Column(
            children: [
              if (locale?.languageCode != 'ar') SizedBox(width: 20.w),
              if (raffleController.selectedCategory.value == -1)
                ...raffleController.raffles.map((item) => itemBuilder(item as T))
              else
                ...raffleController.filteredRaffles.map((item) => itemBuilder(item as T)),
            ],
          ),
        );
      }),
    ],
  );
}

class tagBtnWidget extends StatelessWidget {
  const tagBtnWidget({
    super.key,
    required this.raffleController,
    required this.raffleCategoryEntity,
    this.isAllButton = false,
  });

  final RaffleController raffleController;
  final RaffleCategoryEntity raffleCategoryEntity;
  final bool isAllButton;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isAllButton) {
          raffleController.selectedCategory.value = -1; // Clear category to show all
        } else {
          raffleController.selectedCategory.value = raffleCategoryEntity.id!;
        }
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow:
              (isAllButton && raffleController.selectedCategory.value == 0) || raffleController.selectedCategory.value == raffleCategoryEntity.id
                  ? [
                      BoxShadow(color: FluukyTheme.secondaryColor),
                      BoxShadow(color: FluukyTheme.fourthColor),
                      const BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
                    ]
                  : null,
          color: (isAllButton && raffleController.selectedCategory.value == 0) || raffleController.selectedCategory.value == raffleCategoryEntity.id
              ? FluukyTheme.primaryColor
              : FluukyTheme.fourthColor,
          borderRadius: BorderRadius.all(Radius.circular(8.w)),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
        height: 32.w,
        child: Text(
          raffleCategoryEntity.name!,
          style: FluukyTheme.lightTheme.textTheme.labelMedium!.copyWith(
            color: (isAllButton && raffleController.selectedCategory.value == 0) || raffleController.selectedCategory.value == raffleCategoryEntity.id
                ? Colors.white
                : FluukyTheme.primaryColor,
          ),
        ),
      ),
    );
  }
}

class UpdateYourInterestBoxWidget extends StatelessWidget {
  const UpdateYourInterestBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 18.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.w),
        image: const DecorationImage(image: AssetImage('assets/images/fluuky-green-subscription.png'), fit: BoxFit.fill),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: Text(t.translate('updateInterests'), style: FluukyTheme.lightTheme.textTheme.bodyLarge),
          ),
          Text(
            t.translate('updateInterests_msg'),
            style: FluukyTheme.lightTheme.textTheme.bodySmall,
          ),
          SizedBox(height: 16.h),
          OutlinedButton(
            onPressed: () => Get.toNamed(recommendationsForm),
            child: Text(
              t.translate('Update'),
              style: TextStyle(
                  fontSize: 14.w, fontWeight: FontWeight.w600, color: FluukyTheme.primaryColor, fontFamily: FluukyTheme.fontFamily, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}
