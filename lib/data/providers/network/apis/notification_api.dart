import 'package:fluuky/data/providers/network/api_provider.dart';
import 'package:fluuky/data/providers/network/api_representable.dart';

enum NotificationEndpoint { getNotifications, getNotification }

class NotificationAPI implements APIRequestRepresentable {
  final NotificationEndpoint notificationEndpoint;
  final Map<String, dynamic>? bodyData;

  NotificationAPI({required this.notificationEndpoint, this.bodyData});

  @override
  String get endpoint {
    switch (notificationEndpoint) {
      case NotificationEndpoint.getNotifications:
        return '/notifications';
      case NotificationEndpoint.getNotification:
        return '/notifications/${bodyData?['id']}';
      default:
        throw Exception('Unknown endpoint');
    }
  }

  Map<String, dynamic>? get data => bodyData;

  @override
  get body => bodyData;

  @override
  Map<String, String>? get headers => {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Accept-Language': 'en',
      };

  @override
  RequestMethod get method {
    switch (notificationEndpoint) {
      case NotificationEndpoint.getNotification:
      case NotificationEndpoint.getNotifications:
        return RequestMethod.get;
    }
  }

  @override
  String get path => throw UnimplementedError();

  @override
  Map<String, dynamic>? get query => null;

  @override
  String get url => APIEndpoint.fluukyapi + endpoint;
}
