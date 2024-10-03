import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/widgets/bullet_list.dart';
import 'package:fluuky/presentation/widgets/payment_form_widget.dart';
import 'package:fluuky/presentation/widgets/layout/app_bar_single.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';

class PackagesScreen extends StatefulWidget {
  PackagesScreen({super.key});

  @override
  _PackagesScreenState createState() => _PackagesScreenState();
}

class _PackagesScreenState extends State<PackagesScreen> {
  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return BackgroundScaffold(
      appBar: AppBarSingleWidget(title: t.translate('Packages')),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 32.h),
        children: [
          Text(t.translate('Prebuy Tree-Planting Packages'), style: FluukyTheme.lightTheme.textTheme.titleLarge),
          Text(t.translate('Receive additional credits when you prebuy bundle packages!'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
          // PaymentFormWidget(),
          Container(
            margin: EdgeInsets.only(top: 32.h),
            padding: EdgeInsets.all(24.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(image: AssetImage('assets/images/paper-box.png'), fit: BoxFit.fill),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Container(
                      width: 40.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Theme.of(context).primaryColor, width: 2),
                      ),
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        'assets/images/tree-green.svg',
                        colorFilter: ColorFilter.mode(Theme.of(context).primaryColor, BlendMode.srcIn),
                        width: 24.w,
                        height: 24.w,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Text(t.translate('Planter Package'), style: FluukyTheme.lightTheme.textTheme.titleLarge),
                  ],
                ),
                SizedBox(height: 16.h),
                Text(
                  t.translate('Prebuy Amount: 5,000 AED'),
                  style: FluukyTheme.lightTheme.textTheme.displaySmall,
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Container(
                      width: 40.w,
                      height: 40.w,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: FluukyTheme.primaryColor),
                      child: Center(
                          child: SvgPicture.asset(
                        'assets/images/percentage.svg',
                        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      )),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                        child: Text(
                      t.translate('Receive an additional 5% credit (250 AED)'),
                      style: FluukyTheme.lightTheme.textTheme.labelMedium,
                    )),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Container(
                      width: 40.w,
                      height: 40.w,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).primaryColor),
                      child: Center(
                          child: SvgPicture.asset(
                        'assets/images/db.svg',
                        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      )),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                        child: Text(
                      t.translate('Total credit in your FLUUKY account: 5,250 AED'),
                      style: FluukyTheme.lightTheme.textTheme.labelMedium,
                    )),
                  ],
                ),
                SizedBox(height: 48.h),
                ElevatedButton(
                  style: ButtonStyle(
                    textStyle: WidgetStateProperty.all(FluukyTheme.lightTheme.textTheme.bodyMedium!.copyWith(color: Colors.white)),
                  ),
                  onPressed: () {
                    // Get.toNamed(greenSubscription);
                  },
                  child: Text(t.translate('Buy Now')),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 32.h),
            padding: EdgeInsets.all(24.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(image: AssetImage('assets/images/paper-box.png'), fit: BoxFit.fill),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Container(
                      width: 40.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Theme.of(context).primaryColor, width: 2),
                      ),
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        'assets/images/tree-green.svg',
                        colorFilter: ColorFilter.mode(Theme.of(context).primaryColor, BlendMode.srcIn),
                        width: 24.w,
                        height: 24.w,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Text(t.translate('Forester Package'), style: FluukyTheme.lightTheme.textTheme.titleLarge),
                  ],
                ),
                SizedBox(height: 16.h),
                Text(
                  t.translate('Prebuy Amount: 10,000 AED'),
                  style: FluukyTheme.lightTheme.textTheme.displaySmall,
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Container(
                      width: 40.w,
                      height: 40.w,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: FluukyTheme.primaryColor),
                      child: Center(
                          child: SvgPicture.asset(
                        'assets/images/percentage.svg',
                        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      )),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                        child: Text(
                      t.translate('Receive an additional 10% credit (1000 AED)'),
                      style: FluukyTheme.lightTheme.textTheme.labelMedium,
                    )),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Container(
                      width: 40.w,
                      height: 40.w,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).primaryColor),
                      child: Center(
                          child: SvgPicture.asset(
                        'assets/images/db.svg',
                        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      )),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                        child: Text(
                      t.translate('Total credit in your FLUUKY account: 11,000 AED'),
                      style: FluukyTheme.lightTheme.textTheme.labelMedium,
                    )),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).primaryColor),
                      child: Center(
                          child: SvgPicture.asset(
                        'assets/images/diamond.svg',
                        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      )),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                        child: Text(
                      t.translate('directAccessForesterDsc'),
                      style: FluukyTheme.lightTheme.textTheme.labelMedium,
                    )),
                  ],
                ),
                SizedBox(height: 48.h),
                ElevatedButton(
                  style: ButtonStyle(
                    textStyle: WidgetStateProperty.all(FluukyTheme.lightTheme.textTheme.bodyMedium!.copyWith(color: Colors.white)),
                  ),
                  onPressed: () {
                    // Get.toNamed(greenSubscription);
                  },
                  child: Text(t.translate('Buy Now')),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 32.h),
            padding: EdgeInsets.all(24.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(image: AssetImage('assets/images/paper-box.png'), fit: BoxFit.fill),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(t.translate("terms_and_conditions"), style: FluukyTheme.lightTheme.textTheme.titleLarge),
                SizedBox(height: 16.h),
                BulletList(items: [
                  t.translate("Prebuy credit packages are non-refundable"),
                  t.translate("Credits from the prebuy packages are non-transferable and cannot be exchanged for cash. Credits do not expire."),
                  t.translate(
                      "Direct access to loyalty tiers through prebuy packages lasts for one year from the date of purchase. After one year, tier status will be determined by the regular criteria of the FLUUKY Loyalty Program."),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
