import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:get/get.dart';

class SubscriptionSection extends StatelessWidget {
  const SubscriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return Container(
      margin: EdgeInsets.all(16.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 27.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.w),
        image: const DecorationImage(image: AssetImage('assets/images/fluuky-green-subscription.png'), fit: BoxFit.fill),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset('assets/images/logo-green.png', height: 14.h),
              SizedBox(width: 4.w),
              Text(t.translate('Fluuky Green Subscription'),
                  style: FluukyTheme.lightTheme.textTheme.bodyLarge!.copyWith(color: FluukyTheme.primaryColor)),
            ],
          ),
          SizedBox(height: 10.h),
          Text(t.translate('withGreenSubscription'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
          SizedBox(height: 10.h),
          OutlinedButton(
              onPressed: () => Get.toNamed(greenSubscription),
              style: FluukyTheme.lightTheme.outlinedButtonTheme.style,
              child: Text(
                t.translate('Learn More'),
                style: FluukyTheme.lightTheme.textTheme.bodyLarge!
                    .copyWith(color: FluukyTheme.primaryColor, fontSize: 14.w, fontWeight: FontWeight.w600),
              )),
        ],
      ),
    );
  }
}
