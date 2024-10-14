import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluuky/fluucky_app.dart';
import 'package:fluuky/restart_widget.dart';
// import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  // await GetStorage.init();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  FlutterError.onError = (FlutterErrorDetails details) {
    // Log the error or report it to a service
    FlutterError.dumpErrorToConsole(details);
  };

  runApp(const RestartWidget(child: FluukyApp()));

  FlutterNativeSplash.remove();
}
