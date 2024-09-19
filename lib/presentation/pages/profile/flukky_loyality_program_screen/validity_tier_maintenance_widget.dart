import 'package:flutter/material.dart';
import 'package:fluuky/l10n/app_localizations.dart';

class ValidityTierMaintenanceWidget extends StatelessWidget {
  const ValidityTierMaintenanceWidget({super.key});
  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/paper-box.png"), fit: BoxFit.fill),
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(color: Color(0xFFDBDBDB)),
            BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
          ],
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(t.translate('validityAndTierMaintenance'), style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 16),
            Text(t.translate('rollingPeriod')),
          ],
        ));
  }
}
