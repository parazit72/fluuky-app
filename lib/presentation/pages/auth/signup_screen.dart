import 'package:flutter/material.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/presentation/controllers/auth/auth_controller.dart';
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
    return BackgroundScaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: null,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Register in 4 steps', style: Theme.of(context).textTheme.bodySmall),
                Text('Step 1/4', style: Theme.of(context).textTheme.bodySmall),
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
            Text('Create an Account', style: Theme.of(context).textTheme.titleLarge),
            Text('Ready to make a positive impact? Complete the form below to enter our draws with a cause!',
                style: Theme.of(context).textTheme.bodySmall),
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
                      'Please ensure your first and last name match your government-issued ID, this is mandatory for the delivery of prizes for draw winners.',
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
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            InputTextFieldWidget(controller: _authController.firstNameController, labelText: 'First name', hintText: 'Enter your first name'),
            const SizedBox(height: 20),
            InputTextFieldWidget(controller: _authController.lastNameController, labelText: 'Last name', hintText: 'Enter your last name'),
            const SizedBox(height: 20),
            MobileInputWidget(
              controller: _authController.mobileController,
              labelText: '',
              hintText: 'Enter your mobile number',
            ),
            const SizedBox(height: 20),
            InputTextFieldWidget(controller: _authController.emailController, labelText: 'Email', hintText: 'Enter your email'),
            const SizedBox(height: 20),
            InputTextFieldWidget(
                controller: _authController.referalCodeController, labelText: 'Referal Code', hintText: 'Enter your referal code', required: false),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                  Get.offAll(() => VerificationScreen(), arguments: {'email': _authController.emailController.text});

                  // _authController.registerWithEmail();
                }
              },
              child: const Text('Continue'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: TextButton(
                  onPressed: goSignIn,
                  child: Wrap(
                    children: [
                      Text('Already have an account? ', style: Theme.of(context).textTheme.bodyMedium),
                      Text('Sign in', style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).primaryColor)),
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
