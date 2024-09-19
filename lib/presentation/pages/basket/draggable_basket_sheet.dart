import 'package:flutter/material.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:to_arabic_number/to_arabic_number.dart';

class DraggableBasketSheet extends StatefulWidget {
  const DraggableBasketSheet({super.key});

  @override
  _DraggableBasketSheetState createState() => _DraggableBasketSheetState();
}

class _DraggableBasketSheetState extends State<DraggableBasketSheet> {
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

    return Align(
      alignment: Alignment.bottomCenter,
      child: DraggableScrollableSheet(
        expand: true,
        initialChildSize: 0.43,
        minChildSize: 0.43,
        maxChildSize: 0.43,
        // snapSizes: [0.4, 0.75],
        snap: true,
        builder: (BuildContext context, ScrollController scrollController) {
          return NotificationListener<DraggableScrollableNotification>(
            onNotification: (notification) {
              if (notification.extent > 0.75) {
                Get.toNamed(checkout);
              }
              return true;
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/paper.jpg"), fit: BoxFit.cover),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)),
                boxShadow: [BoxShadow(offset: Offset(0, -1), color: Colors.black26, spreadRadius: 0, blurRadius: 4)],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(t.translate('total_amount'), style: Theme.of(context).textTheme.titleLarge),
                      Text(formatNumber('\$100'), style: Theme.of(context).textTheme.titleLarge),
                    ],
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => Get.toNamed(checkout),
                    child: Text(t.translate('checkout')),
                  ),
                  const SizedBox(height: 16),
                  OutlinedButton(
                    onPressed: () => Get.toNamed(drawsList),
                    child: Text(t.translate('add_more_draws')),
                  ),
                  const SizedBox(height: 16),
                  Text(t.translate('purchase_terms'), textAlign: TextAlign.center),
                  Wrap(children: [
                    InkWell(
                      onTap: () => Get.toNamed(termsAndCondition),
                      child: Text(t.translate('terms_conditions'), style: TextStyle(color: Theme.of(context).primaryColor)),
                    ),
                    Text(t.translate('_and_')),
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
