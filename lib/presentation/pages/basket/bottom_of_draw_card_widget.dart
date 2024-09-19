import 'package:flutter/material.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/pages/draw/trees_planted_dialog.dart';
import 'package:fluuky/presentation/pages/draw/we_forest_info_dialog.dart';
import 'package:get/get.dart';
import 'package:to_arabic_number/to_arabic_number.dart';

class BottomOfDrawCardWidget extends StatelessWidget {
  const BottomOfDrawCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    // Get the current locale
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

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(t.translate('prize'), style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(width: 10),
              Text('Rolex Cosmograph Daytona', style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Rolex Cosmograph Daytona', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(width: 10),
              Text(formatNumber('\$33,000'), style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset('assets/images/logo-green.png', height: 20, width: 20, fit: BoxFit.contain),
                  const SizedBox(width: 10),
                  Text(t.translate('ticketsRemaining'), style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
              Text(formatNumber('567/2000'), style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset('assets/images/logo-green.png', height: 20, width: 20, fit: BoxFit.contain),
                  const SizedBox(width: 10),
                  Text(t.translate('each_ticket_plants'), style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
              Text(formatNumber('10 ${t.translate('trees')}'), style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Image.asset('assets/images/logo-green.png', height: 20, width: 20, fit: BoxFit.contain),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const WeForestInfoScreen();
                          },
                        );
                      },
                      child: Text(
                        t.translate('you_planting'),
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
              ),
              Text(formatNumber('10 ${t.translate('Trees')}'), style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Row(
                  children: [
                    Image.asset('assets/images/logo-green.png', height: 20, width: 20, fit: BoxFit.contain),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const TreesPlantedDialog();
                          },
                        );
                      },
                      child: Text(
                        t.translate('bundle_discount_label'),
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
              ),
              Text('0', style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ],
      ),
    );
  }
}
