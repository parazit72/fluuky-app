import 'package:flutter/material.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../controllers/auth/auth_controller.dart';

class VerificationScreen extends GetView<AuthController> {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userEmailAddress = controller.user.value?.email ?? 'your email address';

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
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Verification Code', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 5),
            Text('We have sent you a verification code to $userEmailAddress. Please enter the code here to verify your email address.',
                style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 20),
            Center(
                child: Pinput(
              defaultPinTheme: FluukyTheme.defaultPinTheme,
              // focusedPinTheme: Theme.of(context).focusedPinTheme,
              // submittedPinTheme: Theme.of(context).submittedPinTheme,
              validator: (s) {
                return s == '2222' ? null : 'Pin is incorrect';
              },
              length: 5,
              controller: controller.codeController,
              onCompleted: (pin) => controller.verifyCode,
            )),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: controller.verifyCode,
              child: const Text('Verify'),
            ),
            const SizedBox(height: 16),
            OutlinedButton(onPressed: () => controller.resendCode(userEmailAddress), child: const Text('Resend Code')),
            const SizedBox(height: 22.5),
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
