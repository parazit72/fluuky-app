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

  @HiveField(5)
  final String imageUrl;

  NotificationEntity({
    required this.id,
    required this.title,
    required this.body,
    required this.isRead,
    required this.imageUrl,
    required this.timestamp,
  });

  factory NotificationEntity.fromJson(Map<String, dynamic> json) {
    return NotificationEntity(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      isRead: json['isRead'],
      imageUrl: json['imageUrl'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'isRead': isRead,
      'imageUrl': imageUrl,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
