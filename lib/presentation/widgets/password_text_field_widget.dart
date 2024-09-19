import 'package:flutter/material.dart';
import 'package:fluuky/l10n/app_localizations.dart';

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
      Text(t.translate(widget.labelText), style: Theme.of(context).textTheme.bodySmall),
      const SizedBox(height: 4),
      Stack(children: [
        Container(
            height: 48,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: Color.fromARGB(122, 219, 219, 219),
              boxShadow: [
                BoxShadow(color: Color(0xFFDBDBDB)),
                BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
              ],
            )),
        TextFormField(
          keyboardType: TextInputType.visiblePassword,
          controller: widget.controller,
          focusNode: widget.focusNode,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelText: widget.hintText,
            isDense: widget.isDense,
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFDBDBDB)),
              borderRadius: BorderRadius.circular(8),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
              child: GestureDetector(
                onTap: _toggleObscured,
                child: Icon(
                  size: 24,
                  widget.obscured ? Icons.visibility_rounded : Icons.visibility_off_rounded,
                ),
              ),
            ),
          ),
          validator: widget.validator,
          obscureText: widget.obscured,
          onChanged: widget.onChanged,
        ),
      ]),
    ]);
  }
}
