import 'package:fluuky/domain/entities/notification_entity.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive_flutter/adapters.dart';

class LocalNotificationDataSource {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  final String boxName = 'notificationsBox';

  LocalNotificationDataSource(this.flutterLocalNotificationsPlugin);

  Future<void> init() async {
    // await Hive.initFlutter();
    // Hive.registerAdapter(NotificationEntityAdapter());
    // await Hive.openBox<NotificationEntity>(boxName);

    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<List<NotificationEntity>> getNotifications() async {
    final box = Hive.box<NotificationEntity>(boxName);
    return box.values.toList();
  }

  Future<void> markAllAsRead() async {
    final box = Hive.box<NotificationEntity>(boxName);
    final notifications = box.values.toList();
    for (var notification in notifications) {
      final updatedNotification = NotificationEntity(
        id: notification.id,
        title: notification.title,
        body: notification.body,
        isRead: true,
        imageUrl: 'assets/images/avatar.jpg',
        timestamp: notification.timestamp,
      );
      await box.put(notification.id, updatedNotification);
    }
  }

  Future<void> addNotification(NotificationEntity notification) async {
    final box = Hive.box<NotificationEntity>(boxName);
    await box.put(notification.id, notification);
  }

  Future<void> showNotification(String id, String title, String body) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      channelDescription: 'your_channel_description',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: id,
    );

    // Save notification to Hive
    final notificationEntity = NotificationEntity(
      id: id,
      title: title,
      body: body,
      isRead: false,
      imageUrl: 'assets/images/avatar.jpg',
      timestamp: DateTime.now(),
    );

    await addNotification(notificationEntity);
  }
}
