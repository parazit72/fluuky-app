import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/domain/entities/raffle_entity.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/items_controller.dart';
import 'package:fluuky/presentation/pages/draw/we_forest_info_dialog.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:to_arabic_number/to_arabic_number.dart';

class RaffleCardWidget extends StatelessWidget {
  final RaffleEntity raffle;
  final ViewType viewType;

  const RaffleCardWidget({super.key, required this.raffle, required this.viewType});

  @override
  Widget build(BuildContext context) {
    final isGridView = viewType == ViewType.grid;
    bool loading = false;
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
            ? Container()
            : Skeletonizer(
                enabled: loading,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    t.translate('Plant') + raffle.capacity.toString() + t.translate('trees_to_enter_the_draw_to_win') + raffle.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
        Container(
          width: MediaQuery.of(context).size.width * (isGridView ? 0.66 : 1),
          // height: MediaQuery.of(context).size.height * 0.6,
          margin: EdgeInsets.only(right: isGridView ? 12 : 0),
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
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                    child: raffle.image.isNotEmpty
                        ? CachedNetworkImage(
                            height: isGridView ? MediaQuery.of(context).size.height * 0.2 : MediaQuery.of(context).size.height * 0.3,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                            imageUrl: raffle.mainImage,
                            placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                            // progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
                            cacheManager: CachedNetworkImageProvider.defaultCacheManager,
                            fadeInDuration: const Duration(milliseconds: 500),
                            fadeInCurve: Curves.easeIn,
                          )
                        : Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width,
                            color: FluukyTheme.secondaryColor,
                          )),
              ),
              const SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width * (isGridView ? 0.66 : 1),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(raffle.name, style: FluukyTheme.lightTheme.textTheme.titleLarge),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(t.translate('Prize Value:'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
                        Text(raffle.price.toStringAsFixed(2), style: FluukyTheme.lightTheme.textTheme.displaySmall),
                      ],
                    ),
                    const Divider(height: 32),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      SizedBox(width: (MediaQuery.of(context).size.width - 30) * 0.5, child: const Text("How many tickets do you wish to purchase?")),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          InkWell(
                            child: Icon(Icons.remove_circle, color: FluukyTheme.primaryColor, size: 20),
                            onTap: () {},
                          ),
                          Container(
                              margin: const EdgeInsets.symmetric(horizontal: 0),
                              width: 40,
                              height: 20,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey, width: 1), borderRadius: const BorderRadius.all(Radius.circular(4))),
                              child: const Center(child: Text('10'))),
                          InkWell(
                            child: Icon(Icons.add_circle, color: FluukyTheme.primaryColor, size: 20),
                            onTap: () {},
                          ),
                        ],
                      )
                    ]),
                    const SizedBox(height: 16),
                    Skeletonizer(
                      enabled: loading,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              SvgPicture.asset('assets/images/ticket-active.svg', width: 20),
                              const SizedBox(width: 10),
                              Text(t.translate('Tickets sold:'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
                            ],
                          ),
                          Text(formatNumber('${raffle.capacity}/2000'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Skeletonizer(
                      enabled: loading,
                      child: Row(
                        // mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Wrap(children: [
                            SvgPicture.asset('assets/images/tree-green.svg',
                                height: 18, colorFilter: ColorFilter.mode(Theme.of(context).primaryColor, BlendMode.srcIn)),
                            const SizedBox(width: 10),
                            Text(t.translate('each_ticket_plants'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
                          ]),
                          Text(formatNumber('10 ${t.translate('Trees')}'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Skeletonizer(
                      enabled: loading,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Icon(Icons.info_outline, size: 18, color: Theme.of(context).primaryColor),
                                const SizedBox(width: 2),
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const WeForestInfoScreen();
                                      },
                                    );
                                  },
                                  child: Text(
                                    t.translate('tree_planting_count'),
                                    style: FluukyTheme.lightTheme.textTheme.displaySmall!.copyWith(
                                        decoration: TextDecoration.underline,
                                        color: FluukyTheme.primaryColor,
                                        decorationColor: FluukyTheme.primaryColor),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Text(formatNumber('10 ${t.translate('Trees')}'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Skeletonizer(
                      enabled: loading,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Icon(Icons.info_outline, size: 18, color: Theme.of(context).primaryColor),
                                const SizedBox(width: 2),
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const WeForestInfoScreen();
                                      },
                                    );
                                  },
                                  child: Text(
                                    t.translate('bundleDiscount'),
                                    style: FluukyTheme.lightTheme.textTheme.displaySmall!.copyWith(
                                        decoration: TextDecoration.underline,
                                        color: FluukyTheme.primaryColor,
                                        decorationColor: FluukyTheme.primaryColor),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Text(formatNumber('\$9.99'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
                        ],
                      ),
                    ),
                    const Divider(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(t.translate('Total:'), style: FluukyTheme.lightTheme.textTheme.titleLarge),
                        Text(raffle.price.toStringAsFixed(2), style: FluukyTheme.lightTheme.textTheme.displaySmall),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  minimumSize: WidgetStateProperty.all<Size>(const Size(double.infinity, 40)),
                                ),
                                onPressed: () => Get.toNamed(draw, arguments: raffle),
                                child: Text(t.translate('Add to Cart')))),
                        const SizedBox(width: 16),
                        InkWell(
                            onTap: () {},
                            child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Theme.of(context).primaryColor),
                                ),
                                child: Center(child: SvgPicture.asset('assets/images/heart-line.svg', width: 20)))),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        // const SizedBox(height: 32),
      ],
    );
  }
}
