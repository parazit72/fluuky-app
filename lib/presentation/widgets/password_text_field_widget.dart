import 'package:flutter/material.dart';
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
  void _toggleObscured() {
    setState(() {
      widget.obscured = !widget.obscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(t.translate(widget.labelText), style: FluukyTheme.lightTheme.textTheme.labelMedium),
      SizedBox(height: 4.h),
      Stack(children: [
        Container(
            height: 48.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: FluukyTheme.inputBackgroundColor,
              boxShadow: [
                BoxShadow(color: FluukyTheme.secondaryColor),
                BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
              ],
            )),
        SizedBox(
          height: 48.h,
          child: TextFormField(
            keyboardType: TextInputType.visiblePassword,
            controller: widget.controller,
            focusNode: widget.focusNode,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              labelText: widget.hintText,
              isDense: widget.isDense,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: FluukyTheme.secondaryColor),
                borderRadius: BorderRadius.circular(8),
              ),
              suffixIcon: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 15.h, maxWidth: 22.h),
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
            validator: widget.validator,
            obscureText: widget.obscured,
            onChanged: widget.onChanged,
          ),
        ),
      ]),
    ]);
  }
}
