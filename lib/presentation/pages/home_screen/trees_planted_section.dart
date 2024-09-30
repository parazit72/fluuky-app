import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:to_arabic_number/to_arabic_number.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';

class TreesPlantedSection extends StatelessWidget {
  const TreesPlantedSection({super.key});

  @override
  Widget build(BuildContext context) {
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

    return Container(
      margin: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Icon(Icons.info_outline, color: FluukyTheme.primaryColor, size: 24.w),
              SizedBox(width: 8.w),
              Text(
                "${formatNumber('0')} ${t.translate('Trees Planted')}",
                style: FluukyTheme.lightTheme.textTheme.titleLarge!.copyWith(color: FluukyTheme.primaryColor),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.w),
              image: const DecorationImage(image: AssetImage('assets/images/paper-box.png'), fit: BoxFit.fill),
            ),
            child: Column(
              children: [
                SvgPicture.asset('assets/images/tree-green.svg',
                    colorFilter: ColorFilter.mode(FluukyTheme.primaryColor, BlendMode.srcIn), width: 50.w, height: 50.h),
                SizedBox(height: 16.h),
                Text(
                  t.translate('youHavenPlantedAnyTrees'),
                  style: FluukyTheme.lightTheme.textTheme.displaySmall!.copyWith(color: FluukyTheme.inputTextColor),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.h),
                ElevatedButton(
                  style: ButtonStyle(textStyle: WidgetStateProperty.all(TextStyle(fontSize: 12.w, fontWeight: FontWeight.w600))),
                  onPressed: () => Get.toNamed(greenSubscription),
                  child: Text(t.translate('Plant Now!')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
