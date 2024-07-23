import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluuky/data/providers/database/local_notification_datasource.dart';
import 'package:fluuky/data/providers/database/push_notification_datasource.dart';
import 'package:fluuky/data/providers/network/api_provider.dart';
import 'package:fluuky/data/repositories/auth_repository_impl.dart';
import 'package:fluuky/data/repositories/notification_repository_impl.dart';
import 'package:fluuky/domain/repositories/auth_repository.dart';
import 'package:fluuky/domain/usecases/fetch_notifications_usecase.dart';
import 'package:fluuky/domain/usecases/mark_all_as_read_usecase.dart';
import 'package:fluuky/domain/usecases/toggle_push_notifications_usecase.dart';
import 'package:fluuky/firebase_options.dart';
import 'package:fluuky/presentation/controllers/controllers.dart';
import 'package:fluuky/presentation/controllers/login_controller.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static Future<void> init() async {
    // Firebase initialization
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

    // FlutterLocalNotificationsPlugin initialization
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    final localNotificationDataSource = LocalNotificationDataSource(flutterLocalNotificationsPlugin);
    await localNotificationDataSource.init();

    // FirebaseMessaging initialization
    final firebaseMessaging = FirebaseMessaging.instance;
    final pushNotificationDataSource = PushNotificationDataSource(firebaseMessaging);
    pushNotificationDataSource.initialize();

    // NotificationRepository initialization
    final notificationRepository = NotificationRepositoryImpl(
      localDataSource: localNotificationDataSource,
      pushDataSource: pushNotificationDataSource,
    );

    // Use cases
    Get.put(FetchNotificationsUseCase(notificationRepository));
    Get.put(MarkAllAsReadUseCase(notificationRepository));
    Get.put(TogglePushNotificationsUseCase(notificationRepository));
    Get.lazyPut(() => LoginController());

    // API and Auth dependencies
    Get.put(APIProvider());
    Get.put(FlutterSecureStorage());
    Get.put<AuthRepository>(AuthRepositoryImpl(
      Get.find<APIProvider>(),
      Get.find<FlutterSecureStorage>(),
    ));
    Get.put(AuthController(Get.find<AuthRepository>()));

    // Add any other initializations here
  }
}
