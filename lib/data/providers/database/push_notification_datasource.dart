import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fluuky/data/models/notification_model.dart';
import 'package:hive/hive.dart';

class PushNotificationDataSource {
  final FirebaseMessaging firebaseMessaging;

  PushNotificationDataSource(this.firebaseMessaging);

  Future<void> initialize() async {
    // Initialize Hive
    // await _initHive();

    // Request notification permissions for iOS
    await firebaseMessaging.requestPermission();

    // Set the foreground message handler
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('onMessage: ${message.messageId}');
      _handleNotification(message);
    });

    // Set the background message handler
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Set the notification click handler when the app is in background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('onMessageOpenedApp: ${message.messageId}');
      _handleNotification(message);
    });

    // Check if the app was opened via a notification when it was completely closed
    RemoteMessage? initialMessage = await firebaseMessaging.getInitialMessage();
    if (initialMessage != null) {
      print('getInitialMessage: ${initialMessage.messageId}');
      _handleNotification(initialMessage);
    }
  }

  Future<void> subscribeToTopic(String topic) async {
    await firebaseMessaging.subscribeToTopic(topic);
  }

  Future<void> unsubscribeFromTopic(String topic) async {
    await firebaseMessaging.unsubscribeFromTopic(topic);
  }

  // Handle notification and save to Hive
  void _handleNotification(RemoteMessage message) {
    // Create a NotificationModel from RemoteMessage
    NotificationModel notification = NotificationModel(
      id: message.messageId ?? '',
      title: message.notification?.title ?? '',
      body: message.notification?.body ?? '',
      isRead: false, // Assuming notification is unread when received
      timestamp: DateTime.now(),
    );

    // Save notification to Hive
    _saveNotification(notification);
  }

  // Save notification to Hive
  void _saveNotification(NotificationModel notification) async {
    final Box<NotificationModel> box = Hive.box<NotificationModel>('notificationsBox');
    await box.add(notification);
  }

  // Initialize Hive for local storage
  // Future<void> _initHive() async {
  //   final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  //   Hive.init(appDocumentDir.path);
  // Hive.registerAdapter(NotificationModelAdapter());
  // }
}

// Background message handler
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling a background message: ${message.messageId}');
  // Handle your notification
}

// Hive Adapter for NotificationModel
class NotificationModelAdapter extends TypeAdapter<NotificationModel> {
  @override
  final int typeId = 1;

  @override
  NotificationModel read(BinaryReader reader) {
    return NotificationModel(
      id: reader.read(),
      title: reader.read(),
      body: reader.read(),
      isRead: reader.read(),
      timestamp: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, NotificationModel obj) {
    writer.write(obj.id);
    writer.write(obj.title);
    writer.write(obj.body);
    writer.write(obj.isRead);
    writer.write(obj.timestamp);
  }
}
