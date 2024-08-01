import 'package:fluuky/data/providers/database/local_notification_datasource.dart';
import 'package:get/get.dart';
import 'package:fluuky/domain/usecases/fetch_notifications_usecase.dart';
import 'package:fluuky/domain/usecases/mark_all_as_read_usecase.dart';
import 'package:fluuky/domain/usecases/toggle_push_notifications_usecase.dart';
import 'package:fluuky/domain/entities/notification.dart';

class NotificationController extends GetxController {
  final FetchNotificationsUseCase fetchNotificationsUseCase;
  final MarkAllAsReadUseCase markAllAsReadUseCase;
  final TogglePushNotificationsUseCase togglePushNotificationsUseCase;
  final LocalNotificationDataSource localNotificationDataSource;

  var notifications = <NotificationEntity>[].obs;
  var pushNotificationsEnabled = true.obs;
  var notificationCount = 0.obs;

  NotificationController({
    required this.fetchNotificationsUseCase,
    required this.markAllAsReadUseCase,
    required this.togglePushNotificationsUseCase,
    required this.localNotificationDataSource,
  });

  @override
  void onInit() {
    loadNotifications();
    super.onInit();
  }

  Future<void> loadNotifications() async {
    final result = await fetchNotificationsUseCase.execute();
    notifications.assignAll(result);
    updateNotificationCount();
  }

  Future<void> markAllAsRead() async {
    await markAllAsReadUseCase.execute();
    await loadNotifications();
  }

  Future<void> togglePushNotifications(bool enabled) async {
    await togglePushNotificationsUseCase.execute(enabled);
    pushNotificationsEnabled.value = enabled;
  }

  void updateNotificationCount() {
    notificationCount.value = notifications.where((n) => !n.isRead).length;
  }
}
