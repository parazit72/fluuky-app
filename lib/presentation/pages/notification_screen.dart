import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluuky/presentation/controllers/controllers.dart';
import 'package:fluuky/presentation/pages/home_screen/home_screen.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NotificationController controller = Get.find<NotificationController>();

    return BackgroundScaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F7F7),
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Color(0xFFF7F7F7),
          statusBarColor: Color(0xFFF7F7F7),
        ),
        shadowColor: Colors.black,
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: IconButton(
          splashRadius: 50,
          onPressed: () => Get.offAll(() => const HomeScreen()),
          icon: const Icon(Icons.chevron_left, size: 24),
        ),
        actions: [
          IconButton(
            onPressed: () => _showScrollableSheetNotificationDialog(controller),
            icon: const Icon(Icons.more_vert, size: 24),
          )
        ],
        leadingWidth: 24,
        elevation: 2,
        surfaceTintColor: Colors.transparent,
        title: Text(
          'Notifications',
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
      ),
      body: Obx(() {
        return Expanded(
          child: ListView.builder(
            itemCount: controller.notifications.length,
            itemBuilder: (context, index) {
              final notification = controller.notifications[index];
              return ListTile(
                title: Text(notification.title),
                subtitle: Text(notification.body),
                trailing: notification.isRead ? Icon(Icons.check, color: Colors.green) : Icon(Icons.circle, color: Colors.red),
              );
            },
          ),
        );
      }),
    );
  }

  void _showScrollableSheetNotificationDialog(NotificationController controller) {
    // Get.back();
    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.3,
          minChildSize: 0.3,
          maxChildSize: 0.3,
          builder: (context, scrollController) {
            return Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/paper.jpg"), fit: BoxFit.cover),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)),
                boxShadow: [BoxShadow(offset: Offset(0, -1), color: Colors.black26, spreadRadius: 0, blurRadius: 4)],
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Notifications', style: Theme.of(context).textTheme.titleLarge),
                    Text('Choose one of the following options', style: Theme.of(context).textTheme.bodySmall),
                    const SizedBox(height: 10),
                    TextButton(
                      style: ButtonStyle(
                        padding: WidgetStateProperty.all(const EdgeInsets.all(0)),
                        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
                      ),
                      onPressed: () async => await controller.markAllAsRead(),
                      child: const Text('Mark all as read'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Push Notifications', style: Theme.of(context).textTheme.bodySmall),
                        Obx(
                          () {
                            return Switch(
                              value: controller.pushNotificationsEnabled.value,
                              onChanged: (value) {
                                controller.togglePushNotifications(value);
                              },
                            );
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
