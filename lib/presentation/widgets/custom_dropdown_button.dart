import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

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
        return List.generate(61, (index) => (2020 - index).toString()); // For years from 1960 to 2020
      case 'days_en':
        if (selectedMonth != null) {
          int daysInMonth = int.parse(monthsEn.firstWhere((m) => m['value'] == selectedMonth)['day']!);
          return List.generate(daysInMonth, (index) => (index + 1).toString());
        }
        return List.generate(31, (index) => (index + 1).toString());
      case 'days_ar':
        if (selectedMonth != null) {
          int daysInMonth = int.parse(monthsAr.firstWhere((m) => m['value'] == selectedMonth)['day']!);
          return List.generate(daysInMonth, (index) => (index + 1).toString());
        }
        return List.generate(31, (index) => (index + 1).toString());
      case 'months_en':
        return monthsEn.map((month) => month['value']!).toList();
      case 'months_ar':
        return monthsAr.map((month) => month['value']!).toList();
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = _getItems(widget.itemsKey);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(color: Color(0xFFDBDBDB)),
          BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
        ],
        color: const Color.fromARGB(122, 219, 219, 219),
      ),
      child: DropdownButtonFormField2<String>(
        isExpanded: true,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        hint: Text(widget.hintText, style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey)),
        value: widget.value,
        items: items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item, style: Theme.of(context).textTheme.bodySmall),
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
        buttonStyleData: const ButtonStyleData(padding: EdgeInsets.only(right: 8)),
        iconStyleData: const IconStyleData(icon: Icon(Icons.arrow_drop_down, color: Colors.black45), iconSize: 24),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 300,
          offset: const Offset(0, -5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(color: Color(0xFFDBDBDB)),
              BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
            ],
            color: const Color.fromARGB(122, 219, 219, 219),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(padding: EdgeInsets.symmetric(horizontal: 16)),
      ),
    );
  }
}
