import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

class FluukyTheme {
  static String? fontFamily = 'Causten';
  static Color primaryColor = const Color(0XFF205C32);
  static Color indicatorColor = const Color(0xFFDBDBDB);
  static Color secondaryColor = const Color(0xFFDBDBDB);
  static Color cardColor = const Color(0XFF205C32);
  static Color accentColor = const Color(0XFF205C32);

  // Light theme with black text
  static ThemeData lightTheme = ThemeData(
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        return states.contains(WidgetState.selected) ? FluukyTheme.primaryColor : Colors.white;
      }),
      trackColor: WidgetStateProperty.all(Colors.grey.shade400), // Background color when inactive

      overlayColor: WidgetStateProperty.all(Colors.transparent),
      trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
      materialTapTargetSize: MaterialTapTargetSize.padded,
    ),
    appBarTheme: AppBarTheme(
      scrolledUnderElevation: 0,
      shadowColor: Colors.transparent,
      systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      foregroundColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.w700, fontSize: 16, color: Colors.black),
    ),
    primaryColor: const Color(0XFF205C32),
    hintColor: const Color.fromARGB(125, 13, 39, 21),
    cardColor: const Color(0XFFE9EFEB),
    navigationBarTheme: const NavigationBarThemeData(backgroundColor: Colors.white),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 5,
        backgroundColor: Colors.white,
        selectedItemColor: primaryColor,
        selectedIconTheme: IconThemeData(color: primaryColor),
        showSelectedLabels: true),
    useMaterial3: true,
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
    scaffoldBackgroundColor: Colors.white,
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all<Color?>(primaryColor),
      fillColor: MaterialStateProperty.all<Color?>(secondaryColor),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      side: MaterialStateBorderSide.resolveWith(
        (states) => BorderSide(color: secondaryColor),
      ),
      materialTapTargetSize: MaterialTapTargetSize.padded,
    ),
    drawerTheme: const DrawerThemeData(backgroundColor: Colors.white),
    colorScheme: ColorScheme.light(primary: primaryColor, onPrimary: accentColor, background: primaryColor, onBackground: accentColor),
    dividerTheme: DividerThemeData(color: Colors.grey.shade300),
    sliderTheme: const SliderThemeData(showValueIndicator: ShowValueIndicator.always),
    textTheme: TextTheme(
      displayLarge: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w300, color: Colors.black, fontFamily: fontFamily),
      displayMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w300, color: Colors.black, fontFamily: fontFamily),
      displaySmall: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300, color: Colors.black, fontFamily: fontFamily),
      headlineLarge: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w900, color: primaryColor, fontFamily: fontFamily),
      headlineMedium: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w900, color: primaryColor, fontFamily: fontFamily),
      headlineSmall: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900, color: primaryColor, fontFamily: fontFamily),
      titleLarge: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w700, color: Colors.black, fontFamily: fontFamily),
      titleMedium: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700, color: Colors.black, fontFamily: fontFamily),
      titleSmall: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700, color: Colors.black, fontFamily: fontFamily),
      labelLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300, color: Colors.black, fontFamily: fontFamily),
      labelMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300, color: Colors.black, fontFamily: fontFamily),
      labelSmall: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300, color: Colors.black, fontFamily: fontFamily),
      bodyLarge: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.black, fontFamily: fontFamily),
      bodyMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300, color: Colors.black, fontFamily: fontFamily),
      bodySmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300, color: Colors.black, fontFamily: fontFamily),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(color: Colors.white)),
        foregroundColor: MaterialStateProperty.all<Color?>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color?>(const Color(0XFF205C32)),
        elevation: MaterialStateProperty.all<double>(0),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: const BorderSide(color: Colors.transparent),
          ),
        ),
        minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 48.0)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20.0, color: Colors.white), // White text color
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0), side: const BorderSide(color: Color.fromARGB(255, 13, 39, 21))),
        minimumSize: const Size(double.infinity, 48.0),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        splashFactory: NoSplash.splashFactory,
        foregroundColor: const Color(0XFF205C32),
        minimumSize: const Size(double.infinity, 48.0),
      ),
    ),
    expansionTileTheme: ExpansionTileThemeData(iconColor: accentColor, textColor: accentColor),
    bottomSheetTheme: const BottomSheetThemeData(surfaceTintColor: Colors.white),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      filled: true,
      fillColor: Colors.transparent,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: secondaryColor, width: 1.0)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: secondaryColor, width: 1.0)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: secondaryColor, width: 1.0)),
      focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: secondaryColor, width: 1.0)),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: const BorderSide(color: Colors.red, width: 1.0)),
      hintStyle: TextStyle(color: Colors.black.withOpacity(0.6)),
      labelStyle: TextStyle(color: secondaryColor),
      floatingLabelBehavior: FloatingLabelBehavior.never,
    ),
  );

  // White theme with white text
  static ThemeData whiteTheme = lightTheme.copyWith(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: lightTheme.appBarTheme.copyWith(
      titleTextStyle: TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
      backgroundColor: primaryColor,
      iconTheme: const IconThemeData(color: Colors.white),
    ),
    checkboxTheme: lightTheme.checkboxTheme.copyWith(
        checkColor: MaterialStateProperty.all<Color?>(Colors.white),
        fillColor: MaterialStateProperty.all<Color?>(secondaryColor),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
    textTheme: lightTheme.textTheme.copyWith(
      displayLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700, color: Colors.white, fontFamily: fontFamily),
      displayMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700, color: Colors.white, fontFamily: fontFamily),
      displaySmall: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700, color: Colors.white, fontFamily: fontFamily),
      headlineLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w900, color: Colors.white, fontFamily: fontFamily),
      headlineMedium: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900, color: Colors.white, fontFamily: fontFamily),
      headlineSmall: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w900, color: Colors.white, fontFamily: fontFamily),
      titleLarge: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.white, fontFamily: fontFamily),
      titleMedium: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.white, fontFamily: fontFamily),
      titleSmall: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.white, fontFamily: fontFamily),
      labelLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.white, fontFamily: fontFamily),
      labelMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.white, fontFamily: fontFamily),
      labelSmall: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.white, fontFamily: fontFamily),
      bodyLarge: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300, color: Colors.white, fontFamily: fontFamily),
      bodyMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300, color: Colors.white, fontFamily: fontFamily),
      bodySmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300, color: Colors.white, fontFamily: fontFamily),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        textStyle: const TextStyle(fontSize: 20.0, color: Colors.white),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryColor,
        textStyle: TextStyle(fontSize: 20.0, color: primaryColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(color: primaryColor, width: 5),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      // style: TextButton.styleFrom(
      //   foregroundColor: const Color(0XFF205C32),
      // ),

      style: ButtonStyle(
        textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(color: primaryColor)),
      ),
    ),
  );

  // App Colors
  static Color offerBackgroundLightGreen = primaryColor;
  static Color darkBtnBackground = const Color.fromRGBO(6, 12, 59, 1);
  static Color saleRedColor = Colors.red;
  static Color bodyTextDarkColor = const Color(0xFF6e6e6e);
  static Color appBarBackgroundColor = Colors.grey.shade400;
  static Color checkOutInActiveColor = Colors.grey.withAlpha(100);

  static final PinTheme defaultPinTheme = PinTheme(
    margin: const EdgeInsets.only(right: 5, left: 5),
    padding: const EdgeInsets.only(left: 19, right: 19),
    width: 52,
    height: 52,
    textStyle: const TextStyle(fontSize: 20, color: Color(0xFFDBDBDB), fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: const Color(0xFFDBDBDB)),
      boxShadow: const [
        BoxShadow(color: Color(0xFFDBDBDB)),
        BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
      ],
      borderRadius: BorderRadius.circular(8),
    ),
  );
}

