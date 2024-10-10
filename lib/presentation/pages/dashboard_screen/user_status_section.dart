import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:to_arabic_number/to_arabic_number.dart';

class UserStatusWidget extends StatelessWidget {
  const UserStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    // Get the current locale
    final locale = Get.locale;

    // Define a method to format numbers based on locale
    String formatNumber(String number) {
      if (locale?.languageCode == 'ar') {
        return Arabic.number(number);
      } else {
        return number;
      }
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
      child: InkWell(
        onTap: () => Get.toNamed(flukkyLoyalityProgram),
        child: Container(
          padding: EdgeInsets.all(16.h),
          decoration: BoxDecoration(
            image: const DecorationImage(fit: BoxFit.fill, image: AssetImage('assets/images/paper-box.png')),
            borderRadius: BorderRadius.all(Radius.circular(8.w)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(t.translate('Your Status'), style: FluukyTheme.lightTheme.textTheme.titleLarge),
              Divider(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/leaf-circle-green.svg',
                          colorFilter: ColorFilter.mode(FluukyTheme.primaryColor, BlendMode.srcIn), width: 16.w, height: 16.h),
                      SizedBox(width: 5.w),
                      Text(t.translate('basic'),
                          style: TextStyle(
                              fontSize: 14.w,
                              fontWeight: FontWeight.w600,
                              color: FluukyTheme.primaryColor,
                              fontFamily: FluukyTheme.fontFamily,
                              height: 1.5)),
                    ],
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/leaf-circle-green.svg',
                          colorFilter: ColorFilter.mode(Theme.of(context).primaryColor, BlendMode.srcIn), width: 16.w, height: 16.h),
                      SizedBox(width: 5.w),
                      Text(t.translate('silver'),
                          style: TextStyle(
                              fontSize: 14.w,
                              fontWeight: FontWeight.w600,
                              color: FluukyTheme.primaryColor,
                              fontFamily: FluukyTheme.fontFamily,
                              height: 1.5)),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: LinearProgressIndicator(
                  value: 45 / 100,
                  borderRadius: BorderRadius.circular(50),
                  color: FluukyTheme.secondaryColor,
                  backgroundColor: FluukyTheme.secondaryColor,
                  valueColor: AlwaysStoppedAnimation<Color>(FluukyTheme.primaryColor),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formatNumber('5,000/10,000 AED'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
                  Text(formatNumber(t.translate('12_months_left')), style: FluukyTheme.lightTheme.textTheme.displaySmall),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 4.w),
                decoration: BoxDecoration(color: FluukyTheme.fourthColor, borderRadius: BorderRadius.circular(8.w)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 6.h, bottom: 6.h, right: 16.w, left: 12.w),
                      child: Image.asset('assets/images/exclamation-mark.png', width: 20.w, height: 20.h),
                    ),
                    Expanded(
                      child: Text(
                        formatNumber(t.translate('spend_5k_more')),
                        style: FluukyTheme.lightTheme.textTheme.labelSmall,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
