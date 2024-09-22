import 'package:flutter/material.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:to_arabic_number/to_arabic_number.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';

class DraggableCheckoutSheet extends StatefulWidget {
  const DraggableCheckoutSheet({super.key});

  @override
  _DraggableCheckoutSheetState createState() => _DraggableCheckoutSheetState();
}

class _DraggableCheckoutSheetState extends State<DraggableCheckoutSheet> {
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

    return Align(
      alignment: Alignment.bottomCenter,
      child: DraggableScrollableSheet(
        initialChildSize: 0.35,
        minChildSize: 0.35,
        maxChildSize: 0.35,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/paper.jpg"), fit: BoxFit.cover),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)),
              boxShadow: [BoxShadow(offset: Offset(0, -1), color: Colors.black26, spreadRadius: 0, blurRadius: 4)],
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(t.translate('total_amount'), style: FluukyTheme.lightTheme.textTheme.titleLarge),
                      Text(formatNumber('\$100'), style: FluukyTheme.lightTheme.textTheme.titleLarge),
                    ],
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => Get.toNamed(checkout),
                    child: Text(t.translate('checkout')),
                  ),
                  const SizedBox(height: 16),
                  Text(t.translate('purchase_terms')),
                  Wrap(children: [
                    InkWell(
                      onTap: () => Get.toNamed(termsAndCondition),
                      child: Text(t.translate('terms_conditions'), style: TextStyle(color: Theme.of(context).primaryColor)),
                    ),
                    const Text(' and '),
                    InkWell(
                      onTap: () => Get.toNamed(privacyPolicy),
                      child: Text(t.translate('privacy_policy'), style: TextStyle(color: Theme.of(context).primaryColor)),
                    ),
                  ])
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
