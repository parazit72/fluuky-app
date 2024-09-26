import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/pages/dashboard_screen/badge_widget.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';

class BadgesListWidget extends StatelessWidget {
  const BadgesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 24.h),
          child: Text(t.translate('badges'), style: FluukyTheme.lightTheme.textTheme.titleLarge),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 24.h),
          child: Text(t.translate('The more trees you grow the more badges you get!'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
        ),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(mainAxisSize: MainAxisSize.max, children: [
              const SizedBox(width: 8),
              BadgeWidget(imagePath: 'assets/images/plus-g.svg', text: t.translate('eco_guardian'), achieved: true),
              BadgeWidget(imagePath: 'assets/images/ticket-active.svg', text: t.translate('decade_of_tickets'), achieved: true),
              BadgeWidget(imagePath: 'assets/images/ticket-active.svg', text: t.translate('green_thumb'), achieved: false),
              BadgeWidget(imagePath: 'assets/images/ticket-active.svg', text: t.translate('silver_ticket_history'), achieved: false),
              BadgeWidget(imagePath: 'assets/images/ticket-active.svg', text: t.translate('centennial_sower'), achieved: false),
            ])),
      ],
    );
  }
}
