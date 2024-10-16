import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        initialChildSize: 0.37,
        minChildSize: 0.37,
        maxChildSize: 0.37,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            decoration: BoxDecoration(
              image: const DecorationImage(image: AssetImage("assets/images/paper.jpg"), fit: BoxFit.cover),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(8.w), topRight: Radius.circular(8.w)),
              boxShadow: const [BoxShadow(offset: Offset(0, -1), color: Colors.black26, spreadRadius: 0, blurRadius: 4)],
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    style:
                        ButtonStyle(textStyle: WidgetStateProperty.all(FluukyTheme.lightTheme.textTheme.bodyMedium!.copyWith(color: Colors.white))),
                    onPressed: () => Get.toNamed(checkout),
                    child: Text(t.translate('checkout')),
                  ),
                  SizedBox(height: 16.h),
                  Text(t.translate('purchase_terms')),
                  Wrap(children: [
                    InkWell(
                      onTap: () => Get.toNamed(termsAndCondition),
                      child: Text(t.translate('Terms & Conditions'), style: TextStyle(color: FluukyTheme.primaryColor)),
                    ),
                    const Text(' and '),
                    InkWell(
                      onTap: () => Get.toNamed(privacyPolicy),
                      child: Text(t.translate('privacy_policy'), style: TextStyle(color: FluukyTheme.primaryColor)),
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
