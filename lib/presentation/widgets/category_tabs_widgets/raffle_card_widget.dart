import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/domain/entities/raffle_entity.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/auth_controller.dart';
import 'package:fluuky/presentation/controllers/items_controller.dart';
import 'package:fluuky/presentation/controllers/raffle_controller.dart';
import 'package:fluuky/presentation/pages/draw/trees_planted_dialog.dart';
import 'package:fluuky/presentation/pages/draw/we_forest_info_dialog.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:to_arabic_number/to_arabic_number.dart';

class RaffleCardWidget extends StatelessWidget {
  final RaffleEntity raffle;
  final ViewType viewType;
  bool wishlist = false;

  RaffleCardWidget({
    super.key,
    required this.raffle,
    required this.viewType,
    this.wishlist = false,
  });

  @override
  Widget build(BuildContext context) {
    RaffleController raffleController = Get.find<RaffleController>();
    final AuthController authController = Get.find<AuthController>();
    final isGridView = viewType == ViewType.grid;
    bool loading = false;
    bool userIsLoggedIn = false;
    var t = AppLocalizations.of(context)!;
    final locale = Get.locale;

    // Define a method to format numbers based on locale
    String formatNumber(String number) {
      if (locale?.languageCode == 'ar') {
        return Arabic.number(number);
      } else {
        return number;
      }
    }

    return Column(
      children: [
        isGridView
            ? Skeletonizer(
                enabled: loading,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Text(
                    t.translate('Plant') + raffle.capacity.toString() + t.translate('trees_to_enter_the_draw_to_win') + raffle.name,
                    style: FluukyTheme.lightTheme.textTheme.titleMedium,
                  ),
                ),
              )
            : Container(),
        Stack(
          children: [
            Container(
              width: 335.w,
              // height: MediaQuery.of(context).size.height * 0.6,
              margin: EdgeInsets.only(right: 0, bottom: 20.h),
              // padding: const EdgeInsets.only(bottom: 20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(14)),
                image: DecorationImage(image: AssetImage('assets/images/raffle-back-vrtal.png'), fit: BoxFit.fill),
              ),
              child: Column(
                children: [
                  Skeletonizer(
                    enabled: loading,
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(8.w), topRight: const Radius.circular(8)),
                        child: raffle.image.isNotEmpty
                            ? CachedNetworkImage(
                                width: 335.w,
                                height: 162.h,
                                fit: BoxFit.cover,
                                imageUrl: raffle.mainImage,
                                fadeInCurve: Curves.easeIn,
                                fadeInDuration: const Duration(milliseconds: 500),
                                cacheManager: CachedNetworkImageProvider.defaultCacheManager,
                                errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                              )
                            : Container(
                                height: 162.h,
                                width: 375.w,
                                color: FluukyTheme.secondaryColor,
                              )),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    width: 335.w,
                    padding: EdgeInsets.all(20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(raffle.name, style: FluukyTheme.lightTheme.textTheme.titleLarge),
                        SizedBox(height: 8.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(t.translate('Prize Value:'), style: FluukyTheme.lightTheme.textTheme.bodyMedium),
                            Text('\$33,000', style: FluukyTheme.lightTheme.textTheme.bodyMedium),
                          ],
                        ),
                        Divider(height: 32.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(t.translate('Price per ticket:'), style: FluukyTheme.lightTheme.textTheme.bodyLarge),
                            Text('\$${raffle.price.toStringAsFixed(2)}', style: FluukyTheme.lightTheme.textTheme.bodyLarge),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          SizedBox(
                              width: 140.w,
                              child: Text(
                                "How many tickets do you wish to purchase?",
                                style: FluukyTheme.lightTheme.textTheme.bodySmall,
                              )),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              InkWell(
                                child: Icon(Icons.remove_circle, color: FluukyTheme.primaryColor, size: 20.w),
                                onTap: () {},
                              ),
                              Container(
                                  margin: EdgeInsets.symmetric(horizontal: 14.w),
                                  width: 42.w,
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey, width: 1), borderRadius: const BorderRadius.all(Radius.circular(4))),
                                  child: Center(child: Text('10', style: FluukyTheme.lightTheme.textTheme.labelSmall))),
                              InkWell(
                                child: Icon(Icons.add_circle, color: FluukyTheme.primaryColor, size: 20.w),
                                onTap: () {},
                              ),
                            ],
                          )
                        ]),
                        SizedBox(height: 16.h),
                        Skeletonizer(
                          enabled: loading,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  SvgPicture.asset('assets/images/ticket-active.svg', width: 18.w),
                                  SizedBox(width: 4.w),
                                  Text(
                                    t.translate('Tickets sold:'),
                                    style: FluukyTheme.lightTheme.textTheme.bodySmall,
                                  ),
                                ],
                              ),
                              Text(formatNumber('${raffle.capacity}/2000'), style: FluukyTheme.lightTheme.textTheme.bodyLarge),
                            ],
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Skeletonizer(
                          enabled: loading,
                          child: Row(
                            // mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Wrap(children: [
                                SvgPicture.asset('assets/images/tree-green.svg',
                                    height: 18.h, colorFilter: ColorFilter.mode(Theme.of(context).primaryColor, BlendMode.srcIn)),
                                SizedBox(width: 4.w),
                                Text(
                                  t.translate('each_ticket_plants'),
                                  style: FluukyTheme.lightTheme.textTheme.bodySmall,
                                ),
                              ]),
                              Text(formatNumber('10 ${t.translate('Trees')}'), style: FluukyTheme.lightTheme.textTheme.bodyLarge),
                            ],
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Skeletonizer(
                          enabled: loading,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Icon(Icons.info_outline, size: 18.w, color: FluukyTheme.primaryColor),
                                    const SizedBox(width: 2),
                                    GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) => const WeForestInfoScreen(),
                                        );
                                      },
                                      child: Text(
                                        t.translate('tree_planting_count'),
                                        style: FluukyTheme.lightTheme.textTheme.bodyLarge!.copyWith(
                                          color: FluukyTheme.primaryColor,
                                          decoration: TextDecoration.underline,
                                          decorationColor: FluukyTheme.primaryColor,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Text(formatNumber('10 ${t.translate('Trees')}'), style: FluukyTheme.lightTheme.textTheme.bodyLarge),
                            ],
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Skeletonizer(
                          enabled: loading,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Icon(Icons.info_outline, size: 18.w, color: Theme.of(context).primaryColor),
                                    const SizedBox(width: 2),
                                    GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) => const TreesPlantedDialog(),
                                        );
                                      },
                                      child: Text(
                                        t.translate('bundleDiscount'),
                                        style: FluukyTheme.lightTheme.textTheme.bodyLarge!.copyWith(
                                            decoration: TextDecoration.underline,
                                            color: FluukyTheme.primaryColor,
                                            decorationColor: FluukyTheme.primaryColor),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Text(formatNumber('\$9.99'), style: FluukyTheme.lightTheme.textTheme.bodyLarge),
                            ],
                          ),
                        ),
                        Divider(height: 32.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(t.translate('Total:'), style: FluukyTheme.lightTheme.textTheme.titleLarge),
                            Text('\$90,000', style: FluukyTheme.lightTheme.textTheme.titleLarge),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    textStyle: WidgetStateProperty.all(FluukyTheme.lightTheme.textTheme.bodyLarge),
                                    minimumSize: WidgetStateProperty.all<Size>(Size(double.infinity, 40.h))),
                                onPressed: () {
                                  userIsLoggedIn = authController.checkAuthAndShowSheet();
                                  if (!userIsLoggedIn) {
                                    return;
                                  }
                                  Get.toNamed(draw, arguments: raffle);
                                },
                                child: Text(t.translate('Add to Cart')),
                              ),
                            ),
                            SizedBox(width: 16.w),
                            InkWell(
                              onTap: () {
                                userIsLoggedIn = authController.checkAuthAndShowSheet();
                                if (!userIsLoggedIn) {
                                  return;
                                }
                                raffle.isFavorite.value = !raffle.isFavorite.value;
                              },
                              child: Container(
                                width: 40.w,
                                height: 40.h,
                                decoration:
                                    BoxDecoration(borderRadius: BorderRadius.circular(8.w), border: Border.all(color: FluukyTheme.primaryColor)),
                                child: Center(
                                  child: Obx(
                                    () => SvgPicture.asset(
                                      raffle.isFavorite.value ? 'assets/images/heart.svg' : 'assets/images/heart-line.svg',
                                      width: 20.w,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (wishlist)
              Positioned(
                right: 16.w,
                top: 16.h,
                child: Obx(
                  () => Stack(
                    children: [
                      Image.asset('assets/images/checkbox.png', width: 24.w, height: 24.h),
                      SizedBox(
                        width: 24.w,
                        height: 24.h,
                        child: Transform.scale(
                          scale: 1.2,
                          child: Checkbox(
                            fillColor: WidgetStateProperty.all(Colors.transparent),
                            value: raffleController.wishlistToDelete.contains(raffle.id),
                            onChanged: (bool? value) {
                              if (value == true) {
                                raffleController.wishlistToDelete.add(raffle.id); // Add to delete list
                              } else {
                                raffleController.wishlistToDelete.remove(raffle.id); // Remove from delete list
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
        // const SizedBox(height: 32),
      ],
    );
  }
}
