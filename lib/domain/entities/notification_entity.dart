import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class NotificationEntity {
  final String id;
  final String title;
  final String body;
  bool isRead;
  final DateTime timestamp;
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
