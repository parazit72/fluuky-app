import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:to_arabic_number/to_arabic_number.dart';

class TreesPlantedSection extends StatelessWidget {
  const TreesPlantedSection({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    final locale = Get.locale;

    // Define a method to format numbers based on locale
    String formatNumber(String number) {
      if (locale?.languageCode == 'ar') {
        // Convert to Arabic numerals
        return Arabic.number(number);
      } else {
        // Use standard numerals
        return number;
      }
    }

    return Container(
      margin: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Icon(Icons.info_outline, color: Theme.of(context).primaryColor),
              const SizedBox(width: 8),
              Text("${formatNumber('0')} ${t.translate('treesPlanted')}", style: Theme.of(context).textTheme.headlineSmall),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(image: AssetImage('assets/images/paper-box.png'), fit: BoxFit.fill),
            ),
            child: Column(
              children: [
                SvgPicture.asset('assets/images/tree-green.svg',
                    colorFilter: ColorFilter.mode(Theme.of(context).primaryColor, BlendMode.srcIn), width: 50, height: 50),
                const SizedBox(height: 16),
                Text(
                  t.translate('youHavenPlantedAnyTrees'),
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(greenSubscription);
                  },
                  child: Text(t.translate('plantNow')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
