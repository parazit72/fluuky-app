import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:to_arabic_number/to_arabic_number.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';

class DraggableSignupSheet extends StatefulWidget {
  const DraggableSignupSheet({super.key});

  @override
  _DraggableSignupSheetState createState() => _DraggableSignupSheetState();
}

class _DraggableSignupSheetState extends State<DraggableSignupSheet> {
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
        maxChildSize: 0.35,
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
                  Text(t.translate('Sign up to see what you’re missing!'), style: FluukyTheme.lightTheme.textTheme.titleLarge),
                  SizedBox(height: 12.h),
                  Text(t.translate('Start your tree-planting journey in just a few clicks.'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
                  SizedBox(height: 24.h),
                  ElevatedButton(
                    style:
                        ButtonStyle(textStyle: WidgetStateProperty.all(FluukyTheme.lightTheme.textTheme.bodyMedium!.copyWith(color: Colors.white))),
                    onPressed: () => Get.toNamed(signUp),
                    child: Text(t.translate('Sign Up')),
                  ),
                  SizedBox(height: 16.h),
                  Wrap(children: [
                    Text(t.translate('Already have an account?'), style: FluukyTheme.lightTheme.textTheme.bodyMedium),
                    SizedBox(width: 6.w),
                    InkWell(
                      onTap: () => Get.toNamed(login),
                      child: Text(t.translate('Log in'), style: TextStyle(color: FluukyTheme.primaryColor)),
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
