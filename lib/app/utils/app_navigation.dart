import 'package:flutter/material.dart';
import 'package:fluuky/domain/entities/raffle_entity.dart';
import 'package:fluuky/presentation/pages/auth/created_password_screen.dart';
import 'package:fluuky/presentation/pages/auth/details_about_you_screen.dart';
import 'package:fluuky/presentation/pages/basket/basket_screen.dart';
import 'package:fluuky/presentation/pages/checkout/checkout_screen.dart';
import 'package:fluuky/presentation/pages/dashboard_screen/dashboard_screen.dart';
import 'package:fluuky/presentation/pages/notification_screen.dart';
import 'package:fluuky/presentation/pages/profile/green_subscription_screen.dart';
import 'package:fluuky/presentation/pages/profile/packages_screen.dart';
import 'package:fluuky/presentation/pages/profile/personal_data_screen.dart';
import 'package:fluuky/presentation/pages/profile/billing_address_screen.dart';
import 'package:fluuky/presentation/pages/profile/change_password_screen.dart';
import 'package:fluuky/presentation/pages/profile/contact_information_screen.dart';
import 'package:fluuky/presentation/pages/profile/flukky_loyality_program_screen/flukky_loyality_program_screen.dart';
import 'package:fluuky/presentation/pages/profile/payment_method_screen.dart';
import 'package:fluuky/presentation/pages/profile/profile_menu_screen.dart';
import 'package:fluuky/presentation/pages/draw/draws_list_screen.dart';
import 'package:fluuky/presentation/pages/home_screen/home_screen.dart';
import 'package:fluuky/presentation/pages/auth/verification_screen.dart';
import 'package:fluuky/presentation/pages/intro/walkthrough_screen.dart';
import 'package:fluuky/presentation/pages/auth/login_screen.dart';
import 'package:fluuky/presentation/pages/pages.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/presentation/pages/profile/profile_preferences_screen.dart';
import 'package:fluuky/presentation/pages/profile/shipping_address_screen.dart';
import 'package:fluuky/presentation/pages/recommendations/recommendations_created.dart';
import 'package:fluuky/presentation/pages/recommendations/recommendations_form_screen.dart';
import 'package:fluuky/presentation/pages/recommendations/recommendations_screen.dart';
import 'package:fluuky/presentation/pages/story/story_screen.dart';
import 'package:fluuky/presentation/pages/wishlists/wishlist_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case splash:
      return MaterialPageRoute(builder: (_) => const SplashScreen());

    case notifications:
      return MaterialPageRoute(builder: (_) => const NotificationScreen());

    case walkthrough:
      return MaterialPageRoute(builder: (_) => const WalkthroughScreen());

    case home:
      return MaterialPageRoute(builder: (_) => const HomeScreen());

    case signUp:
      return MaterialPageRoute(builder: (_) => const SignupScreen());

    case login:
      return MaterialPageRoute(builder: (_) => const LoginScreen());

    case dashboard:
      return MaterialPageRoute(builder: (_) => DashboardScreen());

    case recommendations:
      return MaterialPageRoute(builder: (_) => const RecommendationsScreen());

    case recommendationsCreated:
      return MaterialPageRoute(builder: (_) => const RecommendationsCreatedScreen());

    case recommendationsForm:
      return MaterialPageRoute(builder: (_) => const RecommendationsFormScreen());

    case wishlist:
      return MaterialPageRoute(builder: (_) => const WishlistScreen());

    case greenSubscription:
      return MaterialPageRoute(builder: (_) => const GreenSubscriptionScreen());

    case packages:
      return MaterialPageRoute(builder: (_) => const PackagesScreen());

    case flukkyLoyalityProgram:
      return MaterialPageRoute(builder: (_) => const FlukkyLoyalityProgramScreen());

    case logout:
      return MaterialPageRoute(builder: (_) => const LoginScreen());

    case privacyPolicy:
      return MaterialPageRoute(builder: (_) => PrivacyPolicyScreen());

    case personalData:
      return MaterialPageRoute(builder: (_) => const PersonalDataScreen());

    case contactInformation:
      return MaterialPageRoute(builder: (_) => ContactInformationScreen());

    case profilePreferences:
      return MaterialPageRoute(builder: (_) => ProfilePreferencesScreen());

    case changePassword:
      return MaterialPageRoute(builder: (_) => ChangePasswordScreen());

    case billingAddress:
      return MaterialPageRoute(builder: (_) => BillingAddressScreen());

    case shippingAddress:
      return MaterialPageRoute(builder: (_) => ShippingAddressScreen());

    case paymentMethod:
      return MaterialPageRoute(builder: (_) => PaymentMethodScreen());

    case termsAndCondition:
      return MaterialPageRoute(builder: (_) => TermsAndConditionScreen());

    case helpCenter:
      return MaterialPageRoute(builder: (_) => const HelpCenterScreen());

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

    case story:
      return MaterialPageRoute(builder: (_) => StoryScreen());

    default:
      return MaterialPageRoute(builder: (_) => Scaffold(body: Center(child: Text('No route defined for ${settings.name}'))));
  }
}
