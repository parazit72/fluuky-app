import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/domain/entities/announcement_entity.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:to_arabic_number/to_arabic_number.dart';

class AnnouncementCardWidget extends StatelessWidget {
  final AnnouncementEntity announcement;

  const AnnouncementCardWidget({super.key, required this.announcement});

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

    return Column(
      children: [
        SizedBox(height: 16.h),
        Container(
            height: 190.h,
            margin: EdgeInsets.only(bottom: 16.w),
            decoration: BoxDecoration(
              border: Border.all(color: FluukyTheme.secondaryColor),
              boxShadow: [
                BoxShadow(color: FluukyTheme.secondaryColor),
                const BoxShadow(color: Colors.white70, spreadRadius: -4.0, blurRadius: 8.6),
              ],
              borderRadius: BorderRadius.circular(8.w),
            ),
            child: Center(child: Icon(Icons.play_arrow, size: 80.h, color: FluukyTheme.thirdColor))),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTimerSegment('02', t.translate('days_label')),
              Text(':', style: TextStyle(fontSize: 20.w)),
              _buildTimerSegment('02', t.translate('hours_label')),
              Text(':', style: TextStyle(fontSize: 20.w)),
              _buildTimerSegment('02', t.translate('minutes_label')),
              Text(':', style: TextStyle(fontSize: 20.w)),
              _buildTimerSegment('02', t.translate('seconds_label')),
            ],
          ),
        ),
        SizedBox(
          width: 335.w,
          height: 48.h,
          child: ElevatedButton(
            onPressed: () => Get.toNamed(drawsList),
            child: Text(
              t.translate('Buy More Tickets'),
              style: TextStyle(fontSize: 16.w, fontWeight: FontWeight.w600, color: Colors.white, fontFamily: 'Causten', height: 1.5),
            ),
          ),
        ),
        //slider
      ],
    );
  }
}

Widget _buildTimerSegment(String value, String unit) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        value,
        style: FluukyTheme.lightTheme.textTheme.titleMedium,
      ),
      Text(
        unit,
        style: FluukyTheme.lightTheme.textTheme.labelSmall!.copyWith(color: FluukyTheme.primaryColor),
      ),
    ],
  );
}
