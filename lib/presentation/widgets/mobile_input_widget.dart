import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/widgets/country_picker_sheet_widget.dart';
import 'package:get/get.dart';

class MobileInputWidget extends StatefulWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final FocusNode? focusNode;

  const MobileInputWidget({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.focusNode,
  });

  @override
  _MobileInputWidgetState createState() => _MobileInputWidgetState();
}

class _MobileInputWidgetState extends State<MobileInputWidget> {
  String selectedCountry = 'ae';
  String countryCode = '+971';
  String? validationMessage; // Store validation message

  void _showCountryPicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return CountryPickerSheetWidget(
          onSelect: (String country, String code) {
            setState(() {
              selectedCountry = country;
              countryCode = code;
            });
            Navigator.pop(context);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.labelText, style: FluukyTheme.lightTheme.textTheme.labelMedium),
        SizedBox(height: 4.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: _showCountryPicker,
                  child: Container(
                    height: 48.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(color: FluukyTheme.secondaryColor),
                        const BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/flags/$selectedCountry.png', width: 24.w),
                        SizedBox(width: 8.w),
                        Text(countryCode),
                        const Icon(Icons.keyboard_arrow_down_outlined)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Stack(children: [
                Container(
                  height: 48.h,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    // color: FluukyTheme.inputBackgroundColor,
                    boxShadow: [
                      BoxShadow(color: FluukyTheme.secondaryColor),
                      const BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
                    ],
                  ),
                ),
                SizedBox(
                  height: 48.h,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        setState(() {
                          validationMessage = t.translate('Please enter your mobile number');
                        });
                        return '';
                      } else if (!RegExp(r'^\d{10,15}$').hasMatch(value)) {
                        setState(() {
                          validationMessage = t.translate('Please enter a valid mobile number');
                        });
                        return '';
                      }
                      setState(() {
                        validationMessage = null; // Clear validation message on success
                      });
                      return null;
                    },
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(15),
                      FilteringTextInputFormatter.digitsOnly,
                      FilteringTextInputFormatter.deny(RegExp(r'\s')),
                    ],
                    keyboardType: TextInputType.phone,
                    controller: widget.controller,
                    focusNode: widget.focusNode,
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: widget.hintText,
                      errorBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(Radius.circular(8)), borderSide: BorderSide(color: FluukyTheme.redColor)),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      errorStyle: const TextStyle(height: -1), // Hide default error style
                      errorText: null, // Prevent showing the default error text
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
        if (validationMessage != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0), // Add some space above the message
            child: Text(
              validationMessage!,
              style: TextStyle(color: FluukyTheme.redColor, fontSize: 12.sp),
            ),
          ),
      ],
    );
  }
}
