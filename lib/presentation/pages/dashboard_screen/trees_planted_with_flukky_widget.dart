import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';

class TreesPlantedWithFlukkyWidget extends StatelessWidget {
  const TreesPlantedWithFlukkyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.black87),
          height: 106.h,
          width: MediaQuery.of(context).size.width,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.w),
            child: Image.asset('assets/images/jungle-1.jpg', fit: BoxFit.cover),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          height: 106.h,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.w),
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        // const SizedBox(height: 24),
        SizedBox(
          height: 106.h,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '15,000',
                  style: FluukyTheme.lightTheme.textTheme.headlineLarge,
                ),
                Text(
                  t.translate('TREES_PLANTED_WITH_FLUUKY'),
                  style: FluukyTheme.lightTheme.textTheme.headlineSmall,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
