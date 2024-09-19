import 'package:flutter/material.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/pages/dashboard_screen/badge_widget.dart';

class BadgesListWidget extends StatelessWidget {
  const BadgesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
          child: Text(t.translate('badges'), style: Theme.of(context).textTheme.titleLarge),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Text(t.translate('theMoreTreesYouGrowMoreBadgesYouGet'), style: Theme.of(context).textTheme.bodySmall),
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
