import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/domain/entities/raffle_entity.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/items_controller.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:to_arabic_number/to_arabic_number.dart';

class ActiveRaffleCardWidget extends StatelessWidget {
  final RaffleEntity raffle;
  final ViewType viewType;

  const ActiveRaffleCardWidget({super.key, required this.raffle, required this.viewType});

  @override
  Widget build(BuildContext context) {
    final isGridView = viewType == ViewType.grid;
    bool loading = false;
    final locale = Get.locale;
    var t = AppLocalizations.of(context)!;

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
        InkWell(
          onTap: () => Get.toNamed(draw, arguments: raffle),
          child: Container(
            width: 163.w,
            margin: EdgeInsets.only(right: 10.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(14.w)),
              image: const DecorationImage(image: AssetImage('assets/images/raffle-back-vrtal.png'), fit: BoxFit.fill),
            ),
            child: Column(
              children: [
                Skeletonizer(
                  ignoreContainers: true,
                  enabled: loading,
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(8.w), topRight: Radius.circular(8.w)),
                      child: raffle.image.isNotEmpty
                          ? CachedNetworkImage(
                              height: 100.h,
                              width: 163.w,
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
                              height: 250.h,
                              width: MediaQuery.of(context).size.width,
                              color: FluukyTheme.secondaryColor,
                            )),
                ),
                SizedBox(height: 10.h),
                Container(
                  width: 375.w * (isGridView ? 0.66 : 1),
                  padding: const EdgeInsets.all(16.0),
                  child: Skeletonizer(
                    ignoreContainers: true,
                    enabled: loading,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(raffle.name, style: Theme.of(context).textTheme.titleMedium),
                        SizedBox(height: 8.h),
                        Text(t.translate("Trees Planted: ") + formatNumber(raffle.capacity.toString()),
                            style: FluukyTheme.lightTheme.textTheme.displaySmall),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
