import 'package:flutter/material.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';
import 'package:fluuky/presentation/controllers/auth/login_controller.dart';
import 'package:fluuky/presentation/controllers/auth/registration_controller.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  RegisterationController registerationController = Get.put(RegisterationController());
  String initialCountry = 'AE';
  PhoneNumber number = PhoneNumber(isoCode: 'AE');

  LoginController loginController = Get.put(LoginController());
  var isLogin = false.obs;
  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      appBar: AppBar(
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
                    child: Image.asset('assets/images/exclamation-mark.png', width: 20, height: 20),
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
    return Column(
      children: [
        InputTextFieldWidget(controller: registerationController.firstNameController, labelText: 'First name', hintText: 'Enter your first name'),
        const SizedBox(height: 20),
        InputTextFieldWidget(controller: registerationController.lastNameController, labelText: 'Last name', hintText: 'Enter your last name'),
        const SizedBox(height: 20),
        InternationalPhoneNumberInput(
          searchBoxDecoration: const InputDecoration(),
          onInputChanged: (PhoneNumber number) {
            print(number.phoneNumber);
          },
          onInputValidated: (bool value) {
            print(value);
          },
          selectorConfig: const SelectorConfig(
            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
            useBottomSheetSafeArea: true,
          ),
          ignoreBlank: false,
          autoValidateMode: AutovalidateMode.disabled,
          selectorTextStyle: const TextStyle(color: Colors.black),
          initialValue: number,
          textFieldController: registerationController.mobileController,
          formatInput: true,
          keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
          inputBorder: const OutlineInputBorder(),
          onSaved: (PhoneNumber number) {
            print('On Saved: $number');
          },
        ),
        InputTextFieldWidget(controller: registerationController.mobileController, labelText: 'Phone Number', hintText: 'Enter your phone number'),
        const SizedBox(height: 20),
        InputTextFieldWidget(controller: registerationController.emailController, labelText: 'Email', hintText: 'Enter your email'),
        const SizedBox(height: 20),
        InputTextFieldWidget(
            controller: registerationController.referalCodeController, labelText: 'Referal Code', hintText: 'Enter your referal code'),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: () => registerationController.registerWithEmail(),
          child: const Text('Continue'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: TextButton(
              onPressed: goSignIn,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account? ', style: Theme.of(context).textTheme.bodyMedium),
                  Text('Sign in', style: Theme.of(context).textTheme.bodyMedium),
                ],
              )),
        )
      ],
    );
  }

  void goSignIn() {
    Navigator.pushReplacementNamed(context, login);
  }
}
