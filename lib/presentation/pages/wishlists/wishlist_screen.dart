import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/domain/entities/raffle_entity.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/items_controller.dart';
import 'package:fluuky/presentation/controllers/raffle_controller.dart';
import 'package:fluuky/presentation/widgets/category_tabs_widgets/raffle_card_widget.dart';
import 'package:fluuky/presentation/widgets/layout/app_bar_fluuky_widget.dart';
import 'package:fluuky/presentation/widgets/layout/background_scaffold.dart';
import 'package:fluuky/presentation/widgets/layout/custom_nav_bar.dart';
import 'package:get/get.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final RaffleController raffleController = Get.find();

  bool userIsSubscribed = true;

  @override
  void initState() {
    super.initState();
    raffleController.fetchWishlist();
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return BackgroundScaffold(
      appBar: AppBarFluuky(),
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
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        children: [
                          ClipRRect(borderRadius: BorderRadius.circular(8), child: SvgPicture.asset('assets/images/empty-wishlist.svg')),
                          SizedBox(height: 24.h),
                          ElevatedButton(
                              style: ButtonStyle(
                                textStyle: WidgetStateProperty.all(FluukyTheme.lightTheme.textTheme.bodyMedium!.copyWith(color: Colors.white)),
                              ),
                              onPressed: () => Get.toNamed(drawList),
                              child: Text(t.translate('Buy Tickets Now')))
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
    var t = AppLocalizations.of(context)!;
    final RaffleController raffleController = Get.find();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(t.translate('Wishlist'), style: FluukyTheme.lightTheme.textTheme.titleLarge),
          SizedBox(height: 8.h),
          Text(
            isEmpty
                ? t.translate('you_havent_added_draws_wish_list_browse_current')
                : t.translate('you_added_these_wish_list_dont_wait_planting_chance_win'),
            style: FluukyTheme.lightTheme.textTheme.displaySmall,
          ),
          SizedBox(height: 20.h),
          if (!isEmpty)
            TextButton.icon(
              style: ButtonStyle(
                  minimumSize: WidgetStateProperty.all(const Size(0, 0)),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: WidgetStateProperty.all(EdgeInsets.zero)),
              onPressed: () {
                showDialog<bool>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(t.translate('Are you sure?')),
                      content: Text(t.translate('Do you want to delete the selected items?')),
                      actions: <Widget>[
                        Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: const Text('No'),
                              ),
                            ),
                            Expanded(
                              child: TextButton(
                                onPressed: () {
                                  raffleController.wishlist.removeWhere((raffle) => raffleController.wishlistToDelete.contains(raffle.id));
                                  Navigator.pop(context, true);
                                },
                                child: const Text('Yes'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ).then((bool? value) {
                  if (value == true) {
                    raffleController.wishlistToDelete.clear();
                  }
                });
              },
              icon: const Icon(Icons.delete),
              label: Text(t.translate('Delete')),
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
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: wishlist.map((item) => RaffleCardWidget(raffle: item, viewType: ViewType.list, wishlist: true)).toList(),
      ),
    );
  });
}
