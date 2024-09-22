import 'package:flutter/material.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:get/get.dart';

class SubscriptionSection extends StatelessWidget {
  const SubscriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 27),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: const DecorationImage(image: AssetImage('assets/images/paper-box.png'), fit: BoxFit.fill),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset('assets/images/logo-green.png', height: 24),
              const SizedBox(width: 4),
              Text(t.translate('fluukyGreenSubscription'), style: Theme.of(context).textTheme.headlineSmall),
            ],
          ),
          const SizedBox(height: 10),
          Text(t.translate('withGreenSubscription'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
          const SizedBox(height: 10),
          OutlinedButton(
            onPressed: () {
              Get.toNamed(greenSubscription);
            },
            // style: OutlinedButton.styleFrom(
            //   textStyle: TextStyle(
            //     fontFamily: FluukyTheme.updateFontFamilyBasedOnLocale(),
            //   ),
            // ),
            child: Text(t.translate('learnMore')),
          ),
        ],
      ),
    );
  }
}
