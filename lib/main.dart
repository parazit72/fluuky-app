import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluuky/domain/entities/category_entity.dart';
import 'package:fluuky/domain/entities/notification_entity.dart';
import 'package:fluuky/domain/entities/raffle_entity.dart';
import 'package:fluuky/fluucky_app.dart';
import 'package:fluuky/restart_widget.dart';
// import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  // await GetStorage.init();

  // Initialize Hive
  await Hive.initFlutter();
  Hive.registerAdapter(NotificationEntityAdapter());
  await Hive.openBox<NotificationEntity>('notificationsBox');
  // Hive.registerAdapter(RaffleEntityAdapter());
  await Hive.openBox<RaffleEntity>('rafflesBox');

  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle.light.copyWith(
  //     statusBarColor: Colors.purple,
  //     systemNavigationBarColor: Colors.purple,
  //   ),
  // );

  runApp(const RestartWidget(child: FluukyApp()));
  FlutterNativeSplash.remove();
}
