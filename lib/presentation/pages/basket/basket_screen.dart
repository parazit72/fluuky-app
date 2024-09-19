import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/basket_controller.dart';
import 'package:fluuky/presentation/pages/basket/basket_items_section.dart';
import 'package:fluuky/presentation/pages/basket/draggable_basket_sheet.dart';
import 'package:fluuky/presentation/pages/basket/interest_you_section.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';
import 'package:get/get.dart';

class BasketScreen extends StatefulWidget {
  @override
  _BasketScreenState createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  final BasketController controller = Get.find<BasketController>();

  @override
  void initState() {
    super.initState();
    // Fetch basket data when the screen is loaded
    controller.fetchBasket();
  }

  bool userIsSubscribed = true;
  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      appBar: const AppBarFluuky(),
      body: Stack(
        children: [
          Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            return EasyRefresh(
              header: const MaterialHeader(),
              onRefresh: () async {
                controller.fetchBasket();
              },
              onLoad: () async {},
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const BasketTextHeaderWidget(),
                    BasketItemsSection(items: controller.basket.value.items),
                    const InterestYouSection(),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.4),
                  ],
                ),
              ),
            );
          }),
          const DraggableBasketSheet(),
        ],
      ),
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
          Text(t.translate('cart'), style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 4),
          Text(t.translate('explore_items_in_cart'), style: Theme.of(context).textTheme.bodySmall!.copyWith(color: FluukyTheme.thirdColor)),
          const SizedBox(height: 24),
          const Divider(),
        ],
      ),
    );
  }
}
