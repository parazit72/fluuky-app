import 'package:flutter/material.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../controllers/auth_controller.dart';

class VerificationScreen extends GetView<AuthController> {
  VerificationScreen({super.key});
  final AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    final userEmailAddress = controller.user.value?.email ?? t.translate('email_placeholder');

    return BackgroundScaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: null,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(t.translate('registerSteps'), style: Theme.of(context).textTheme.bodySmall),
                Text(t.translate('step_2_4'), style: Theme.of(context).textTheme.bodySmall)
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
            Text(t.translate('verificationCode'), style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 5),
            Text(t.translate('verificationCodeSent_1') + userEmailAddress + t.translate('verificationCodeSent_2'),
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
              onPressed: () => _authController.verifyCode(),
              child: Text(t.translate('verify')),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 24),
              child: OutlinedButton(onPressed: () => _authController.resendCode(userEmailAddress), child: Text(t.translate('resend_code'))),
            ),
            TextButton(onPressed: goBack, child: Text(t.translate('use_different_email'))),
          ],
        ),
      ),
    );
  }

  void goBack() {
    Get.back();
  }
}
