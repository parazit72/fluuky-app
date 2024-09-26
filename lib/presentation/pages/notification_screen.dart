import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/domain/entities/notification_entity.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/controllers.dart';
import 'package:fluuky/presentation/pages/home_screen/home_screen.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:fluuky/app/config/fluuky_theme.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NotificationController notificationController = Get.find<NotificationController>();
    var t = AppLocalizations.of(context)!;

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
            onPressed: () => _showScrollableSheetNotificationDialog(notificationController),
            icon: const Icon(Icons.more_vert, size: 24),
          )
        ],
        leadingWidth: 50,
        elevation: 2,
        surfaceTintColor: Colors.transparent,
        title: Text(
          t.translate('Notifications'),
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
      ),
      body: Obx(() {
        return Column(
          children: [
            const SizedBox(height: 32),
            notificationController.notifications.isEmpty
                ? Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(t.translate('We don’t have any notifications today! Check back later.'),
                            style: FluukyTheme.lightTheme.textTheme.titleLarge),
                        SvgPicture.asset('assets/images/we-dont-have-any-notification.svg')
                      ],
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: notificationController.notifications.length,
                      itemBuilder: (context, index) {
                        final notification = notificationController.notifications[index];
                        return NotificationRowWidget(notification: notification);
                      },
                    ),
                  ),
          ],
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
        var t = AppLocalizations.of(context)!;
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
                    Text(t.translate('Notifications'), style: FluukyTheme.lightTheme.textTheme.titleLarge),
                    Text(t.translate('chooseOneOfTheFollowing'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
                    const SizedBox(height: 10),
                    TextButton(
                      style: ButtonStyle(
                        padding: WidgetStateProperty.all(const EdgeInsets.all(0)),
                        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
                      ),
                      onPressed: () async => await controller.markAllAsRead(),
                      child: Text(t.translate('mark_all_as_read')),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(t.translate('push_notifications'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
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

class NotificationRowWidget extends StatelessWidget {
  const NotificationRowWidget({super.key, required this.notification});

  final NotificationEntity notification;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.only(bottom: 10, top: 10, left: 20, right: 47),
      decoration: notification.isRead
          ? BoxDecoration(
              boxShadow: const [
                BoxShadow(color: Color(0xFFDBDBDB)),
                BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
              ],
              color: Theme.of(context).primaryColor.withOpacity(0.1),
            )
          : null,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              notification.isRead
                  ? Row(
                      children: [
                        Icon(Icons.circle, color: FluukyTheme.primaryColor, size: 6),
                        const SizedBox(width: 8),
                      ],
                    )
                  : const SizedBox(width: 14),
              CircleAvatar(
                backgroundColor: FluukyTheme.secondaryColor,
                // backgroundImage: AssetImage(notification.imageUrl),
              ),
            ],
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(notification.title, style: Theme.of(context).textTheme.titleSmall),
                    const SizedBox(width: 8),
                    Text(timeago.format(DateTime.parse(notification.timestamp.toString())),
                        style: FluukyTheme.lightTheme.textTheme.displaySmall!.copyWith(color: Colors.grey)),
                  ],
                ),
                Text(notification.body, style: FluukyTheme.lightTheme.textTheme.displaySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
