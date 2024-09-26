import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';

class YourImpactWidget extends StatelessWidget {
  const YourImpactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(t.translate('your_impact'), style: FluukyTheme.lightTheme.textTheme.titleLarge),
          Text(t.translate('withEverTicketPurchase'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: TextButton.icon(
                  style: ButtonStyle(
                      minimumSize: WidgetStateProperty.all(const Size(0, 0)),
                      padding: WidgetStateProperty.all(EdgeInsets.zero),
                      textStyle: WidgetStateProperty.all(const TextStyle(decoration: TextDecoration.underline))),
                  onPressed: () {},
                  icon: Icon(Icons.info_outline, size: 20.h, color: FluukyTheme.primaryColor),
                  label: Text(t.translate('more_details')),
                ),
              ),
              Text('10 ${t.translate('trees')}', style: FluukyTheme.lightTheme.textTheme.titleSmall),
            ],
          ),
          SizedBox(height: 8.h),
          Container(
            height: 100.h,
            width: 375.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.h)),
              image: const DecorationImage(image: AssetImage('assets/images/empty-box.png'), fit: BoxFit.fill),
            ),
          ),
        ],
      ),
    );
  }
}
