import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';

class PasswordTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final bool isDense;
  final String hintText;
  final String labelText;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  bool obscured;

  PasswordTextFieldWidget({
    super.key,
    required this.controller,
    this.focusNode,
    this.isDense = true,
    required this.hintText,
    this.labelText = "Password",
    this.validator,
    this.onChanged,
    this.obscured = true,
  });

  @override
  _PasswordTextFieldWidgetState createState() => _PasswordTextFieldWidgetState();
}

class _PasswordTextFieldWidgetState extends State<PasswordTextFieldWidget> {
  String? errorText;
  void _toggleObscured() {
    setState(() {
      widget.obscured = !widget.obscured;
    });
  }

  void validateField(String? value) {
    setState(() {
      errorText = widget.validator?.call(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(t.translate(widget.labelText), style: FluukyTheme.lightTheme.textTheme.labelMedium),
        SizedBox(height: 4.h),
        Stack(
          children: [
            Container(
              height: 48.h,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                color: FluukyTheme.inputBackgroundColor,
                boxShadow: [
                  BoxShadow(color: FluukyTheme.secondaryColor),
                  const BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
                ],
              ),
            ),
            SizedBox(
              height: 48.h,
              child: TextFormField(
                style: TextStyle(height: 1, color: FluukyTheme.inputTextColor, fontSize: 16.h, fontWeight: FontWeight.w400),
                keyboardType: TextInputType.visiblePassword,
                controller: widget.controller,
                focusNode: widget.focusNode,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: widget.hintText,
                  isDense: widget.isDense,
                  errorStyle: const TextStyle(height: -1, fontSize: 0),
                  // border: OutlineInputBorder(
                  //   borderSide: BorderSide(color: FluukyTheme.redColor),
                  //   borderRadius: BorderRadius.circular(8),
                  // ),
                  // errorText: null,
                  // errorBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(color: FluukyTheme.redColor),
                  //   borderRadius: BorderRadius.circular(8),
                  // ),
                  suffixIcon: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: 18.h, maxWidth: 22.h),
                      child: GestureDetector(
                        onTap: _toggleObscured,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: widget.obscured
                              ? SvgPicture.asset(
                                  'assets/images/eye-open.svg',
                                  alignment: Alignment.center,
                                )
                              : SvgPicture.asset(
                                  'assets/images/eye-closed.svg',
                                  alignment: Alignment.center,
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
                validator: (value) {
                  validateField(value);
                  return errorText; // Don't show the default error text
                },
                obscureText: widget.obscured,
                onChanged: widget.onChanged,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(50),
                ],
              ),
            ),
            if (errorText != null)
              IgnorePointer(
                ignoring: true,
                child: Container(
                  height: 48.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.w)),
                    border: Border.all(width: 1, color: FluukyTheme.redColor),
                    color: Colors.transparent,
                  ),
                ),
              ),
          ],
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