class AppSizes {
  static const double spacingSmall = 4.0;
  static const double spacingNormal = 8.0;
  static const double spacingMedium = 12.0;
  static const double spacingLarge = 16.0;
  static const double spacingWide = 20;
  static const double buttonHeight = 48;
  static const double buttonWidth = 270;
  static const double itemHeight = 45.0;
  static const double size24 = 24.0;
  static const double size16 = 16.0;
  static const double size12 = 12.0;
  static const double size8 = 8.0;
  static const double size4 = 4.0;

  static double screenHeight = MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.single).size.height;
  static double screenWidth = MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.single).size.width;
}

class AppColors {
  //Order status Color
  static const Color orderCompleteColor = Color(0xFF66BB6A);
  static const Color orderPendingColor = Color(0xFFfead4c);
  static const Color orderProcessingColor = Color(0xFF3F51B5);
  static const Color orderHoldColor = Color(0XFFF9A825);
  static const Color orderCanceledColor = Color(0xFFE53935);
  static const Color orderNewColor = Color(0xFF448AFF);
  static const Color orderClosedColor = Color(0xFFe44c53);
  static const Color orderPaidColor = Color(0xFF66BB6A);
  static const Color orderRefundedColor = Color(0xFFE53935);
  static const Color orderRequestedColor = Color(0xFFefad4c);

  //Review color
  static const Color oneStarReview = Color(0xFFE51A1A);
  static const Color twoStarReview = Color(0xFFE91E63);
  static const Color threeStarReview = Color(0xFFFFA100);
  static const Color fourStarReview = Color(0xFFFFCC00);
  static const Color fiveStarReview = Color(0xFF6BC700);
}
