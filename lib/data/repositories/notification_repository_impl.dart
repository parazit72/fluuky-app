import 'package:fluuky/data/providers/database/local_notification_datasource.dart';
import 'package:fluuky/data/providers/database/push_notification_datasource.dart';
import 'package:fluuky/domain/entities/notification.dart';
import 'package:fluuky/domain/repositories/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final LocalNotificationDataSource localDataSource;
  final PushNotificationDataSource pushDataSource;

  NotificationRepositoryImpl({
    required this.localDataSource,
    required this.pushDataSource,
  });

  @override
  Future<List<NotificationEntity>> fetchNotifications() async {
    // Fetch notifications from the local data source
    final notifications = await localDataSource.getNotifications();
    return notifications;
  }

  @override
  Future<void> markAllAsRead() async {
    // Mark all notifications as read in the local data source
    await localDataSource.markAllAsRead();
  }

  @override
  Future<void> togglePushNotifications(bool enabled) async {
    if (enabled) {
      await pushDataSource.subscribeToTopic('all');
    } else {
      await pushDataSource.unsubscribeFromTopic('all');
    }
  }
}
