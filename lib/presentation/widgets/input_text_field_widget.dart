import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class InputTextFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final String labelText;
  InputTextFieldWidget(this.textEditingController, this.hintText, this.labelText);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          textAlign: TextAlign.left,
          style: const TextStyle(color: Colors.black, fontSize: 16),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            boxShadow: const [
              BoxShadow(color: Color(0XFFDBDBDB)),
              BoxShadow(
                offset: Offset(-4, -4),
                blurRadius: 8.6,
                spreadRadius: 4,
                color: Color(0xFFF9F8F9),
              ),
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: textEditingController,
            decoration: InputDecoration(
              labelText: labelText,
            ),
          ),
        ),
      ],
    );
  }
}
