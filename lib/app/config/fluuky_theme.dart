import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class FluukyTheme {
  static String? fontFamily = 'Causten';

  // App Colors
  static Color thirdColor = const Color(0xFF8C8C8C);
  static Color primaryColor = const Color(0XFF205C32);
  static Color primaryShadowColor = const Color.fromARGB(90, 76, 97, 83);
  static Color fourthColor = const Color(0XFFE9EFEB);
  static Color secondaryColor = const Color(0xFFDBDBDB);
  static Color fifthColor = const Color(0xFFB3B3B3);
  static Color inputTextColor = const Color(0xFF1A1A1A);
  static Color redColor = const Color(0xFFD30201);
  static Color phosphorColor = const Color(0XFFADFB4F);

  static Color inputBackgroundColor = const Color.fromARGB(25, 219, 219, 219);

  static String updateFontFamilyBasedOnLocale() {
    Locale locale = Get.locale ?? const Locale('en');
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
      titleTextStyle: TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.w700, fontSize: 16.w, color: Colors.black),
    ),
    cardColor: const Color(0XFFE9EFEB),
    primaryColor: primaryColor,
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
    colorScheme: ColorScheme.light(primary: primaryColor, onPrimary: primaryColor, background: primaryColor, onBackground: primaryColor),
    textTheme: TextTheme(
      titleLarge: TextStyle(fontSize: 24.w, fontWeight: FontWeight.w600, color: inputTextColor, fontFamily: fontFamily, height: 1.5),
      titleMedium: TextStyle(fontSize: 20.w, fontWeight: FontWeight.w500, color: inputTextColor, fontFamily: fontFamily, height: 1.2),
      titleSmall: TextStyle(fontSize: 20.w, fontWeight: FontWeight.w500, color: inputTextColor, fontFamily: fontFamily, height: 1.2),
      //
      bodyLarge: TextStyle(fontSize: 14.w, fontWeight: FontWeight.w600, color: inputTextColor, fontFamily: fontFamily, height: 1.5),
      bodyMedium: TextStyle(fontSize: 16.w, fontWeight: FontWeight.w600, color: inputTextColor, fontFamily: fontFamily, height: 1.5),
      bodySmall: TextStyle(fontSize: 14.w, fontWeight: FontWeight.w400, color: inputTextColor, fontFamily: fontFamily, height: 1.5),
      //
      displayLarge: TextStyle(fontSize: 28.w, fontWeight: FontWeight.w300, color: inputTextColor, fontFamily: fontFamily, height: 1.5),
      displayMedium: TextStyle(fontSize: 24.w, fontWeight: FontWeight.w300, color: inputTextColor, fontFamily: fontFamily, height: 1.5),
      displaySmall: TextStyle(fontSize: 14.w, fontWeight: FontWeight.w400, color: FluukyTheme.thirdColor, fontFamily: fontFamily, height: 1.5),
      //
      headlineLarge: TextStyle(fontSize: 36.w, fontWeight: FontWeight.w700, color: Colors.white, fontFamily: 'Brinnan', height: 1.25),
      headlineMedium: TextStyle(fontSize: 30.w, fontWeight: FontWeight.w900, color: primaryColor, fontFamily: 'Brinnan', height: 1.5),
      headlineSmall: TextStyle(fontSize: 16.w, fontWeight: FontWeight.w400, color: Colors.white, fontFamily: 'Brinnan', height: 1.5),
      //
      labelLarge: TextStyle(fontSize: 16.w, fontWeight: FontWeight.w600, color: primaryColor, fontFamily: fontFamily, height: 1.5),
      labelMedium: TextStyle(fontSize: 16.w, fontWeight: FontWeight.w400, color: inputTextColor, fontFamily: fontFamily, height: 1.5),
      labelSmall: TextStyle(fontSize: 12.w, fontWeight: FontWeight.w400, color: inputTextColor, fontFamily: fontFamily, height: 1.5),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: WidgetStateProperty.all<double>(0),
        foregroundColor: WidgetStateProperty.all<Color?>(Colors.white),
        backgroundColor: WidgetStateProperty.all<Color?>(primaryColor),
        minimumSize: WidgetStateProperty.all<Size>(Size(double.infinity, 48.h)),
        textStyle: WidgetStateProperty.all<TextStyle>(
            TextStyle(color: Colors.white, fontSize: 16.w, fontFamily: FluukyTheme.updateFontFamilyBasedOnLocale())),
        shape: WidgetStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0), side: const BorderSide(color: Colors.transparent)),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: Size(double.infinity, 48.h),
        textStyle:
            TextStyle(fontSize: 14.h, fontWeight: FontWeight.w600, color: primaryColor, fontFamily: FluukyTheme.updateFontFamilyBasedOnLocale()),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.w),
          side: BorderSide(color: primaryColor),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        splashFactory: NoSplash.splashFactory,
        foregroundColor: primaryColor,
        minimumSize: Size(double.infinity, 48.h),
        textStyle: TextStyle(fontSize: 16.h, fontWeight: FontWeight.w600, fontFamily: FluukyTheme.updateFontFamilyBasedOnLocale(), height: 1.5),
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(surfaceTintColor: Colors.white),
    expansionTileTheme: ExpansionTileThemeData(iconColor: primaryColor, textColor: primaryColor),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.transparent,
      labelStyle: TextStyle(color: secondaryColor),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      hintStyle: TextStyle(color: Colors.black.withOpacity(0.6)),
      contentPadding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 16.w),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.w), borderSide: BorderSide(color: secondaryColor, width: 1.0)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.w), borderSide: BorderSide(color: secondaryColor, width: 1.0)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.w), borderSide: BorderSide(color: secondaryColor, width: 1.0)),
      focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.w), borderSide: BorderSide(color: secondaryColor, width: 1.0)),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.w), borderSide: BorderSide(color: FluukyTheme.redColor, width: 1.0)),
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
      displayLarge: TextStyle(fontSize: 24.w, fontWeight: FontWeight.w700, color: Colors.white, fontFamily: fontFamily),
      displayMedium: TextStyle(fontSize: 24.w, fontWeight: FontWeight.w700, color: Colors.white, fontFamily: fontFamily),
      displaySmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: FluukyTheme.thirdColor, fontFamily: fontFamily),
      headlineLarge: TextStyle(fontSize: 24.w, fontWeight: FontWeight.w900, color: Colors.white, fontFamily: fontFamily),
      headlineMedium: TextStyle(fontSize: 20.w, fontWeight: FontWeight.w900, color: Colors.white, fontFamily: fontFamily),
      headlineSmall: TextStyle(fontSize: 18.w, fontWeight: FontWeight.w900, color: Colors.white, fontFamily: fontFamily),
      titleLarge: TextStyle(fontSize: 18.w, fontWeight: FontWeight.w600, color: Colors.white, fontFamily: fontFamily),
      titleMedium: TextStyle(fontSize: 18.w, fontWeight: FontWeight.w500, color: Colors.white, fontFamily: fontFamily),
      titleSmall: TextStyle(fontSize: 18.w, fontWeight: FontWeight.w500, color: Colors.white, fontFamily: fontFamily),
      labelLarge: TextStyle(fontSize: 16.w, fontWeight: FontWeight.w500, color: Colors.white, fontFamily: fontFamily),
      labelMedium: TextStyle(fontSize: 16.w, fontWeight: FontWeight.w500, color: Colors.white, fontFamily: fontFamily),
      labelSmall: TextStyle(fontSize: 16.w, fontWeight: FontWeight.w500, color: Colors.white, fontFamily: fontFamily),
      bodyLarge: TextStyle(fontSize: 14.w, fontWeight: FontWeight.w300, color: Colors.white, fontFamily: fontFamily),
      bodyMedium: TextStyle(fontSize: 14.w, fontWeight: FontWeight.w300, color: Colors.white, fontFamily: fontFamily),
      bodySmall: TextStyle(fontSize: 14.w, fontWeight: FontWeight.w400, color: Colors.white, fontFamily: fontFamily),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: primaryColor,
        shadowColor: Colors.transparent,
        textStyle: TextStyle(fontSize: 20.w, color: Colors.white, fontFamily: fontFamily),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.w)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryColor,
        textStyle: TextStyle(fontSize: 16.w, color: primaryColor, fontFamily: fontFamily),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.w),
          side: BorderSide(color: primaryColor, width: 5.w),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      // style: TextButton.styleFrom(
      //   foregroundColor: const primaryColor,
      // ),

      style: ButtonStyle(
        textStyle: WidgetStateProperty.all<TextStyle>(TextStyle(color: primaryColor)),
      ),
    ),
  );

  static final PinTheme defaultPinTheme = PinTheme(
    width: 52.w,
    height: 52.h,
    margin: EdgeInsets.only(right: 5.w, left: 5.w),
    padding: EdgeInsets.only(left: 19.w, right: 19.w),
    textStyle: TextStyle(fontSize: 20.w, color: inputTextColor, fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: secondaryColor),
      boxShadow: [
        BoxShadow(color: secondaryColor),
        const BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
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
