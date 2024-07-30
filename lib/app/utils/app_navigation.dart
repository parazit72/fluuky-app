import 'package:flutter/material.dart';
import 'package:fluuky/presentation/pages/home_screen.dart';
import 'package:fluuky/presentation/pages/auth/verification_screen.dart';
import 'package:fluuky/presentation/pages/intro/walkthrough_screen.dart';
import 'package:fluuky/presentation/pages/auth/login_screen.dart';
import 'package:fluuky/presentation/pages/pages.dart';
import 'package:fluuky/app/config/route_constants.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case splash:
      return MaterialPageRoute(builder: (_) => const SplashScreen());

    // case notfication:
    //   return MaterialPageRoute(
    //     builder: (_) => const NotificationScreen(),
    //   );

    case walkthrough:
      return MaterialPageRoute(
        builder: (_) => const WalkthroughScreen(),
      );

    case home:
      return MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      );

    case signUp:
      return MaterialPageRoute(
        builder: (_) => SignupScreen(),
      );

    case login:
      return MaterialPageRoute(
        builder: (_) => LoginScreen(),
      );

    case privacyPolicy:
      return MaterialPageRoute(
        builder: (_) => PrivacyPolicyScreen(),
      );
    case termsAndCondition:
      return MaterialPageRoute(
        builder: (_) => TermsAndConditionScreen(),
      );

    case helpCenter:
      return MaterialPageRoute(
        builder: (_) => const HelpCenterScreen(),
      );

    case draw:
      return MaterialPageRoute(builder: (_) => DrawItemScreen());

    case verification:
      return MaterialPageRoute(builder: (_) => VerificationScreen());

    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(child: Text('No route defined for ${settings.name}')),
              ));
  }
}
