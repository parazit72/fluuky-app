import 'package:flutter/material.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../controllers/auth_controller.dart';

class VerificationScreen extends GetView<AuthController> {
  VerificationScreen({super.key});
  final AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final userEmailAddress = controller.user.value?.email ?? 'your email address';

    return BackgroundScaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: null,
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
            const SizedBox(height: 24),
            Center(
              child: Pinput(
                defaultPinTheme: FluukyTheme.defaultPinTheme,

                // focusedPinTheme: Theme.of(context).focusedPinTheme,
                // submittedPinTheme: Theme.of(context).submittedPinTheme,
                // validator: (s) {
                //   return s == '6665' ? null : 'Pin is incorrect';
                // },
                length: 5,
                controller: controller.codeController,
                onCompleted: (pin) => controller.verifyCode,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                _authController.verifyCode();
              },
              child: const Text('Verify'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 24),
              child: OutlinedButton(onPressed: () => _authController.resendCode(userEmailAddress), child: const Text('Resend Code')),
            ),
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
