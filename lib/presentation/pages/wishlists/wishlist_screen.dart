import 'package:flutter/material.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/domain/entities/raffle_entity.dart';
import 'package:fluuky/presentation/controllers/items_controller.dart';
import 'package:fluuky/presentation/controllers/raffle_controller.dart';
import 'package:fluuky/presentation/widgets/category_tabs_widgets/raffle_card_widget.dart';
import 'package:fluuky/presentation/widgets/layout/app_bar_fluuky_widget.dart';
import 'package:fluuky/presentation/widgets/layout/background_scaffold.dart';
import 'package:fluuky/presentation/widgets/layout/custom_nav_bar.dart';
import 'package:get/get.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final RaffleController raffleController = Get.find();

  bool userIsSubscribed = true;

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      appBar: const AppBarFluuky(),
      bottomNavigationBar: CustomNavBar(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Obx(() {
              // Checking if the wishlist is empty
              bool isEmpty = raffleController.wishlist.isEmpty;

              return Column(
                children: [
                  WhislistTextHeaderWidget(isEmpty: isEmpty),
                  if (!isEmpty)
                    buildItemsList(raffleController.wishlist)
                  else
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.asset('assets/images/empty-wishlist.png')),
                          const SizedBox(height: 24),
                          ElevatedButton(onPressed: () => Get.toNamed(drawList), child: const Text('Buy Tickets Now'))
                        ],
                      ),
                    ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}

class WhislistTextHeaderWidget extends StatelessWidget {
  final bool isEmpty;

  const WhislistTextHeaderWidget({super.key, required this.isEmpty});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Wishlist', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(
            isEmpty
                ? 'You haven’t added any draws to your wish list yet. Browse our current draws to start planting trees!'
                : 'You’ve added these draws to your wish list. Don’t wait too long - start planting trees for a chance to win!',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 20),
          if (!isEmpty)
            TextButton.icon(
              style: ButtonStyle(
                  minimumSize: WidgetStateProperty.all(const Size(0, 0)),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: WidgetStateProperty.all(EdgeInsets.zero)),
              onPressed: () {
                Get.find<RaffleController>().wishlist.clear();
              },
              icon: const Icon(
                Icons.delete,
              ),
              label: const Text('Delete'),
            ),
          const Divider(),
        ],
      ),
    );
  }
}

// Build items list dynamically using Obx for reactivity
Widget buildItemsList(RxList<RaffleEntity> wishlist) {
  return Obx(() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: wishlist
            .map((item) => RaffleCardWidget(
                  raffle: item,
                  viewType: ViewType.list,
                ))
            .toList(),
      ),
    );
  });
}
