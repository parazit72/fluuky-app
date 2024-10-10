import 'package:fluuky/presentation/widgets/category_tabs_widgets/winner_screen.dart';
import 'package:get/get.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/presentation/bindings/order_bindings.dart';
import 'package:fluuky/presentation/pages/auth/forgot_password_screen.dart';
import 'package:fluuky/presentation/pages/auth/set_new_password_screen.dart';
import 'package:fluuky/presentation/pages/draw/active_draws_list_screen.dart';
import 'package:fluuky/presentation/pages/intro/help_center_screen.dart';
import 'package:fluuky/presentation/pages/intro/privacy_policy_screen.dart';
import 'package:fluuky/presentation/pages/intro/receipt_screen.dart';
import 'package:fluuky/presentation/pages/intro/splash_screen.dart';
import 'package:fluuky/presentation/pages/intro/terms_and_condition_screen.dart';
import 'package:fluuky/presentation/pages/profile/estimated_carbon_footprint_screen.dart';
import 'package:fluuky/presentation/pages/profile/green_subscription_subscribed_screen.dart';
import 'package:fluuky/presentation/pages/profile/question_page.dart';
import 'package:fluuky/presentation/pages/profile/subscribing_process_screen.dart';
import 'package:fluuky/presentation/pages/transaction_history_screen.dart';
import 'package:fluuky/presentation/pages/auth/created_password_screen.dart';
import 'package:fluuky/presentation/pages/auth/details_about_you_screen.dart';
import 'package:fluuky/presentation/pages/basket/basket_screen.dart';
import 'package:fluuky/presentation/pages/checkout/checkout_screen.dart';
import 'package:fluuky/presentation/pages/dashboard_screen/dashboard_screen.dart';
import 'package:fluuky/presentation/pages/notification_screen.dart';
import 'package:fluuky/presentation/pages/order_history_screen.dart';
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
import 'package:fluuky/presentation/pages/auth/signup_screen.dart';
import 'package:fluuky/presentation/pages/profile/profile_preferences_screen.dart';
import 'package:fluuky/presentation/pages/profile/shipping_address_screen.dart';
import 'package:fluuky/presentation/pages/recommendations/recommendations_created.dart';
import 'package:fluuky/presentation/pages/recommendations/recommendations_form_screen.dart';
import 'package:fluuky/presentation/pages/recommendations/recommendations_screen.dart';
import 'package:fluuky/presentation/pages/story/story_screen.dart';
import 'package:fluuky/presentation/pages/wishlists/wishlist_screen.dart';

import 'package:fluuky/presentation/pages/draw/draw_item_screen.dart';
import 'package:fluuky/domain/entities/raffle_entity.dart';

List<GetPage<dynamic>>? generateRoute = [
  GetPage(
    name: splash,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: notifications,
    page: () => NotificationScreen(),
  ),
  GetPage(
    name: walkthrough,
    page: () => const WalkthroughScreen(),
  ),
  GetPage(
    name: home,
    page: () => const HomeScreen(),
  ),
  GetPage(
    name: signUp,
    page: () => const SignupScreen(),
  ),
  GetPage(
    name: login,
    page: () => const LoginScreen(),
  ),
  GetPage(name: dashboard, page: () => DashboardScreen(), binding: OrderBindings()),
  GetPage(
    name: recommendations,
    page: () => const RecommendationsScreen(),
  ),
  GetPage(
    name: recommendationsCreated,
    page: () => const RecommendationsCreatedScreen(),
  ),
  GetPage(
    name: recommendationsForm,
    page: () => const RecommendationsFormScreen(),
  ),
  GetPage(
    name: wishlist,
    page: () => const WishlistScreen(),
  ),
  GetPage(
    name: winnerScreen,
    page: () => const WinnerScreen(),
  ),
  GetPage(
    name: greenSubscription,
    page: () => const GreenSubscriptionScreen(),
  ),
  GetPage(
    name: questionPage,
    page: () => QuestionPage(),
  ),
  GetPage(
    name: estimatedCarbonFootprintScreen,
    page: () => EstimatedCarbonFootprintScreen(),
  ),
  GetPage(
    name: receiptScreen,
    page: () => const ReceiptScreen(),
  ),
  GetPage(
    name: packages,
    page: () => PackagesScreen(),
  ),
  GetPage(
    name: subscribingProcessScreen,
    page: () => const SubscribingProcessScreen(),
  ),
  GetPage(
    name: greenSubscriptionSubscribedScreen,
    page: () => const GreenSubscriptionSubscribedScreen(),
  ),
  GetPage(
    name: flukkyLoyalityProgram,
    page: () => const FlukkyLoyalityProgramScreen(),
  ),
  GetPage(
    name: logout,
    page: () => const LoginScreen(),
  ),
  GetPage(
    name: forgotPassword,
    page: () => const ForgotPasswordScreen(),
  ),
  GetPage(
    name: setNewPassword,
    page: () => const SetNewPasswordScreen(),
  ),
  GetPage(
    name: privacyPolicy,
    page: () => PrivacyPolicyScreen(),
  ),
  GetPage(
    name: personalData,
    page: () => const PersonalDataScreen(),
  ),
  GetPage(
    name: contactInformation,
    page: () => ContactInformationScreen(),
  ),
  GetPage(
    name: profilePreferences,
    page: () => ProfilePreferencesScreen(),
  ),
  GetPage(
    name: changePassword,
    page: () => ChangePasswordScreen(),
  ),
  GetPage(
    name: billingAddress,
    page: () => BillingAddressScreen(),
  ),
  GetPage(
    name: shippingAddress,
    page: () => ShippingAddressScreen(),
  ),
  GetPage(
    name: paymentMethod,
    page: () => PaymentMethodScreen(),
  ),
  GetPage(
    name: termsAndCondition,
    page: () => TermsAndConditionScreen(),
  ),
  GetPage(
    name: helpCenter,
    page: () => const HelpCenterScreen(),
  ),
  GetPage(
    name: draw,
    page: () {
      final raffle = Get.arguments as RaffleEntity;
      return DrawItemScreen(selectedRaffle: raffle);
    },
  ),
  GetPage(
    name: profile,
    page: () => const ProfileMenuScreen(),
  ),
  GetPage(
    name: drawList,
    page: () => const DrawsListScreen(),
  ),
  GetPage(
    name: activeDraws,
    page: () => const ActiveDrawsListScreen(),
  ),
  GetPage(
    name: verification,
    page: () => VerificationScreen(),
  ),
  GetPage(
    name: detailsAboutYou,
    page: () => DetailsAboutYouScreen(),
  ),
  GetPage(
    name: basket,
    page: () => const BasketScreen(),
    // binding: BasketBindings(),
  ),
  GetPage(
    name: checkout,
    page: () => const CheckoutScreen(),
  ),
  GetPage(
    name: createdPassword,
    page: () => CreatedPasswordScreen(),
  ),
  GetPage(
    name: orderHistory,
    page: () => OrderHistoryScreen(),
    binding: OrderBindings(),
  ),
  GetPage(
    name: transactionHistory,
    page: () => TransactionHistoryScreen(),
    binding: OrderBindings(),
  ),
  GetPage(
    name: story,
    page: () => StoryScreen(),
  ),
];
