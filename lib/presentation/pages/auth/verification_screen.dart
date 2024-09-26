import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../controllers/auth_controller.dart';

class VerificationScreen extends GetView<AuthController> {
  VerificationScreen({super.key});
  final AuthController _authController = Get.find<AuthController>();
  final FocusNode _pinFocusNode = FocusNode(); // Add a FocusNode

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    final userEmailAddress = controller.user.value?.email ?? t.translate('email_placeholder');
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pinFocusNode.requestFocus();
    });

    return BackgroundScaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: null,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(t.translate('registerSteps'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
                Text(t.translate('step_2_4'), style: FluukyTheme.lightTheme.textTheme.displaySmall)
              ],
            ),
            const Divider()
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(t.translate('verificationCode'), style: FluukyTheme.lightTheme.textTheme.titleLarge),
            SizedBox(height: 5.h),
            Text(t.translate('verificationCodeSent_1') + userEmailAddress + t.translate('verificationCodeSent_2'),
                style: FluukyTheme.lightTheme.textTheme.displaySmall),
            SizedBox(height: 24.h),
            Form(
              key: formKey,
              child: Center(
                child: Pinput(
                  defaultPinTheme: FluukyTheme.defaultPinTheme,
                  focusNode: _pinFocusNode,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  // focusedPinTheme: Theme.of(context).focusedPinTheme,
                  // submittedPinTheme: Theme.of(context).submittedPinTheme,
                  validator: (s) {
                    return s != '12345' ? null : 'Pin is incorrect';
                  },
                  length: 5,
                  controller: controller.codeController,
                  onCompleted: (pin) => controller.verifyCode,
                ),
              ),
            ),
            SizedBox(height: 24.h),
            ElevatedButton(
              onPressed: () {
                String? previousRoute = Get.previousRoute;

                if (previousRoute == signUp) {
                  Get.toNamed(detailsAboutYou);
                } else if (previousRoute == forgotPassword) {
                  Get.toNamed(setNewPassword);
                }

                // _authController.verifyCode();
              },
              child: Text(t.translate('verify')),
            ),
            Padding(
              padding: EdgeInsets.only(top: 14.h, bottom: 10.h),
              child: OutlinedButton(onPressed: () => _authController.resendCode(userEmailAddress), child: Text(t.translate('resend_code'))),
            ),
            TextButton(onPressed: () => Get.back(), child: Text(t.translate('Use different email address'))),
          ],
        ),
      ),
    );
  }
}
