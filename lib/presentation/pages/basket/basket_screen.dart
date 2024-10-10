import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/basket_controller.dart';
import 'package:fluuky/presentation/pages/basket/basket_item.dart';
import 'package:fluuky/presentation/pages/basket/draggable_basket_sheet.dart';
import 'package:fluuky/presentation/pages/basket/recommendations_for_you_section.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  _BasketScreenState createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  final BasketController basketController = Get.find<BasketController>();
  final GlobalKey<DraggableBasketSheetState> _sheetKey = GlobalKey<DraggableBasketSheetState>();
  double _sheetPosition = 0.49;

  @override
  void initState() {
    super.initState();
    basketController.fetchBasket();
  }

  void _updateSheetPosition(double position) {
    setState(() {
      _sheetPosition = position;
    });
  }

  void changeSheetPosition(double sheetPosition) {
    _sheetKey.currentState?.changeSheetSize(sheetPosition);
  }

  bool userIsSubscribed = true;
  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      appBar: AppBarFluuky(),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollUpdateNotification && scrollNotification.metrics.pixels > 0) {
            setState(() {
              changeSheetPosition(_sheetPosition);
              _sheetPosition = 0.17;
            });
          }
          return true;
        },
        child: Stack(
          children: [
            Obx(() {
              if (basketController.isLoading.value) {
                return SkeletonizerOfBasketLoading(controller: basketController);
              }

              return EasyRefresh(
                header: const MaterialHeader(),
                footer: const MaterialFooter(),
                onRefresh: () async {
                  basketController.isLoading.value = true;
                  await basketController.fetchBasket();
                  basketController.isLoading.value = false;
                },
                onLoad: () async {},
                child: InsideBasketScreen(basketController: basketController, sheetPosition: _sheetPosition),
              );
            }),
            if (basketController.currentBasket.value != null)
              DraggableBasketSheet(
                key: _sheetKey,
                sheetPosition: _sheetPosition,
                onSheetPositionChanged: _updateSheetPosition,
              ),
          ],
        ),
      ),
    );
  }
}

class InsideBasketScreen extends StatelessWidget {
  const InsideBasketScreen({
    super.key,
    required this.basketController,
    required double sheetPosition,
  }) : _sheetPosition = sheetPosition;

  final BasketController basketController;
  final double _sheetPosition;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const BasketTextHeaderWidget(),
          BasketItems(controller: basketController),
          const RecommendationsForYouSection(),
          if (basketController.isLoading.value) SizedBox(height: 812.h * (_sheetPosition > 0.17 ? 0.49 : 0.08)),
        ],
      ),
    );
  }
}

class SkeletonizerOfBasketLoading extends StatelessWidget {
  const SkeletonizerOfBasketLoading({super.key, required this.controller});

  final BasketController controller;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
        enabled: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const BasketTextHeaderWidget(),
              BasketItems(controller: controller),
              const RecommendationsForYouSection(),
            ],
          ),
        ));
  }
}

class BasketItems extends StatelessWidget {
  const BasketItems({super.key, required this.controller});

  final BasketController controller;

  @override
  Widget build(BuildContext context) {
    // Ensure the currentBasket and items are not null
    final basket = controller.currentBasket.value;
    final items = basket?.items;

    return items != null && items.isNotEmpty
        ? Column(
            children: items.map((item) => BasketItemWidget(item: item)).toList(),
          )
        : Padding(
            padding: EdgeInsets.all(20.w),
            child: Image.asset('assets/images/empty-basket.png'),
          );
  }
}

class BasketTextHeaderWidget extends StatelessWidget {
  const BasketTextHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(t.translate('cart'), style: FluukyTheme.lightTheme.textTheme.titleLarge),
          SizedBox(height: 4.h),
          Text(t.translate('explore_items_in_cart'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
          SizedBox(height: 24.h),
          const Divider(),
        ],
      ),
    );
  }
}
