import 'package:fluuky/data/providers/network/api_endpoints.dart';
import 'package:fluuky/data/providers/network/api_representable.dart';

class RaffleAPI implements APIRequestRepresentable {
  final RaffleEndpoint raffleEndpoint;
  Map<String, dynamic>? bodyData;

  RaffleAPI({required this.raffleEndpoint, this.bodyData});

  @override
  String get url => APIEndpoint.fluukyapi + endpoint;

  @override
  String get endpoint => path;

  @override
  String get path {
    switch (raffleEndpoint) {
      case RaffleEndpoint.resendCode:
        return '/resendCode';
      case RaffleEndpoint.refreshToken:
        return '/refreshToken';
      case RaffleEndpoint.verifyCode:
        return '/verifyCode';
      case RaffleEndpoint.createPassword:
        return '/createPassword';
      case RaffleEndpoint.detailsAboutYou:
        return '/detailsAboutYou';
      case RaffleEndpoint.login:
        return '/login';
      case RaffleEndpoint.logout:
        return '/auth/logout';
      case RaffleEndpoint.register:
        return '/auth/register';
      case RaffleEndpoint.getCurrentUser:
        return '/auth/user';
    }
  }

  @override
  RequestMethod get method {
    switch (raffleEndpoint) {
      case RaffleEndpoint.resendCode:
      case RaffleEndpoint.refreshToken:
      case RaffleEndpoint.createPassword:
      case RaffleEndpoint.verifyCode:
      case RaffleEndpoint.detailsAboutYou:
      case RaffleEndpoint.login:
      case RaffleEndpoint.register:
        return RequestMethod.post;
      case RaffleEndpoint.logout:
        return RequestMethod.post; // or RequestMethod.get
      case RaffleEndpoint.getCurrentUser:
        return RequestMethod.get;
    }
  }

  @override
  Map<String, String>? get headers => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

  @override
  Map<String, dynamic>? get query => null;

  @override
  dynamic get body => bodyData;
}

enum RaffleEndpoint { login, logout, register, getCurrentUser, detailsAboutYou, createPassword, verifyCode, refreshToken, resendCode }
