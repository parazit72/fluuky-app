import 'package:fluuky/domain/entities/notification_entity.dart';

class NotificationProvider {
  Future<List<NotificationEntity>> fetchNotifications() async {
    // Simulating network request
    await Future.delayed(const Duration(seconds: 2));

    return [
      NotificationEntity(
        id: '1',
        body: 'Buy Rolex Cosmograph Daytona',
        isRead: false,
        timestamp: DateTime.now(),
        title: 'Rolex Cosmograph Daytona',
      ),
      NotificationEntity(
        id: '2',
        body: 'Buy Rolex Cosmograph Daytona',
        isRead: false,
        timestamp: DateTime.now(),
        title: 'Rolex Cosmograph Daytona',
      ),
      NotificationEntity(
        id: '3',
        body: 'Buy Rolex Cosmograph Daytona',
        isRead: false,
        timestamp: DateTime.now(),
        title: 'Rolex Cosmograph Daytona',
      ),
    ];
  }
}
