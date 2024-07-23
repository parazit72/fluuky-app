import 'package:fluuky/domain/repositories/notification_repository.dart';

class TogglePushNotificationsUseCase {
  final NotificationRepository repository;

  TogglePushNotificationsUseCase(this.repository);

  Future<void> execute(bool enabled) async {
    await repository.togglePushNotifications(enabled);
  }
}
