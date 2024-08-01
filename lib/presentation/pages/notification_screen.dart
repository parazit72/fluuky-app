import 'package:flutter/material.dart';
import 'package:fluuky/presentation/controllers/controllers.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the NotificationController
    return BackgroundScaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () => _showOptions(context),
          ),
        ],
      ),
      body: Obx(() {
        NotificationController controller = Get.find();
        return ListView.builder(
          itemCount: controller.notifications.length,
          itemBuilder: (context, index) {
            final notification = controller.notifications[index];
            return ListTile(
              title: Text(notification.title),
              subtitle: Text(notification.body),
              trailing: Text('${notification.timestamp}'),
              tileColor: notification.isRead ? Colors.white : Colors.greenAccent,
            );
          },
        );
      }),
    );
  }

  void _showOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        final NotificationController controller = Get.find();

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('Mark all as read'),
              onTap: () async {
                Navigator.pop(context);
                await controller.markAllAsRead();
              },
            ),
            ListTile(
              title: const Text('Push Notifications'),
              trailing: Obx(() {
                return Switch(
                  value: controller.pushNotificationsEnabled.value,
                  onChanged: (enabled) async {
                    await controller.togglePushNotifications(enabled);
                  },
                );
              }),
            ),
          ],
        );
      },
    );
  }
}
