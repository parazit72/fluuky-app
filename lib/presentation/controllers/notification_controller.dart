import 'package:fluuky/data/repositories/notification_repository_impl.dart';
import 'package:get/get.dart';
import 'package:fluuky/domain/entities/notification_entity.dart';

class NotificationController extends GetxController {
  final NotificationRepositoryImpl notificationRepository;

  var notifications = <NotificationEntity>[].obs;
  var pushNotificationsEnabled = true.obs;
  var notificationCount = 0.obs;

  NotificationController({required this.notificationRepository});

  @override
  void onInit() {
    notificationRepository.initializeNotifications();
    fetchNotifications();
    super.onInit();
  }

  Future<void> fetchNotifications() async {
    try {
      final result = await notificationRepository.fetchNotifications();
      notifications.assignAll(result);
      updateNotificationCount();
    } catch (e) {
      print("Error fetching notifications: $e");
    }
  }

  Future<void> markAllAsRead() async {
    try {
      await notificationRepository.markAllAsRead();
      for (var notification in notifications) {
        notification.isRead = true;
      }
      notifications.refresh();
    } catch (e) {
      print("Error marking notifications as read: $e");
    }
  }

  Future<void> togglePushNotifications(bool enabled) async {
    try {
      await notificationRepository.togglePushNotifications(enabled);
      pushNotificationsEnabled.value = enabled;
    } catch (e) {
      print("Error toggling notifications: $e");
    }
  }

  void updateNotificationCount() {
    notificationCount.value = notifications.where((n) => !n.isRead).length;
  }
}
