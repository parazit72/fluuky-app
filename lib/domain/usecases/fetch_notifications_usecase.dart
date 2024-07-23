import 'package:fluuky/domain/entities/notification.dart';
import 'package:fluuky/domain/repositories/notification_repository.dart';

class FetchNotificationsUseCase {
  final NotificationRepository repository;

  FetchNotificationsUseCase(this.repository);

  Future<List<NotificationEntity>> execute() async {
    return await repository.fetchNotifications();
  }
}
