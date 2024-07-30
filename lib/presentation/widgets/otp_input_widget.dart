import 'package:flutter/material.dart';

class OtpInput extends StatefulWidget {
  final int otpLength; // Number of digits in the OTP
  final TextEditingController controller; // Shared controller for all digits

  const OtpInput({Key? key, required this.otpLength, required this.controller}) : super(key: key);

  @override
  _OtpInputState createState() => _OtpInputState();
}

class _OtpInputState extends State<OtpInput> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.otpLength,
        (index) => SizedBox(
          width: 40,
          child: TextField(
            controller: widget.controller,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            onChanged: (value) {
              if (value.isNotEmpty && !RegExp(r'^[0-9]+$').hasMatch(value)) {
                // Clear non-numeric characters
                widget.controller.text = "";
              } else if (value.length == 1 && index < widget.otpLength - 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
