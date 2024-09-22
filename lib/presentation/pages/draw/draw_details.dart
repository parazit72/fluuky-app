import 'package:flutter/material.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/pages/draw/trees_planted_dialog.dart';
import 'package:fluuky/presentation/pages/draw/we_forest_info_dialog.dart';
import 'package:get/get.dart';
import 'package:to_arabic_number/to_arabic_number.dart';

class DrawDetailsWidget extends StatelessWidget {
  const DrawDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(14)),
            image: const DecorationImage(image: AssetImage('assets/images/paper.jpg'), fit: BoxFit.cover),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                child: Image.asset(
                  'assets/images/back4.jpg',
                  alignment: Alignment.topCenter,
                  height: 200,
                  width: 500,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              const BottomOfDrawCardWidget(),
            ],
          ),
        ),
      ],
    );
  }
}

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
        return Arabic.number(number);
      } else {
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
              Text(t.translate('winThe'), style: FluukyTheme.lightTheme.textTheme.bodySmall),
              const SizedBox(width: 10),
              Text(t.translate('value'), style: FluukyTheme.lightTheme.textTheme.bodySmall),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Rolex Cosmograph Daytona', style: FluukyTheme.lightTheme.textTheme.displaySmall!.copyWith(fontSize: 14)),
              // const SizedBox(width: 10),
              Text(formatNumber('33,000'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                children: [
                  Image.asset('assets/images/logo-green.png', height: 20, width: 20, fit: BoxFit.contain),
                  const SizedBox(width: 10),
                  Text(t.translate('ticketsRemaining'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
                ],
              ),
              Text(formatNumber('567/2000'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
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
                  Text(t.translate('eachTicketPlants'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
                ],
              ),
              Text(formatNumber('10 ${t.translate('trees')}'),
                  style: FluukyTheme.lightTheme.textTheme.displaySmall!.copyWith(fontWeight: FontWeight.w600)),
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
                          builder: (BuildContext context) => const WeForestInfoScreen(),
                        );
                      },
                      child: Text(
                        t.translate('youArePlanting'),
                        style: FluukyTheme.lightTheme.textTheme.displaySmall!.copyWith(decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
              ),
              Text(formatNumber('10 ${t.translate('trees')}'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
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
                        t.translate('bundleDiscount'),
                        style: FluukyTheme.lightTheme.textTheme.displaySmall!.copyWith(decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
              ),
              Text(formatNumber('0'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
            ],
          ),
        ],
      ),
    );
  }
}
