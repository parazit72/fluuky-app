import 'package:hive/hive.dart';

part 'notification_entity.g.dart';

@HiveType(typeId: 1)
class NotificationEntity {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String body;

  @HiveField(3)
  bool isRead;

  @HiveField(4)
  final DateTime timestamp;

  NotificationEntity({
    required this.id,
    required this.title,
    required this.body,
    required this.isRead,
    required this.timestamp,
  });
}
