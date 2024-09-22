import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/l10n/app_localizations.dart';

class InputTextFieldWidget extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator; // Added validator parameter

  const InputTextFieldWidget({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.focusNode,
    this.validator, // Initialize the validator
  });

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: FluukyTheme.lightTheme.textTheme.labelMedium),
        SizedBox(height: 4.h),
        Stack(
          children: [
            Container(
              height: 48.h,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                color: FluukyTheme.inputBackgroundColor,
                boxShadow: const [
                  BoxShadow(color: Color(0xFFDBDBDB)),
                  BoxShadow(color: Colors.white, spreadRadius: -2.0, blurRadius: 8.6),
                ],
              ),
            ),
            SizedBox(
              height: 48.h,
              child: TextFormField(
                style: TextStyle(height: 1.5, color: FluukyTheme.inputTextColor, fontSize: 16.h),
                validator: validator ??
                    (value) {
                      if (value == null || value.isEmpty) {
                        return '${t.translate('Please_enter_your')} $labelText';
                      }
                      return null;
                    },
                controller: controller,
                focusNode: focusNode,
                decoration: InputDecoration(
                  isDense: true,
                  labelText: hintText,
                  labelStyle: TextStyle(height: 1.5, color: FluukyTheme.secondaryColor, fontSize: 16.h),
                  border: InputBorder.none, // Remove default TextField border to match the Container style
                  // contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h), // Adjust padding for a better fit
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
