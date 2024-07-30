import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth/auth_controller.dart';

class VerificationKeypad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      children: List.generate(
        12,
        (index) {
          final text = (index + 1).toString();
          return GestureDetector(
            onTap: () {
              Get.find<AuthController>().codeController.text += text;
            },
            child: Container(
              alignment: Alignment.center,
              child: Text(text),
            ),
          );
        },
      ),
    );
  }
}
