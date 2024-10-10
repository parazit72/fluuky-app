class NotificationModel {
  String id;
  String title;
  String body;
  String imageUrl;
  bool isRead;
  DateTime timestamp;
  Map<String, dynamic> data;

  NotificationModel({
    required this.id,
    required this.title,
    required this.body,
    required this.imageUrl,
    required this.timestamp,
    required this.isRead,
    required this.data,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      imageUrl: json['imageUrl'] as String,
      timestamp: DateTime.parse(json['timestamp']),
      isRead: json['isRead'] as bool,
      data: json['data'] as Map<String, dynamic>,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'imageUrl': imageUrl,
      'isRead': isRead,
      'data': data,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
