import 'package:fluuky/data/providers/network/api_provider.dart';
import 'package:fluuky/data/providers/network/api_representable.dart';

enum OrderEndpoint { getOrders, getOrder }

class OrderAPI implements APIRequestRepresentable {
  final OrderEndpoint orderEndpoint;
  Map<String, dynamic>? bodyData;

  OrderAPI({required this.orderEndpoint, this.bodyData});

  @override
  String get url => APIEndpoint.fluukyapi + endpoint;

  @override
  String get endpoint => path;

  @override
  String get path {
    switch (orderEndpoint) {
      case OrderEndpoint.getOrders:
        return '/orders';
      case OrderEndpoint.getOrder:
        return '/order';
    }
  }

  @override
  RequestMethod get method {
    switch (orderEndpoint) {
      case OrderEndpoint.getOrders:
      case OrderEndpoint.getOrder:
        return RequestMethod.get;
    }
  }

  @override
  Map<String, String>? get headers => {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Accept-Language': 'en',
      };

  @override
  Map<String, dynamic>? get query => null;

  @override
  dynamic get body => bodyData;
}
