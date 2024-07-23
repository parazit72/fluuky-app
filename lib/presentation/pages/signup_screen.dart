import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';
import 'package:fluuky/presentation/controllers/login_registration.dart';
import 'package:fluuky/presentation/controllers/registration_controller.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  RegisterationController registerationController = Get.put(RegisterationController());

  LoginController loginController = Get.put(LoginController());
  var isLogin = false.obs;
  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Obx(
            () => Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Register in 4 steps', style: Theme.of(context).textTheme.bodySmall),
                  Text('Step 1/4', style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
              Divider(),
              const SizedBox(height: 30),
              Text('Create an Account', style: Theme.of(context).textTheme.headlineMedium),
              Text('Ready to make a positive impact? Complete the form below to enter our draws with a cause!',
                  style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
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
      ),
    );
  }

  Widget registerWidget() {
    return Column(
      children: [
        FormBuilderRangeSlider(
          name: 'zxcz',
          min: 0,
          max: 20,
        ),
        InputTextFieldWidget(registerationController.nameController, 'name'),
        const SizedBox(height: 20),
        InputTextFieldWidget(registerationController.emailController, 'email address'),
        const SizedBox(height: 20),
        InputTextFieldWidget(registerationController.passwordController, 'password'),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => registerationController.registerWithEmail(),
          child: const Text('Register'),
        )
      ],
    );
  }

  Widget loginWidget() {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(loginController.emailController, 'email address'),
        const SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(loginController.passwordController, 'password'),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () => loginController.loginWithEmail(),
          child: Text('Login'),
        )
      ],
    );
  }
}
