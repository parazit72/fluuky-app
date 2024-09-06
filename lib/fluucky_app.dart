import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/app/utils/app_navigation.dart';
import 'package:fluuky/app/utils/theme_provider.dart';
import 'package:fluuky/presentation/bindings/initial_bindings.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:provider/provider.dart';

class FluukyApp extends StatefulWidget {
  const FluukyApp({super.key});

  @override
  State<FluukyApp> createState() => _FluukyAppState();
}

class _FluukyAppState extends State<FluukyApp> {
  String appRoot = splash;

  @override
  void initState() {
    // PushNotificationsManager.instance.setUpFirebase(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: ChangeNotifierProvider(
        create: (_) => ThemeProvider(),
        child: Consumer<ThemeProvider>(builder: (context, ThemeProvider themeNotifier, child) {
          return GetMaterialApp(
            // supportedLocales: const [
            //   Locale('en', ''),
            //   Locale('ar', ''),
            // ],
            // localizationsDelegates: const [
            //   AppLocalizationsDelegate(),
            //   GlobalMaterialLocalizations.delegate,
            //   GlobalWidgetsLocalizations.delegate,
            // ],
            // localeResolutionCallback: (locale, supportedLocales) {
            //   for (var supportedLocale in supportedLocales) {
            //     if (supportedLocale.languageCode == locale?.languageCode) {
            //       return supportedLocale;
            //     }
            //   }
            //   return supportedLocales.first;
            // },
            initialBinding: InitialBindings(),
            theme: FluukyTheme.lightTheme,
            themeMode: ThemeMode.system,
            initialRoute: appRoot,
            getPages: generateRoute,
            title: "Fluuky App",
            debugShowCheckedModeBanner: false,
          );
        }),
      ),
    );
  }
}

// class AppLocalizations {
//   final Locale locale;

//   AppLocalizations(this.locale);

//   static AppLocalizations? of(BuildContext context) {
//     return Localizations.of<AppLocalizations>(context, AppLocalizations);
//   }

//   Map<String, String>? _localizedStrings;

//   Future<bool> load() async {
//     String jsonString = await rootBundle.loadString('assets/languages/${locale.languageCode}.json');
//     Map<String, dynamic> jsonMap = json.decode(jsonString);

//     _localizedStrings = jsonMap.map((key, value) {
//       return MapEntry(key, value.toString());
//     });

//     return true;
//   }

//   String translate(String key) {
//     return _localizedStrings![key] ?? key;
//   }
// }

// class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
//   const AppLocalizationsDelegate();

//   @override
//   bool isSupported(Locale locale) {
//     return ['en', 'ar'].contains(locale.languageCode);
//   }

//   @override
//   Future<AppLocalizations> load(Locale locale) async {
//     AppLocalizations localizations = AppLocalizations(locale);
//     await localizations.load();
//     return localizations;
//   }

//   @override
//   bool shouldReload(AppLocalizationsDelegate old) => false;
// }
