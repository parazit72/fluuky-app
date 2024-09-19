import 'package:flutter/material.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/auth_controller.dart';
import 'package:fluuky/presentation/pages/auth/verification_screen.dart';
import 'package:fluuky/presentation/widgets/mobile_input_widget.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';

import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final AuthController _authController = Get.find<AuthController>();
  final _formKey = GlobalKey<FormState>();
  String initialCountry = 'AE';
  PhoneNumber number = PhoneNumber(isoCode: 'AE');

  var isLogin = false.obs;
  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
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
                Text(t.translate('step_1_4'), style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
            const Divider(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(t.translate('create_account'), style: Theme.of(context).textTheme.titleLarge),
            Text(t.translate('readyToMakeImpact'), style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 5),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Icon(Icons.info_outline, size: 20, color: Theme.of(context).primaryColor),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Text(
                      t.translate('pleaseEnterFirstNameMandatoryPrizesWinning'),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            registerWidget()
          ]),
        ),
      ),
    );
  }

  Widget registerWidget() {
    var t = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            InputTextFieldWidget(
                controller: _authController.firstNameController, labelText: t.translate('firstName'), hintText: t.translate('enterFirstName')),
            const SizedBox(height: 20),
            InputTextFieldWidget(
                controller: _authController.lastNameController, labelText: t.translate('lastName'), hintText: t.translate('enterLastName')),
            const SizedBox(height: 20),
            MobileInputWidget(
              controller: _authController.mobileController,
              labelText: '',
              hintText: t.translate('enterPhoneNumber'),
            ),
            const SizedBox(height: 20),
            InputTextFieldWidget(
                controller: _authController.emailController, labelText: t.translate('email'), hintText: t.translate('enterEmailAddress')),
            const SizedBox(height: 20),
            InputTextFieldWidget(
                controller: _authController.referralCodeController,
                labelText: t.translate('referral_code'),
                hintText: t.translate('enter_referral_code'),
                required: false),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(t.translate('processing_data'))),
                  );
                  Get.offAll(() => VerificationScreen(), arguments: {'email': _authController.emailController.text});

                  // _authController.registerWithEmail();
                }
              },
              child: Text(t.translate('continue')),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: TextButton(
                  onPressed: goSignIn,
                  child: Wrap(
                    children: [
                      Text(t.translate('already_have_account '), style: Theme.of(context).textTheme.bodyMedium),
                      Text(t.translate('sign_in'), style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).primaryColor)),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }

  void goSignIn() {
    Navigator.pushReplacementNamed(context, login);
  }
}
