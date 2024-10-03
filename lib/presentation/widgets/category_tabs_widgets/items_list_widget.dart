import 'package:carousel_slider_plus/carousel_slider_plus.dart';
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
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Widget buildItemsList(context) {
  final ItemsController itemsController = Get.find();
  final RaffleController raffleController = Get.find();
  var t = AppLocalizations.of(context)!;
  return Obx(() {
    if (itemsController.selectedItemType.value == ItemType.draws) {
      if (itemsController.viewType.value == ViewType.list) {
        return _buildItemsView<RaffleEntity>(
          raffleController.filteredRaffles,
          (raffle) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(t.translate('plantXTrees') + raffle.name, style: FluukyTheme.lightTheme.textTheme.titleLarge),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: RaffleCardWidget(raffle: raffle, viewType: ViewType.list),
                ),
              ],
            ),
          ),
        );
      } else {
        return _buildCategoryGridView<RaffleEntity>(
          raffleController.filteredRaffles,
          (raffle) => RaffleCardWidget(raffle: raffle, viewType: ViewType.grid),
        );
      }
    } else if (itemsController.selectedItemType.value == ItemType.winners) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text('Winning Announcement', style: FluukyTheme.lightTheme.textTheme.titleLarge),
          ),
          SizedBox(height: 4.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text('See all the draws happening live!', style: FluukyTheme.lightTheme.textTheme.displaySmall),
          ),
          SizedBox(
            width: 375.w,
            child: Column(
              children: [
                SizedBox(height: 24.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Rolex Cosmograph Daytona'),
                      IconButton(
                        style: const ButtonStyle(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          padding: WidgetStatePropertyAll(EdgeInsets.zero),
                          minimumSize: WidgetStatePropertyAll(Size(0, 0)),
                        ),
                        onPressed: () {},
                        icon: const Icon(Icons.chevron_right),
                      )
                    ],
                  ),
                ),
                CarouselSlider(
                  items: itemsController.announcements
                      .map((item) => Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: AnnouncementCardWidget(announcement: item),
                          ))
                      .toList(),
                  controller: itemsController.carouselSliderController,
                  options: CarouselOptions(
                    height: 375.h,
                    viewportFraction: 1,
                    enlargeCenterPage: false,
                    onPageChanged: (index, reason) {
                      itemsController.winnerCarouselIndex.value = index;
                    },
                  ),
                ),
                // Spacing if needed
                AnimatedSmoothIndicator(
                  activeIndex: itemsController.winnerCarouselIndex.value,
                  count: itemsController.announcements.length,
                  effect: ExpandingDotsEffect(
                    expansionFactor: 1.1,
                    dotHeight: 8.w,
                    dotWidth: 8.w,
                    activeDotColor: FluukyTheme.primaryColor,
                    dotColor: FluukyTheme.thirdColor,
                  ),
                  onDotClicked: (index) {
                    itemsController.carouselSliderController.animateToPage(index);
                  },
                ),
                Divider(height: 48.h),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text('Winners Gallery', style: FluukyTheme.lightTheme.textTheme.titleLarge),
          ),
          SizedBox(height: 4.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text('Be inspired to take climate action while enjoying the luxury of giving back.',
                style: FluukyTheme.lightTheme.textTheme.displaySmall),
          ),
          SizedBox(height: 24.h),
          _buildCategoryGridView<WinnerEntity>(
            itemsController.winners,
            (winner) => WinnerCardWidget(winner: winner),
          ),
        ],
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
      child: Column(children: items.map((item) => itemBuilder(item)).toList()),
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

      return SizedBox(
        width: 375.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 16.h),
              child: Text(
                category.name,
                style: FluukyTheme.lightTheme.textTheme.bodyMedium,
                textAlign: TextAlign.start,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 20.w),
                  ...categoryItems.map((item) => itemBuilder(item)),
                  SizedBox(width: 20.w),
                ],
              ),
            ),
            SizedBox(height: 32.h),
          ],
        ),
      );
    }).toList(),
  );
}
