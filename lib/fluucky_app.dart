import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/app/utils/app_navigation.dart';
import 'package:fluuky/app/utils/theme_provider.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/bindings/initial_bindings.dart';
import 'package:get/get.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:provider/provider.dart';

class FluukyApp extends StatefulWidget {
  const FluukyApp({super.key});

  @override
  State<FluukyApp> createState() => _FluukyAppState();
}

class _FluukyAppState extends State<FluukyApp> {
  String appRoot = splash;
  // static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return ChangeNotifierProvider(
            create: (_) => ThemeProvider(),
            child: Consumer<ThemeProvider>(builder: (context, ThemeProvider themeNotifier, child) {
              return GetMaterialApp(
                title: "Fluuky App",
                initialRoute: appRoot,
                getPages: generateRoute,
                themeMode: ThemeMode.system,
                debugShowCheckedModeBanner: false,
                initialBinding: InitialBindings(),
                locale: const Locale('en'),
                supportedLocales: const [
                  Locale('en'),
                  Locale('ar'),
                ],
                localizationsDelegates: const [
                  AppLocalizationsDelegate(),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                localeResolutionCallback: (locale, supportedLocales) {
                  for (var supportedLocale in supportedLocales) {
                    if (supportedLocale.languageCode == locale?.languageCode) {
                      return supportedLocale;
                    }
                  }
                  return supportedLocales.first;
                },
                theme: FluukyTheme.lightTheme,
              );
            }),
          );
        });
  }
}
