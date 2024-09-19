import 'package:flutter/material.dart';
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
        Text(labelText, style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 4),
        Stack(
          children: [
            Container(
              height: 48,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Color.fromARGB(5, 219, 219, 219),
                boxShadow: [
                  BoxShadow(color: Color(0xFFDBDBDB)),
                  BoxShadow(color: Colors.white, spreadRadius: -2.0, blurRadius: 8.6),
                ],
              ),
            ),
            TextFormField(
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
                labelText: hintText,
                labelStyle: TextStyle(
                  height: 2,
                  color: FluukyTheme.secondaryColor,
                  fontSize: 16,
                ),
                border: InputBorder.none, // Remove default TextField border to match the Container style
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Adjust padding for a better fit
              ),
            ),
          ],
        ),
      ],
    );
  }
}
