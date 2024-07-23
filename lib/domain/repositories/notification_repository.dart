import 'package:fluuky/domain/entities/notification.dart';

abstract class NotificationRepository {
  Future<List<NotificationEntity>> fetchNotifications();
  Future<void> markAllAsRead();
  Future<void> togglePushNotifications(bool enabled);
}
