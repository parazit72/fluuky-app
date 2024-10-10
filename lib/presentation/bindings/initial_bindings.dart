import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluuky/data/providers/database/local_notification_datasource.dart';
import 'package:fluuky/data/providers/database/push_notification_datasource.dart';
import 'package:fluuky/data/providers/network/dio_provider.dart';
import 'package:fluuky/data/repositories/basket_repository_impl.dart';
import 'package:fluuky/data/repositories/home_repository_impl.dart';
import 'package:fluuky/data/repositories/notification_repository_impl.dart';
import 'package:fluuky/data/repositories/order_repository_impl.dart';
import 'package:fluuky/data/repositories/raffle_repository_impl.dart';
import 'package:fluuky/data/repositories/winner_repository_impl.dart';
import 'package:fluuky/domain/repositories/basket_repository.dart';
import 'package:fluuky/domain/repositories/raffle_repository.dart';
import 'package:fluuky/presentation/controllers/basket_controller.dart';
import 'package:fluuky/presentation/controllers/controllers.dart';
import 'package:fluuky/presentation/controllers/home_controller.dart';
import 'package:fluuky/presentation/controllers/items_controller.dart';
import 'package:fluuky/presentation/controllers/order_controller.dart';
import 'package:fluuky/presentation/controllers/raffle_controller.dart';
import 'package:fluuky/presentation/controllers/story_controller.dart';
import 'package:fluuky/presentation/controllers/subscription_controller.dart';
import 'package:fluuky/presentation/controllers/winner_controller.dart';
import 'package:get/get.dart';
import 'package:fluuky/data/repositories/auth_repository_impl.dart';
import 'package:fluuky/domain/repositories/auth_repository.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() async {
    // Register RaffleProvider
    Get.put(DioProvider());

    // Register RaffleRepository with RaffleProvider
    Get.put(RaffleRepositoryImpl());
    Get.put<RaffleRepository>(Get.find<RaffleRepositoryImpl>());
    Get.put(HomeController(HomeRepositoryImpl()));

    Get.put(RaffleController(raffleRepository: Get.find<RaffleRepositoryImpl>()));
    Get.put(StoryController());
    Get.put(ItemsController());
    Get.put<NavBarController>(NavBarController());

    // Register FlutterSecureStorage
    Get.put(const FlutterSecureStorage());
    Get.put(AuthRepositoryImpl());
    Get.put<AuthRepository>(Get.find<AuthRepositoryImpl>());
    Get.put(AuthController(Get.find<AuthRepository>()));

    // Get.lazyPut(() => BasketRepositoryImpl());

    Get.lazyPut(() => SubscriptionController());

    Get.put(BasketRepositoryImpl());
    Get.put<BasketRepository>(Get.find<BasketRepositoryImpl>());
    Get.put(BasketController(Get.find<BasketRepository>()));

    // Initialize FlutterLocalNotificationsPlugin
    Get.put(FlutterLocalNotificationsPlugin());

    // Initialize FirebaseMessaging
    Get.put(FirebaseMessaging.instance);

    // Register Notification Data Sources with required dependencies
    Get.put(LocalNotificationDataSource(Get.find<FlutterLocalNotificationsPlugin>()));
    Get.put(PushNotificationDataSource(Get.find<FirebaseMessaging>()));

    // Register NotificationRepository with data sources
    Get.put(NotificationRepositoryImpl());
    Get.put(WinnerController(RaffleRepositoryImpl(), winnerRepository: WinnerRepositoryImpl()));
    Get.put(NotificationController(notificationRepository: Get.find<NotificationRepositoryImpl>()));

    Get.put(OrderController(orderRepository: OrderRepositoryImpl()));
    // Bind your NotificationController
    Get.lazyPut(() => NotificationController(notificationRepository: Get.find<NotificationRepositoryImpl>()));
  }
}
