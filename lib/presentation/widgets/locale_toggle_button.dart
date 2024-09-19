import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleToggleButton extends StatelessWidget {
  const LocaleToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.language),
      onPressed: () {
        // Toggle between 'ar' and 'en'
        if (Get.locale?.languageCode == 'ar') {
          Get.updateLocale(const Locale('en'));
        } else {
          Get.updateLocale(const Locale('ar'));
        }
      },
    );
  }
}
