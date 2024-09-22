import 'package:flutter/material.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:to_arabic_number/to_arabic_number.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';

class DraggableBasketSheet extends StatefulWidget {
  final double sheetPosition;
  final ValueChanged<double> onSheetPositionChanged;

  const DraggableBasketSheet({super.key, required this.sheetPosition, required this.onSheetPositionChanged});

  @override
  DraggableBasketSheetState createState() => DraggableBasketSheetState();
}

class DraggableBasketSheetState extends State<DraggableBasketSheet> {
  final DraggableScrollableController _controller = DraggableScrollableController();
  void changeSheetSize(double sheetPosition) {
    _controller.animateTo(
      sheetPosition,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    widget.onSheetPositionChanged(sheetPosition);
  }

  String formatNumber(String number) {
    final locale = Get.locale;
    if (locale?.languageCode == 'ar') {
      return Arabic.number(number);
    } else {
      return number;
    }
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: () => changeSheetSize(0.4),
        child: DraggableScrollableSheet(
          initialChildSize: widget.sheetPosition,
          minChildSize: 0.1,
          maxChildSize: 0.41,
          controller: _controller,
          builder: (BuildContext context, ScrollController scrollController) {
            return ColoredBox(
              color: Colors.transparent,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/images/paper.jpg"), fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)),
                        boxShadow: [BoxShadow(offset: Offset(0, -1), color: Colors.black26, spreadRadius: 0, blurRadius: 4)],
                      ),
                      child: ListView(
                        controller: scrollController,
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
                          ElevatedButton(onPressed: () => Get.toNamed(checkout), child: Text(t.translate('checkout'))),
                          const SizedBox(height: 16),
                          OutlinedButton(onPressed: () => Get.toNamed(drawsList), child: Text(t.translate('add_more_draws'))),
                          const SizedBox(height: 16),
                          Text(t.translate('purchase_terms'), textAlign: TextAlign.center),
                          Wrap(alignment: WrapAlignment.center, crossAxisAlignment: WrapCrossAlignment.center, children: [
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
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
