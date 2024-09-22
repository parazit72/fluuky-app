import 'package:flutter/material.dart';
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
        border: Border.all(color: const Color.fromARGB(1, 219, 219, 219), width: 1),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(color: Color.fromARGB(125, 219, 219, 219)),
          BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
        ],
        color: FluukyTheme.inputBackgroundColor,
      ),
      child: DropdownButtonFormField2<String>(
        isExpanded: true,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          fillColor: Colors.white,
        ),
        hint: Text(
          hintText,
          style: FluukyTheme.lightTheme.textTheme.displaySmall!.copyWith(color: Colors.grey),
        ),
        value: initialValue,
        items: const [
          DropdownMenuItem<String>(
            value: 'en',
            child: Text('English', style: TextStyle(fontSize: 16)),
          ),
          DropdownMenuItem<String>(
            value: 'ar',
            child: Text('العربية', style: TextStyle(fontSize: 16)),
          ),
        ],
        onChanged: (String? value) {
          if (value != null) {
            Locale newLocale = value == 'ar' ? const Locale('ar') : const Locale('en');
            Get.updateLocale(newLocale);
          }
        },
        buttonStyleData: const ButtonStyleData(padding: EdgeInsets.only(right: 8)),
        iconStyleData: const IconStyleData(icon: Icon(Icons.arrow_drop_down, color: Colors.black45), iconSize: 24),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 300,
          offset: const Offset(0, -5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(color: Color(0xFFDBDBDB)),
              BoxShadow(color: Colors.white, spreadRadius: -1.0, blurRadius: 10),
            ],
            color: const Color.fromARGB(5, 219, 219, 219),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(padding: EdgeInsets.symmetric(horizontal: 16)),
      ),
    );
  }
}
