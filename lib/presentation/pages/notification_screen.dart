import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          splashRadius: 50.w,
          onPressed: () => Get.offAll(() => const HomeScreen()),
          icon: Icon(Icons.chevron_left, size: 24.w),
        ),
        actions: [
          IconButton(
            onPressed: () => _showScrollableSheetNotificationDialog(notificationController),
            icon: Icon(Icons.more_vert, size: 24.w),
          )
        ],
        leadingWidth: 50.w,
        elevation: 2,
        surfaceTintColor: Colors.transparent,
        title: Text(
          t.translate('Notifications'),
          style: FluukyTheme.lightTheme.textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
      ),
      body: Obx(() {
        return Column(
          children: [
            SizedBox(height: 32.h),
            notificationController.notifications.isEmpty
                ? Padding(
                    padding: EdgeInsets.all(20.w),
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
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                image: const DecorationImage(image: AssetImage("assets/images/paper.jpg"), fit: BoxFit.cover),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(35.w), topRight: Radius.circular(35.w)),
                boxShadow: const [BoxShadow(offset: Offset(0, -1), color: Colors.black26, spreadRadius: 0, blurRadius: 4)],
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(t.translate('Notifications'), style: FluukyTheme.lightTheme.textTheme.titleLarge),
                    Text(t.translate('chooseOneOfTheFollowing'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
                    SizedBox(height: 10.h),
                    TextButton(
                      style: ButtonStyle(
                        textStyle: WidgetStateProperty.all(FluukyTheme.lightTheme.textTheme.labelLarge),
                        padding: WidgetStateProperty.all(const EdgeInsets.all(0)),
                        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
                      ),
                      onPressed: () async => await controller.markAllAsRead(),
                      child: Text(t.translate('mark_all_as_read')),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(t.translate('push_notifications'), style: FluukyTheme.lightTheme.textTheme.bodySmall),
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
      // margin:  EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.only(bottom: 10.h, top: 10.h, left: 20.w, right: 47.w),
      decoration: notification.isRead
          ? BoxDecoration(
              boxShadow: [
                BoxShadow(color: FluukyTheme.secondaryColor),
                const BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
              ],
              color: FluukyTheme.primaryColor.withOpacity(0.08),
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
                        Icon(Icons.circle, color: FluukyTheme.primaryColor, size: 6.w),
                        SizedBox(width: 8.w),
                      ],
                    )
                  : SizedBox(width: 14.w),
              CircleAvatar(
                backgroundColor: FluukyTheme.secondaryColor,
                // backgroundImage: AssetImage(notification.imageUrl),
              ),
            ],
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(notification.title, style: FluukyTheme.lightTheme.textTheme.bodyLarge),
                        SizedBox(width: 8.w),
                        Text(timeago.format(DateTime.parse(notification.timestamp.toString())),
                            style: FluukyTheme.lightTheme.textTheme.labelSmall!.copyWith(color: FluukyTheme.thirdColor, fontSize: 10.w)),
                      ],
                    ),
                    SizedBox(width: 8.w),
                  ],
                ),
                Text(notification.body, style: FluukyTheme.lightTheme.textTheme.labelSmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
