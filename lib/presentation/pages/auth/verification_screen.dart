import 'package:flutter/material.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';
import 'package:get/get.dart';

import '../../controllers/auth/auth_controller.dart';

class VerificationScreen extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    final userEmailAddress = args is Map<String, dynamic> && args.containsKey('email') ? args['email'] : '';
    return BackgroundScaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Register in 4 steps:', style: Theme.of(context).textTheme.bodySmall),
                Text('Step 2/4', style: Theme.of(context).textTheme.bodySmall)
              ],
            ),
            const Divider()
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Verification Code', style: Theme.of(context).textTheme.titleLarge),
            Text('We have sent you a verification code to $userEmailAddress. Please enter the code here to verify your email address.',
                style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 20),
            OtpInput(
              otpLength: 5,
              controller: controller.codeController,
            ),
            const SizedBox(height: 5),
            ElevatedButton(
              onPressed: controller.verifyCode,
              child: const Text('Verify'),
            ),
            OutlinedButton(onPressed: () => controller.resendCode(userEmailAddress), child: const Text('Resend Code')),
            TextButton(onPressed: goBack, child: const Text('Use different email address ')),
          ],
        ),
      ),
    );
  }

  void goBack() {
    Get.back();
  }
}
