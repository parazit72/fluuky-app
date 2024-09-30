import 'package:fluuky/data/providers/network/api_provider.dart';
import 'package:fluuky/data/providers/network/api_representable.dart';

enum RaffleEndpoint { getRaffles, getRaffle, getRaffleCategories }

class RaffleAPI implements APIRequestRepresentable {
  final RaffleEndpoint raffleEndpoint;
  final Map<String, dynamic>? bodyData;

  RaffleAPI({required this.raffleEndpoint, this.bodyData});

  @override
  String get endpoint {
    switch (raffleEndpoint) {
      case RaffleEndpoint.getRaffleCategories:
        return '/categories';
      case RaffleEndpoint.getRaffles:
        return '/draws';
      case RaffleEndpoint.getRaffle:
        return '/draws/${bodyData?['id']}';
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
    switch (raffleEndpoint) {
      case RaffleEndpoint.getRaffle:
      case RaffleEndpoint.getRaffles:
      case RaffleEndpoint.getRaffleCategories:
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
