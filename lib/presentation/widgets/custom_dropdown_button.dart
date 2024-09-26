import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/l10n/app_localizations.dart';

class CustomDropdownButton extends StatefulWidget {
  final String itemsKey;
  final String? value;
  final String hintText;
  final Function(String?) onChanged;

  const CustomDropdownButton({
    super.key,
    required this.itemsKey,
    required this.hintText,
    required this.onChanged,
    this.value,
  });

  @override
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  String? selectedMonth;

  final List<String> genders = ['Male', 'Female', 'Other'];

  final List<Map<String, String>> monthsEn = [
    {"value": "January", "day": "31"},
    {"value": "February", "day": "29"}, // 29 in leap years
    {"value": "March", "day": "31"},
    {"value": "April", "day": "30"},
    {"value": "May", "day": "31"},
    {"value": "June", "day": "30"},
    {"value": "July", "day": "31"},
    {"value": "August", "day": "31"},
    {"value": "September", "day": "30"},
    {"value": "October", "day": "31"},
    {"value": "November", "day": "30"},
    {"value": "December", "day": "31"}
  ];

  final List<Map<String, String>> monthsAr = [
    {"value": "يناير", "day": "31"},
    {"value": "فبراير", "day": "29"}, // 29 in leap years
    {"value": "مارس", "day": "31"},
    {"value": "أبريل", "day": "30"},
    {"value": "مايو", "day": "31"},
    {"value": "يونيو", "day": "30"},
    {"value": "يوليو", "day": "31"},
    {"value": "أغسطس", "day": "31"},
    {"value": "سبتمبر", "day": "30"},
    {"value": "أكتوبر", "day": "31"},
    {"value": "نوفمبر", "day": "30"},
    {"value": "ديسمبر", "day": "31"}
  ];

  List<String> _getItems(String key) {
    switch (key) {
      case 'genders':
        return genders;
      case 'years':
        return List.generate(61, (index) => (DateTime.now().year - index).toString()); // For years from 1960 to 2020
      case 'days_en':
        if (selectedMonth != null) {
          int daysInMonth = int.parse(monthsEn.firstWhere((m) => m['value'] == selectedMonth)['day']!);
          return List.generate(daysInMonth, (index) => (index + 1).toString().padLeft(2, '0'));
        }
        return List.generate(31, (index) => (index + 1).toString().padLeft(2, '0'));
      case 'days_ar':
        if (selectedMonth != null) {
          int daysInMonth = int.parse(monthsAr.firstWhere((m) => m['value'] == selectedMonth)['day']!);
          return List.generate(daysInMonth, (index) => (index + 1).toString().padLeft(2, '0'));
        }
        return List.generate(31, (index) => (index + 1).toString().padLeft(2, '0'));
      case 'months_en':
        return monthsEn.map((month) => month['value']!).toList();
      case 'months_ar':
        return monthsAr.map((month) => month['value']!).toList();
      default:
        return [];
    }
  }

  String? errorText;

  @override
  Widget build(BuildContext context) {
    final items = _getItems(widget.itemsKey);
    var t = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.w),
            boxShadow: [
              BoxShadow(color: FluukyTheme.secondaryColor),
              const BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
            ],
            color: FluukyTheme.inputBackgroundColor,
          ),
          child: DropdownButtonFormField2<String>(
            validator: (value) {
              if (value == null) {
                // Return the error message directly
                setState(() {
                  errorText = widget.hintText == 'select' ? t.translate('gender') : t.translate(widget.hintText) + t.translate(' is required');
                });
                return (widget.hintText == 'select' ? t.translate('gender') : '') + t.translate('is required');
              }
              // Return null if validation passes
              return null;
            },
            isExpanded: true,
            decoration: InputDecoration(
              errorText: null,
              errorStyle: const TextStyle(height: -1, fontSize: 0),
              contentPadding: EdgeInsets.symmetric(vertical: 0.h),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.w)),
            ),
            hint: Text(widget.hintText, style: FluukyTheme.lightTheme.textTheme.displaySmall),
            value: widget.value,
            items: items.map((item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item, style: FluukyTheme.lightTheme.textTheme.displaySmall),
              );
            }).toList(),
            onChanged: (String? value) {
              setState(() {
                if (widget.itemsKey == 'months_en' || widget.itemsKey == 'months_ar') {
                  selectedMonth = value;
                }
                widget.onChanged(value);
              });
            },
            buttonStyleData: ButtonStyleData(padding: EdgeInsets.only(right: 16.w)),
            iconStyleData: IconStyleData(
                icon: RotatedBox(quarterTurns: -45, child: Icon(Icons.arrow_back_ios_new_outlined, color: FluukyTheme.inputTextColor)),
                iconSize: 14.w),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 390.h,
              offset: Offset(0, -5.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.w),
                boxShadow: [
                  BoxShadow(color: FluukyTheme.secondaryColor),
                  const BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
                ],
                color: FluukyTheme.inputBackgroundColor,
              ),
            ),
            menuItemStyleData: MenuItemStyleData(padding: EdgeInsets.symmetric(horizontal: 16.w)),
          ),
        ),
        if (errorText != null)
          Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: Text(
              errorText!,
              style: TextStyle(color: FluukyTheme.redColor, fontSize: 12.h), // Customize error message style
            ),
          ),
      ],
    );
  }
}
