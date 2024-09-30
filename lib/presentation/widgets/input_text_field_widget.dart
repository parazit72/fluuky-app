import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';

class InputTextFieldWidget extends StatefulWidget {
  final String labelText;
  final String hintText;
  final String labelTextHelper;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  const InputTextFieldWidget({
    super.key,
    this.focusNode,
    this.validator,
    this.keyboardType,
    required this.hintText,
    required this.labelText,
    required this.controller,
    this.labelTextHelper = '',
  });

  @override
  _InputTextFieldWidgetState createState() => _InputTextFieldWidgetState();
}

class _InputTextFieldWidgetState extends State<InputTextFieldWidget> {
  String? errorText;

  void validateField(String? value) {
    setState(() {
      errorText = widget.validator?.call(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    // var t = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
          Text(widget.labelText, style: FluukyTheme.lightTheme.textTheme.labelMedium),
          if (widget.labelTextHelper != '') Text(' ${widget.labelTextHelper}', style: FluukyTheme.lightTheme.textTheme.displaySmall),
        ]),
        SizedBox(height: 4.h),
        Stack(
          children: [
            Container(
              height: 48.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.w)),
                color: FluukyTheme.inputBackgroundColor,
                boxShadow: [
                  BoxShadow(color: FluukyTheme.secondaryColor),
                  const BoxShadow(color: Colors.white, spreadRadius: -2.0, blurRadius: 8.6),
                ],
              ),
            ),
            SizedBox(
              height: 48.h,
              child: TextFormField(
                // onChanged: (value) => validateField(value), // Trigger validation on input change
                validator: (value) {
                  validateField(value);
                  return errorText; // Don't show the default error text
                },
                inputFormatters: [
                  LengthLimitingTextInputFormatter(50), // Set max length to 50
                ],
                style: TextStyle(height: 1, color: FluukyTheme.inputTextColor, fontSize: 16.h, fontWeight: FontWeight.w400),
                keyboardType: widget.keyboardType,
                controller: widget.controller,
                focusNode: widget.focusNode,
                decoration: InputDecoration(
                  isDense: true,
                  errorText: null,
                  labelText: widget.hintText,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  errorStyle: const TextStyle(height: -1, fontSize: 0),
                  contentPadding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 10.w),
                  labelStyle: TextStyle(height: 1, color: FluukyTheme.secondaryColor, fontSize: 16.h),
                ),
              ),
            ),
            if (errorText != null)
              IgnorePointer(
                ignoring: true,
                child: Container(
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(8.w)),
                    border: Border.all(width: 1, color: FluukyTheme.redColor),
                  ),
                ),
              ),
          ],
        ),
        // Custom widget to show the error text under the field

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
