import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';

class LanguageDropdown extends StatelessWidget {
  final String hintText;
  final String? initialValue;

  const LanguageDropdown({super.key, required this.hintText, this.initialValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.w)),
        color: FluukyTheme.inputBackgroundColor,
        boxShadow: [
          BoxShadow(color: FluukyTheme.secondaryColor),
          const BoxShadow(color: Colors.white70, spreadRadius: -2.0, blurRadius: 8.6),
        ],
      ),

      // decoration: BoxDecoration(
      //   // border: Border.all(color: const Color.fromARGB(1, 219, 219, 219), width: 1),
      //   borderRadius: BorderRadius.circular(8),
      //   boxShadow: [
      //     BoxShadow(color: Color.fromARGB(1, 219, 219, 219)),
      //     BoxShadow(color: FluukyTheme.fourthColor, spreadRadius: -4.0, blurRadius: 8.6),
      //   ],
      //   color: FluukyTheme.inputBackgroundColor,
      // ),
      child: DropdownButtonFormField2<String>(
        style: TextStyle(color: FluukyTheme.thirdColor, fontFamily: FluukyTheme.fontFamily),
        isExpanded: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 16.h),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          fillColor: Colors.transparent,
        ),
        hint: Text(
          hintText,
          style: FluukyTheme.lightTheme.textTheme.displaySmall,
        ),
        value: initialValue,
        items: [
          DropdownMenuItem<String>(
            value: 'en',
            child: Text('English', style: TextStyle(fontSize: 16.w)),
          ),
          DropdownMenuItem<String>(
            value: 'ar',
            child: Text('العربية', style: TextStyle(fontSize: 16.w)),
          ),
        ],
        onChanged: (String? value) {
          if (value != null) {
            Locale newLocale = value == 'ar' ? const Locale('ar') : const Locale('en');
            Get.updateLocale(newLocale);
          }
        },
        buttonStyleData: ButtonStyleData(padding: EdgeInsets.only(right: 8.w)),
        iconStyleData: IconStyleData(icon: const Icon(Icons.arrow_drop_down, color: Colors.black45), iconSize: 24.w),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 300.h,
          offset: const Offset(0, -5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(color: FluukyTheme.secondaryColor),
              const BoxShadow(color: Colors.white, spreadRadius: -1.0, blurRadius: 10),
            ],
            color: const Color.fromARGB(5, 219, 219, 219),
          ),
        ),
        menuItemStyleData: MenuItemStyleData(padding: EdgeInsets.symmetric(horizontal: 16.w)),
      ),
    );
  }
}
