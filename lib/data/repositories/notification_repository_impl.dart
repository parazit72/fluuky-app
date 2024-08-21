import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fluuky/data/providers/notification_provider.dart';
import 'package:fluuky/domain/entities/notification_entity.dart';
import 'package:fluuky/domain/repositories/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  Future<void> initializeNotifications() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Handle foreground notifications
      print("New notification: ${message.notification?.title}");
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // Handle notification tapped in background
    });
  }

  @override
  Future<void> subscribeToTopic(String topic) async {
    await _firebaseMessaging.subscribeToTopic(topic);
  }

  @override
  Future<void> unsubscribeFromTopic(String topic) async {
    await _firebaseMessaging.unsubscribeFromTopic(topic);
  }

  @override
  Future<void> requestPermission() async {
    await _firebaseMessaging.requestPermission();
  }

  @override
  Future<List<NotificationEntity>> fetchNotifications() async {
    NotificationProvider notificationProvider = NotificationProvider();
    notificationProvider.fetchNotifications();
    // final response = await _httpClient.get('/notifications');
    // if (response.statusCode == 200) {
    //   return NotificationEntity.fromJsonList(response.data);
    // }
    // throw Exception("Failed to fetch notifications");

    return [];
  }

  @override
  Future<void> markAllAsRead() async {
    // final response = await _httpClient.post('/notifications/mark-all-as-read');
    // if (response.statusCode != 200) {
    //   throw Exception("Failed to mark notifications as read");
    // }
  }

  @override
  Future<void> togglePushNotifications(bool enable) async {
    if (enable) {
      await _firebaseMessaging.requestPermission();
    } else {
      await _firebaseMessaging.setAutoInitEnabled(false); // Disables notifications
    }
  }
}
