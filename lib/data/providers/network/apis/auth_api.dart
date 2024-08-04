import 'package:fluuky/data/providers/network/api_provider.dart';
import 'package:fluuky/data/providers/network/api_representable.dart';

enum AuthEndpoint { login, logout, register, getCurrentUser, detailsAboutYou, createPassword, verifyCode, refreshToken, resendCode }

class AuthAPI implements APIRequestRepresentable {
  final AuthEndpoint authEndpoint;
  Map<String, dynamic>? bodyData;

  AuthAPI({required this.authEndpoint, this.bodyData});

  @override
  String get url => APIEndpoint.fluukyapi + endpoint;

  @override
  String get endpoint => path;

  @override
  String get path {
    switch (authEndpoint) {
      case AuthEndpoint.resendCode:
        return '/resendCode';
      case AuthEndpoint.refreshToken:
        return '/refreshToken';
      case AuthEndpoint.verifyCode:
        return '/verifyCode';
      case AuthEndpoint.createPassword:
        return '/createPassword';
      case AuthEndpoint.detailsAboutYou:
        return '/detailsAboutYou';
      case AuthEndpoint.login:
        return '/login';
      case AuthEndpoint.logout:
        return '/auth/logout';
      case AuthEndpoint.register:
        return '/auth/register';
      case AuthEndpoint.getCurrentUser:
        return '/auth/user';
    }
  }

  @override
  RequestMethod get method {
    switch (authEndpoint) {
      case AuthEndpoint.resendCode:
      case AuthEndpoint.refreshToken:
      case AuthEndpoint.createPassword:
      case AuthEndpoint.verifyCode:
      case AuthEndpoint.detailsAboutYou:
      case AuthEndpoint.login:
      case AuthEndpoint.register:
        return RequestMethod.post;
      case AuthEndpoint.logout:
        return RequestMethod.post; // or RequestMethod.get
      case AuthEndpoint.getCurrentUser:
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
