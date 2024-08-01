import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluuky/app/services/auth_service.dart';
import 'package:fluuky/data/providers/category_provider.dart';
import 'package:fluuky/data/providers/database/local_notification_datasource.dart';
import 'package:fluuky/data/providers/database/push_notification_datasource.dart';
import 'package:fluuky/data/providers/raffle_provider.dart';
import 'package:fluuky/data/repositories/notification_repository_impl.dart';
import 'package:fluuky/data/repositories/raffle_repository_impl.dart';
import 'package:fluuky/domain/entities/raffle.dart';
import 'package:fluuky/domain/repositories/notification_repository.dart';
import 'package:fluuky/domain/repositories/raffle_repository.dart';
import 'package:fluuky/domain/usecases/fetch_notifications_usecase.dart';
import 'package:fluuky/domain/usecases/get_raffles_use_case.dart';
import 'package:fluuky/domain/usecases/mark_all_as_read_usecase.dart';
import 'package:fluuky/domain/usecases/toggle_push_notifications_usecase.dart';
import 'package:fluuky/domain/usecases/verify_code_usecase.dart';
import 'package:fluuky/presentation/controllers/category_controller.dart';
import 'package:fluuky/presentation/controllers/controllers.dart';
import 'package:fluuky/presentation/controllers/raffle_controller.dart';
import 'package:get/get.dart';
import 'package:fluuky/data/providers/network/api_provider.dart';
import 'package:fluuky/data/repositories/auth_repository_impl.dart';
import 'package:fluuky/domain/repositories/auth_repository.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() async {
    // Register APIProvider
    Get.put(APIProvider());

    // Register RaffleProvider
    Get.put(RaffleProvider());
    Get.put(CategoryProvider());

    final categoryProvider = Get.put(CategoryProvider());
    Get.put(CategoryController(categoryProvider.getAllCategoriesUseCase));

    // Register RaffleRepository with RaffleProvider
    Get.put<RaffleRepositoryImpl>(RaffleRepositoryImpl());
    Get.put<RaffleRepository>(Get.find<RaffleRepositoryImpl>());

    // Register GetRafflesUseCase with RaffleRepository
    Get.put(GetRafflesUseCase(Get.find<RaffleRepository>()));

    // Register RaffleController with GetRafflesUseCase
    Get.put(RaffleController(raffleRepository: Get.find<RaffleRepositoryImpl>()));

    Get.put<NavBarController>(NavBarController());
    // Register NotificationController with use cases

    // Register FlutterSecureStorage
    Get.put(const FlutterSecureStorage());
    Get.put(AuthService());

    // Register AuthRepository with APIProvider and FlutterSecureStorage
    Get.put(AuthRepositoryImpl(Get.find<APIProvider>(), Get.find<FlutterSecureStorage>()));
    Get.put<AuthRepository>(Get.find<AuthRepositoryImpl>());

    // Register VerifyCodeUseCase with AuthRepository
    Get.put(VerifyCodeUseCase(Get.find<AuthRepositoryImpl>()));

    // Register AuthController with AuthRepository and VerifyCodeUseCase
    Get.put(AuthController(Get.find<AuthRepository>(), Get.find<VerifyCodeUseCase>()));

    // Initialize FlutterLocalNotificationsPlugin
    Get.put(FlutterLocalNotificationsPlugin());

    // Initialize FirebaseMessaging
    Get.put(FirebaseMessaging.instance);

    // Register Notification Data Sources with required dependencies
    Get.put(LocalNotificationDataSource(Get.find<FlutterLocalNotificationsPlugin>()));
    Get.put(PushNotificationDataSource(Get.find<FirebaseMessaging>()));

    // Register NotificationRepository with data sources
    Get.put<NotificationRepository>(NotificationRepositoryImpl(
      localDataSource: Get.find<LocalNotificationDataSource>(),
      pushDataSource: Get.find<PushNotificationDataSource>(),
    ));

    // Initialize Notification Use Cases
    Get.put(FetchNotificationsUseCase(Get.find<NotificationRepository>()));
    Get.put(MarkAllAsReadUseCase(Get.find<NotificationRepository>()));
    Get.put(TogglePushNotificationsUseCase(Get.find<NotificationRepository>()));

    Get.lazyPut<NotificationController>(
      () => NotificationController(
        fetchNotificationsUseCase: Get.find<FetchNotificationsUseCase>(),
        markAllAsReadUseCase: Get.find<MarkAllAsReadUseCase>(),
        togglePushNotificationsUseCase: Get.find<TogglePushNotificationsUseCase>(),
        localNotificationDataSource: Get.find<LocalNotificationDataSource>(),
      ),
    );
  }
}
