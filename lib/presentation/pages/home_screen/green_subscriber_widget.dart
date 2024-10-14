import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:intl/intl.dart';
// import 'package:jhijri/_src/_jHijri.dart';

class GreenSubscriberWidget extends StatelessWidget {
  const GreenSubscriberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return Container(
        height: 53.h,
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: FluukyTheme.fourthColor),
            // BoxShadow(color: Colors.black12),
            const BoxShadow(color: Colors.white12, spreadRadius: -8.0, blurRadius: 8),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Image.asset('assets/images/logo-green.png', height: 16.h),
                const SizedBox(width: 4),
                Text(
                  t.translate('Green Subscriber'),
                  style: TextStyle(color: FluukyTheme.primaryColor, fontSize: 14.w, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              child: Text('${t.translate('Member since')} ${DateFormat('MMMM d, yyyy').format(DateTime.now())}',
                  style: TextStyle(color: FluukyTheme.thirdColor, fontSize: 12.w)),
            ),
          ],
        ));
  }
}
