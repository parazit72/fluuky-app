import 'package:flutter/material.dart';
import 'package:fluuky/domain/entities/raffle_entity.dart';
import 'package:fluuky/presentation/pages/auth/created_password_screen.dart';
import 'package:fluuky/presentation/pages/auth/details_about_you_screen.dart';
import 'package:fluuky/presentation/pages/basket/basket_screen.dart';
import 'package:fluuky/presentation/pages/checkout/checkout_screen.dart';
import 'package:fluuky/presentation/pages/profile/dashboard_screen/dashboard_screen.dart';
import 'package:fluuky/presentation/pages/profile/flukky_loyality_program_screen/flukky_loyality_program_screen.dart';
import 'package:fluuky/presentation/pages/profile/profile_menu_screen.dart';
import 'package:fluuky/presentation/pages/draw/draws_list_screen.dart';
import 'package:fluuky/presentation/pages/home_screen/home_screen.dart';
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
        builder: (_) => const SignupScreen(),
      );

    case login:
      return MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      );

    case dashboard:
      return MaterialPageRoute(
        builder: (_) => DashboardScreen(),
      );

    case recommendations:
      return MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      );

    case wishlist:
      return MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      );

    case greenSubscription:
      return MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      );

    case packages:
      return MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      );

    case flukkyLoyalityProgram:
      return MaterialPageRoute(
        builder: (_) => const FlukkyLoyalityProgramScreen(),
      );

    case logout:
      return MaterialPageRoute(
        builder: (_) => const LoginScreen(),
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
      final raffle = settings.arguments as RaffleEntity;
      return MaterialPageRoute(builder: (_) => DrawItemScreen(selectedRaffle: raffle));

    case profile:
      return MaterialPageRoute(builder: (_) => const ProfileMenuScreen());

    case drawList:
      return MaterialPageRoute(builder: (_) => const DrawsListScreen());

    case verification:
      return MaterialPageRoute(builder: (_) => VerificationScreen());

    case detailsAboutYou:
      return MaterialPageRoute(builder: (_) => DetailsAboutYouScreen());

    case basket:
      return MaterialPageRoute(builder: (_) => const BasketScreen());

    case checkout:
      return MaterialPageRoute(builder: (_) => const CheckoutScreen());

    case createdPassword:
      return MaterialPageRoute(builder: (_) => CreatedPasswordScreen());

    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(child: Text('No route defined for ${settings.name}')),
              ));
  }
}
