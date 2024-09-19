import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LocaleManager extends GetxController {
  var currentLocale = const Locale('ar').obs; // Default to English

  // Map font families to each locale
  final Map<String, String> fontMapping = {
    'en': 'Causten',
    'ar': 'Cairo',
  };

  // Change the locale and update font family based on locale
  void changeLocale(String languageCode) {
    Locale locale = Locale(languageCode);
    currentLocale.value = locale;

    // Dynamically change the fontFamily in FluukyTheme
    FluukyTheme.fontFamily = fontMapping[languageCode] ?? 'Causten';

    // Update the locale in GetX
    Get.updateLocale(locale);
  }

  // Get current font family based on locale
  String get currentFontFamily => fontMapping[currentLocale.value.languageCode] ?? 'Causten';
}
