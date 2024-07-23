import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FluukyTheme {
  static String? fontFamily = 'Causten';
  static Color primaryColor = const Color.fromARGB(255, 13, 39, 21);
  static Color cardColor = const Color.fromARGB(125, 13, 39, 21);
  static Color accentColor = const Color.fromARGB(125, 13, 39, 21);

  // Light theme with black text
  static ThemeData lightTheme = ThemeData(
    primaryColor: const Color.fromARGB(255, 13, 39, 21),
    hintColor: const Color.fromARGB(125, 13, 39, 21),
    cardColor: const Color.fromARGB(125, 13, 39, 21),
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
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.w700, fontSize: 16, color: Colors.black),
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all<Color?>(primaryColor),
      fillColor: MaterialStateProperty.all<Color?>(accentColor),
    ),
    drawerTheme: const DrawerThemeData(backgroundColor: Colors.white),
    colorScheme: ColorScheme.light(primary: primaryColor, onPrimary: accentColor, background: primaryColor, onBackground: accentColor),
    dividerTheme: DividerThemeData(color: Colors.grey.shade300),
    sliderTheme: const SliderThemeData(showValueIndicator: ShowValueIndicator.always),
    textTheme: TextTheme(
      displayLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w300, color: Colors.black, fontFamily: fontFamily),
      displayMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w300, color: Colors.black, fontFamily: fontFamily),
      displaySmall: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w300, color: Colors.black, fontFamily: fontFamily),
      headlineLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w900, color: primaryColor, fontFamily: fontFamily),
      headlineMedium: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900, color: primaryColor, fontFamily: fontFamily),
      headlineSmall: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w900, color: primaryColor, fontFamily: fontFamily),
      titleLarge: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700, color: Colors.black, fontFamily: fontFamily),
      titleMedium: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700, color: Colors.black, fontFamily: fontFamily),
      titleSmall: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700, color: Colors.black, fontFamily: fontFamily),
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
        backgroundColor: MaterialStateProperty.all<Color?>(const Color.fromARGB(255, 13, 39, 21)),
        elevation: MaterialStateProperty.all<double>(4.0),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: const BorderSide(color: Colors.black),
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
        foregroundColor: const Color.fromARGB(255, 13, 39, 21),
        minimumSize: const Size(double.infinity, 48.0),
      ),
    ),
    expansionTileTheme: ExpansionTileThemeData(iconColor: accentColor, textColor: accentColor),
    bottomSheetTheme: const BottomSheetThemeData(surfaceTintColor: Colors.white),
  );

  // White theme with white text
  static ThemeData whiteTheme = lightTheme.copyWith(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: lightTheme.appBarTheme.copyWith(
      titleTextStyle: TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
      backgroundColor: primaryColor,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    ),
    checkboxTheme: lightTheme.checkboxTheme.copyWith(
      checkColor: MaterialStateProperty.all<Color?>(Colors.white),
      fillColor: MaterialStateProperty.all<Color?>(accentColor),
    ),
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
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(color: primaryColor)),
        backgroundColor: MaterialStateProperty.all<Color?>(const Color.fromARGB(255, 13, 39, 21)),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: primaryColor),
          ),
        ),
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
      //   foregroundColor: const Color.fromARGB(255, 13, 39, 21),
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
}
