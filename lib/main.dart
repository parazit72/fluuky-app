import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluuky/domain/entities/category.dart';
import 'package:fluuky/domain/entities/notification.dart';
import 'package:fluuky/domain/entities/raffle.dart';
import 'package:fluuky/fluucky_app.dart';
import 'package:fluuky/restart_widget.dart';
import 'firebase_options.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  // Initialize Hive

  await Hive.initFlutter();
  Hive.registerAdapter(NotificationEntityAdapter());
  await Hive.openBox<NotificationEntity>('notificationsBox');
  Hive.registerAdapter(RaffleEntityAdapter());
  await Hive.openBox<RaffleEntity>('rafflesBox');
  Hive.registerAdapter(CategoryEntityAdapter());
  await Hive.openBox<CategoryEntity>('categoryBox');

  runApp(const RestartWidget(child: FluukyApp()));
  FlutterNativeSplash.remove();
}
