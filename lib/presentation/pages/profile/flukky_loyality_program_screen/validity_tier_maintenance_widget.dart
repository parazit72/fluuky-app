import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/l10n/app_localizations.dart';

class ValidityTierMaintenanceWidget extends StatelessWidget {
  const ValidityTierMaintenanceWidget({super.key});
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
            const BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
          ],
        ),
        width: 375.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(t.translate('Validity and Tier Maintenance'), style: FluukyTheme.lightTheme.textTheme.titleMedium),
            SizedBox(height: 16.h),
            Text(t.translate('rollingPeriod'), style: FluukyTheme.lightTheme.textTheme.bodySmall),
          ],
        ));
  }
}
