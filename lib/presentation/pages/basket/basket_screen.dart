import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
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
  final BasketController controller = Get.find<BasketController>();
  final GlobalKey<DraggableBasketSheetState> _sheetKey = GlobalKey<DraggableBasketSheetState>();
  double _sheetPosition = 0.4;

  @override
  void initState() {
    super.initState();
    controller.fetchBasket();
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
      appBar: const AppBarFluuky(),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollUpdateNotification && scrollNotification.metrics.pixels > 0) {
            setState(() {
              changeSheetPosition(_sheetPosition);
              _sheetPosition = 0.1;
            });
          }
          return true;
        },
        child: Stack(
          children: [
            Obx(() {
              if (controller.isLoading.value) {
                return SkeletonizerOfBasketLoading(controller: controller);
              }

              return EasyRefresh(
                header: const MaterialHeader(),
                footer: const MaterialFooter(),
                onRefresh: () async {
                  controller.isLoading.value = true;
                  await controller.fetchBasket();
                  controller.isLoading.value = false;
                },
                onLoad: () async {},
                child: InsideBasketScreen(controller: controller, sheetPosition: _sheetPosition),
              );
            }),
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
    required this.controller,
    required double sheetPosition,
  }) : _sheetPosition = sheetPosition;

  final BasketController controller;
  final double _sheetPosition;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const BasketTextHeaderWidget(),
          BasketItems(controller: controller),
          RecommendationsForYouSection(controller: controller),
          SizedBox(height: MediaQuery.of(context).size.height * (_sheetPosition > 0.1 ? 0.4 : 0.08)),
        ],
      ),
    );
  }
}

class SkeletonizerOfBasketLoading extends StatelessWidget {
  const SkeletonizerOfBasketLoading({
    super.key,
    required this.controller,
  });

  final BasketController controller;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
        enabled: true,
        child: Column(
          children: [
            const BasketTextHeaderWidget(),
            BasketItems(controller: controller),
            RecommendationsForYouSection(controller: controller),
          ],
        ));
  }
}

class BasketItems extends StatelessWidget {
  const BasketItems({
    super.key,
    required this.controller,
  });

  final BasketController controller;

  @override
  Widget build(BuildContext context) {
    return controller.basket.value.items.isNotEmpty
        ? Column(
            children: controller.basket.value.items.map((item) => BasketItemWidget(item: item)).toList(),
          )
        : Padding(
            padding: const EdgeInsets.all(20),
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(t.translate('cart'), style: FluukyTheme.lightTheme.textTheme.titleLarge),
          const SizedBox(height: 4),
          Text(t.translate('explore_items_in_cart'), style: FluukyTheme.lightTheme.textTheme.bodySmall),
          const SizedBox(height: 24),
          const Divider(),
        ],
      ),
    );
  }
}
