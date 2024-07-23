import 'package:fluuky/domain/repositories/notification_repository.dart';

class MarkAllAsReadUseCase {
  final NotificationRepository repository;

  MarkAllAsReadUseCase(this.repository);

  Future<void> execute() async {
    await repository.markAllAsRead();
  }
}
