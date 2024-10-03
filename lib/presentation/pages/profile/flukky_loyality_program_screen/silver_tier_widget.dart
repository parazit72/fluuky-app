import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/l10n/app_localizations.dart';

class SilverTierWidget extends StatelessWidget {
  const SilverTierWidget({super.key});
  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          image: const DecorationImage(image: AssetImage("assets/images/paper-box.png"), fit: BoxFit.fill),
          borderRadius: BorderRadius.all(Radius.circular(8.w)),
          boxShadow: [
            BoxShadow(color: FluukyTheme.secondaryColor),
            const BoxShadow(color: Colors.white70, spreadRadius: -4.0, blurRadius: 8.6),
          ],
        ),
        width: 320.w,
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
                    border: Border.all(color: FluukyTheme.primaryColor, width: 2),
                    borderRadius: BorderRadius.circular(50.w),
                  ),
                  child: Center(child: Image.asset('assets/images/tree-green.png', width: 24.w)),
                ),
                SizedBox(width: 16.w),
                Text(t.translate('SilverTier'), style: FluukyTheme.lightTheme.textTheme.titleMedium),
              ],
            ),
            const SizedBox(height: 16),
            Text(t.translate('spend10kAEDwithin12Months'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
            const SizedBox(height: 24),
            Row(
              children: [
                Container(
                  width: 40.w,
                  height: 40.w,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: FluukyTheme.primaryColor),
                  child: Center(
                      child: SvgPicture.asset(
                    'assets/images/percentage.svg',
                    width: 22.w,
                    height: 22.w,
                    colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  )),
                ),
                SizedBox(width: 16.w),
                Expanded(child: Text(t.translate('5percentOnAllDraws'), style: FluukyTheme.lightTheme.textTheme.labelMedium)),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Container(
                  width: 40.w,
                  height: 40.w,
                  margin: EdgeInsets.only(right: 16.w),
                  decoration: BoxDecoration(shape: BoxShape.circle, color: FluukyTheme.primaryColor),
                  child: Center(
                      child: SvgPicture.asset(
                    'assets/images/diamond.svg',
                    width: 22.w,
                    height: 22.w,
                    colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  )),
                ),
                Expanded(child: Text(t.translate('exclusiveSilverTierDraws'), style: FluukyTheme.lightTheme.textTheme.labelMedium)),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Container(
                  width: 40.w,
                  height: 40.w,
                  margin: EdgeInsets.only(right: 16.w),
                  decoration: BoxDecoration(shape: BoxShape.circle, color: FluukyTheme.primaryColor),
                  child: Center(
                      child: SvgPicture.asset(
                    width: 20.w,
                    height: 20.w,
                    'assets/images/cake.svg',
                    colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  )),
                ),
                Expanded(child: Text(t.translate('freeBirthdayCredittoPlantATree'), style: FluukyTheme.lightTheme.textTheme.labelMedium)),
              ],
            ),
            SizedBox(height: 24.h),
          ],
        ));
  }
}
