import 'package:fluuky/domain/entities/notification_entity.dart';

abstract class NotificationRepository {
  Future<void> initializeNotifications();
  Future<void> subscribeToTopic(String topic);
  Future<void> unsubscribeFromTopic(String topic);
  Future<void> requestPermission();
  Future<List<NotificationEntity>> fetchNotifications();
  Future<void> markAllAsRead();
  Future<void> togglePushNotifications(bool enabled);
}
