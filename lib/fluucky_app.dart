import 'package:flutter/material.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/app/utils/app_navigation.dart';
import 'package:fluuky/app/utils/theme_provider.dart';
import 'package:fluuky/initial_bindings.dart';
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
  String appRoot = walkthrough;

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
            initialBinding: InitialBindings(),
            theme: FluukyTheme.lightTheme,
            themeMode: ThemeMode.system,
            initialRoute: appRoot,
            onGenerateRoute: generateRoute,
            title: "Fluuky App",
            debugShowCheckedModeBanner: false,
          );
        }),
      ),
    );
  }
}
