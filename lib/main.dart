import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluuky/data/repositories/auth_repository_impl.dart';
import 'package:fluuky/data/providers/database/local_notification_datasource.dart';
import 'package:fluuky/data/providers/database/push_notification_datasource.dart';
import 'package:fluuky/data/providers/network/api_provider.dart';
import 'package:fluuky/data/repositories/notification_repository_impl.dart';
import 'package:fluuky/domain/entities/notification.dart';
import 'package:fluuky/domain/repositories/auth_repository.dart';
import 'package:fluuky/domain/usecases/fetch_notifications_usecase.dart';
import 'package:fluuky/domain/usecases/mark_all_as_read_usecase.dart';
import 'package:fluuky/domain/usecases/toggle_push_notifications_usecase.dart';
import 'package:fluuky/presentation/controllers/controllers.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/app/utils/push_notifications_manager.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/app/config/server_configuration.dart';
import 'package:fluuky/app/utils/theme_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:overlay_support/overlay_support.dart';
import 'app/utils/app_navigation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'app/utils/shared_preference_helper.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize Hive
  // await Hive.initFlutter();
  // Hive.registerAdapter(NotificationEntityAdapter());

  // Initialize FlutterLocalNotificationsPlugin
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  final localNotificationDataSource = LocalNotificationDataSource(flutterLocalNotificationsPlugin);
  await localNotificationDataSource.init();

// Initialize FirebaseMessaging
  final firebaseMessaging = FirebaseMessaging.instance;
  final pushNotificationDataSource = PushNotificationDataSource(firebaseMessaging);
  pushNotificationDataSource.initialize();

  // Initialize NotificationRepository
  final notificationRepository = NotificationRepositoryImpl(
    localDataSource: localNotificationDataSource,
    pushDataSource: pushNotificationDataSource,
  );

  // Initialize use cases
  Get.put(FetchNotificationsUseCase(notificationRepository));
  Get.put(MarkAllAsReadUseCase(notificationRepository));
  Get.put(TogglePushNotificationsUseCase(notificationRepository));

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // hiveRegisterAdapter();

  runApp(const RestartWidget(child: FluukyApp()));
  FlutterNativeSplash.remove();
}

// Future<void> hiveRegisterAdapter() async {
//   var dir = await getApplicationDocumentsDirectory();
//   Hive.init(dir.path);

//   ///Home Page Model
//   // Hive.registerAdapter(NewProductsModelAdapter());
// }

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
            initialBinding: BindingsBuilder(() {
              Get.put(APIProvider());
              Get.put(FlutterSecureStorage());
              Get.put<AuthRepository>(AuthRepositoryImpl(
                Get.find<APIProvider>(),
                Get.find<FlutterSecureStorage>(),
              ));
              Get.put(AuthController(Get.find<AuthRepository>()));
            }),
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

class RestartWidget extends StatefulWidget {
  const RestartWidget({super.key, required this.child});
  final Widget child;

  static restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>()?.restartApp();
  }

  @override
  State<StatefulWidget> createState() {
    return _RestartWidgetState();
  }
}

class _RestartWidgetState extends State<RestartWidget> {
  Key _key = UniqueKey();
  void restartApp() {
    setState(() {
      _key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: _key,
      child: widget.child,
    );
  }
}
