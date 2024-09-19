import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class FluukyTheme {
  static String? fontFamily = 'Causten';
  static Color cardColor = const Color(0XFF205C32);
  static Color accentColor = const Color(0XFF205C32);
  static Color thirdColor = const Color(0xFF8C8C8C);
  static Color primaryColor = const Color(0XFF205C32);
  static Color indicatorColor = const Color(0xFFDBDBDB);
  static Color secondaryColor = const Color(0xFFDBDBDB);

  static String updateFontFamilyBasedOnLocale() {
    Locale locale = Get.locale ?? const Locale('ar');
    fontFamily = 'Causten'; // Fallback font
    if (locale.languageCode == 'ar') {
      fontFamily = "Cairo";
    } else if (locale.languageCode == 'en') {
      fontFamily = 'Causten';
    }

    return fontFamily!;
  }

  // Light theme with black text
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        return states.contains(WidgetState.selected) ? FluukyTheme.primaryColor : Colors.white;
      }),
      materialTapTargetSize: MaterialTapTargetSize.padded,
      trackColor: WidgetStateProperty.all(Colors.grey.shade400),
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      shadowColor: Colors.transparent,
      foregroundColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.black),
      systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      titleTextStyle: TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.w700, fontSize: 16, color: Colors.black),
    ),
    cardColor: const Color(0XFFE9EFEB),
    primaryColor: const Color(0XFF205C32),
    hintColor: const Color.fromARGB(125, 13, 39, 21),
    navigationBarTheme: const NavigationBarThemeData(backgroundColor: Colors.white),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 5,
      showSelectedLabels: true,
      backgroundColor: Colors.white,
      selectedItemColor: primaryColor,
      selectedIconTheme: IconThemeData(color: primaryColor),
    ),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
    scaffoldBackgroundColor: Colors.white,
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStateProperty.all<Color?>(primaryColor),
      fillColor: WidgetStateProperty.all<Color?>(secondaryColor),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      side: WidgetStateBorderSide.resolveWith(
        (states) => BorderSide(color: secondaryColor),
      ),
      materialTapTargetSize: MaterialTapTargetSize.padded,
    ),
    dividerTheme: DividerThemeData(color: Colors.grey.shade300),
    drawerTheme: const DrawerThemeData(backgroundColor: Colors.white),
    sliderTheme: const SliderThemeData(showValueIndicator: ShowValueIndicator.always),
    colorScheme: ColorScheme.light(primary: primaryColor, onPrimary: accentColor, background: primaryColor, onBackground: accentColor),
    textTheme: TextTheme(
      displayLarge: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w300, color: Colors.black, fontFamily: fontFamily, height: 2),
      displayMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w300, color: Colors.black, fontFamily: fontFamily, height: 2),
      displaySmall: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300, color: Colors.black, fontFamily: fontFamily, height: 2),
      headlineLarge: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w900, color: primaryColor, fontFamily: fontFamily, height: 2),
      headlineMedium: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w900, color: primaryColor, fontFamily: fontFamily, height: 2),
      headlineSmall: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900, color: primaryColor, fontFamily: fontFamily, height: 2),
      titleLarge: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w700, color: Colors.black, fontFamily: fontFamily, height: 2),
      titleMedium: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700, color: Colors.black, fontFamily: fontFamily, height: 2),
      titleSmall: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700, color: Colors.black, fontFamily: fontFamily, height: 2),
      labelLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300, color: Colors.black, fontFamily: fontFamily, height: 2),
      labelMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300, color: Colors.black, fontFamily: fontFamily, height: 2),
      labelSmall: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300, color: Colors.black, fontFamily: fontFamily, height: 2),
      bodyLarge: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.black, fontFamily: fontFamily, height: 2),
      bodyMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300, color: Colors.black, fontFamily: fontFamily, height: 2),
      bodySmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300, color: Colors.black, fontFamily: fontFamily, height: 2),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: WidgetStateProperty.all<double>(0),
        foregroundColor: WidgetStateProperty.all<Color?>(Colors.white),
        backgroundColor: WidgetStateProperty.all<Color?>(const Color(0XFF205C32)),
        minimumSize: WidgetStateProperty.all<Size>(const Size(double.infinity, 48.0)),
        textStyle:
            WidgetStateProperty.all<TextStyle>(TextStyle(color: Colors.white, fontSize: 16, fontFamily: FluukyTheme.updateFontFamilyBasedOnLocale())),
        shape: WidgetStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0), side: const BorderSide(color: Colors.transparent)),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 48.0),
        textStyle: TextStyle(fontSize: 16, color: Colors.white, fontFamily: FluukyTheme.updateFontFamilyBasedOnLocale()),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: const BorderSide(color: Color.fromARGB(255, 13, 39, 21)),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        splashFactory: NoSplash.splashFactory,
        foregroundColor: const Color(0XFF205C32),
        minimumSize: const Size(double.infinity, 48.0),
        textStyle: TextStyle(fontWeight: FontWeight.bold, fontFamily: FluukyTheme.updateFontFamilyBasedOnLocale()),
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(surfaceTintColor: Colors.white),
    expansionTileTheme: ExpansionTileThemeData(iconColor: accentColor, textColor: accentColor),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.transparent,
      labelStyle: TextStyle(color: secondaryColor),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      hintStyle: TextStyle(color: Colors.black.withOpacity(0.6)),
      contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: secondaryColor, width: 1.0)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: secondaryColor, width: 1.0)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: secondaryColor, width: 1.0)),
      focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: secondaryColor, width: 1.0)),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: const BorderSide(color: Colors.red, width: 1.0)),
    ),
  );

  static ThemeData whiteTheme = lightTheme.copyWith(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: lightTheme.appBarTheme.copyWith(
      backgroundColor: primaryColor,
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
    ),
    checkboxTheme: lightTheme.checkboxTheme.copyWith(
        checkColor: WidgetStateProperty.all<Color?>(Colors.white),
        fillColor: WidgetStateProperty.all<Color?>(secondaryColor),
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
        backgroundColor: primaryColor,
        shadowColor: Colors.transparent,
        textStyle: TextStyle(fontSize: 20.0, color: Colors.white, fontFamily: fontFamily),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryColor,
        textStyle: TextStyle(fontSize: 16, color: primaryColor, fontFamily: fontFamily),
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
        textStyle: WidgetStateProperty.all<TextStyle>(TextStyle(color: primaryColor)),
      ),
    ),
  );

  // App Colors
  static Color saleRedColor = Colors.red;
  static Color offerBackgroundLightGreen = primaryColor;
  static Color bodyTextDarkColor = const Color(0xFF6e6e6e);
  static Color appBarBackgroundColor = Colors.grey.shade400;
  static Color checkOutInActiveColor = Colors.grey.withAlpha(100);
  static Color darkBtnBackground = const Color.fromRGBO(6, 12, 59, 1);

  static final PinTheme defaultPinTheme = PinTheme(
    width: 52,
    height: 52,
    margin: const EdgeInsets.only(right: 5, left: 5),
    padding: const EdgeInsets.only(left: 19, right: 19),
    textStyle: const TextStyle(fontSize: 20, color: Color(0xFFDBDBDB), fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: const Color(0xFFDBDBDB)),
      boxShadow: const [
        BoxShadow(color: Color(0xFFDBDBDB)),
        BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
      ],
    ),
  );
}

class AppSizes {
  static const double size8 = 8.0;
  static const double size4 = 4.0;
  static const double size24 = 24.0;
  static const double size16 = 16.0;
  static const double size12 = 12.0;
  static const double spacingWide = 20;
  static const double buttonHeight = 48;
  static const double buttonWidth = 270;
  static const double itemHeight = 45.0;
  static const double spacingSmall = 4.0;
  static const double spacingNormal = 8.0;
  static const double spacingMedium = 12.0;
  static const double spacingLarge = 16.0;

  static double screenWidth = MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.single).size.width;
  static double screenHeight = MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.single).size.height;
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
