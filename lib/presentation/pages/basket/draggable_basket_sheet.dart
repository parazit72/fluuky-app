import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        onTap: () => changeSheetSize(0.49),
        child: DraggableScrollableSheet(
          initialChildSize: widget.sheetPosition,
          minChildSize: 0.17,
          maxChildSize: 0.49,
          controller: _controller,
          builder: (BuildContext context, ScrollController scrollController) {
            return ColoredBox(
              color: Colors.transparent,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      decoration: BoxDecoration(
                        image: const DecorationImage(image: AssetImage("assets/images/paper.jpg"), fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(8.w), topRight: Radius.circular(8.w)),
                        boxShadow: const [BoxShadow(offset: Offset(0, -1), color: Colors.black26, spreadRadius: 0, blurRadius: 4)],
                      ),
                      child: ListView(
                        controller: scrollController,
                        children: [
                          SizedBox(height: 24.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(t.translate('Total Bundle Discount:'), style: FluukyTheme.lightTheme.textTheme.bodyMedium),
                              Text(formatNumber('\$29,97'), style: FluukyTheme.lightTheme.textTheme.bodyMedium),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(t.translate('total_amount'), style: FluukyTheme.lightTheme.textTheme.titleLarge),
                              Text(formatNumber('\$100'), style: FluukyTheme.lightTheme.textTheme.titleLarge),
                            ],
                          ),
                          SizedBox(height: 24.h),
                          ElevatedButton(
                              style: ButtonStyle(
                                minimumSize: WidgetStatePropertyAll(Size(335.w, 48.h)),
                                textStyle: WidgetStateProperty.all(TextStyle(fontSize: 16.w, fontWeight: FontWeight.w400, fontFamily: 'Causten')),
                              ),
                              onPressed: () => Get.toNamed(checkout),
                              child: Text(t.translate('checkout'))),
                          SizedBox(height: 16.h),
                          OutlinedButton(
                              style: ButtonStyle(
                                minimumSize: WidgetStatePropertyAll(Size(335.w, 48.h)),
                                textStyle: WidgetStateProperty.all(TextStyle(fontSize: 16.w, fontWeight: FontWeight.w600, fontFamily: 'Causten')),
                              ),
                              onPressed: () => Get.toNamed(drawsList),
                              child: Text(t.translate('Add More Draws'))),
                          SizedBox(height: 24.h),
                          Text(t.translate('purchase_terms'), textAlign: TextAlign.center, style: FluukyTheme.lightTheme.textTheme.bodySmall),
                          Wrap(alignment: WrapAlignment.center, crossAxisAlignment: WrapCrossAlignment.center, children: [
                            InkWell(
                              onTap: () => Get.toNamed(termsAndCondition),
                              child: Text(t.translate('Terms & Conditions'),
                                  style: FluukyTheme.lightTheme.textTheme.bodyLarge!.copyWith(color: FluukyTheme.primaryColor)),
                            ),
                            Text(t.translate('_and_'), style: FluukyTheme.lightTheme.textTheme.bodySmall),
                            InkWell(
                              onTap: () => Get.toNamed(privacyPolicy),
                              child: Text(t.translate('privacy_policy'),
                                  style: FluukyTheme.lightTheme.textTheme.bodyLarge!.copyWith(color: FluukyTheme.primaryColor)),
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
