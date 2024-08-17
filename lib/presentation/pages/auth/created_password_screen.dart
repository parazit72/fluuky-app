import 'package:flutter/material.dart';
import 'package:fluuky/app/config/route_constants.dart';

import 'package:fluuky/presentation/widgets/widgets.dart';
import 'package:get/get.dart';
import '../../controllers/auth/auth_controller.dart';

class CreatedPasswordScreen extends StatelessWidget {
  final AuthController _authController = Get.find<AuthController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final FocusNode _passwordFocusNode = FocusNode();

  CreatedPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Register in 4 steps:', style: Theme.of(context).textTheme.bodySmall),
                Text('Step 4/4', style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
            const Divider(),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Create a Password', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 5),
                Text('Last step! Please create a password to secure your account. ', style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(height: 24),
                PasswordTextFieldWidget(
                  controller: _authController.passwordController,
                  hintText: 'Password',
                  // focusNode: _passwordFocusNode,
                  validator: (val) {
                    if (val != null && val.length < 6) {
                      return 'Password too short.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _authController.passwordController.text = value;
                    _authController.checkPassword(value); // Update password checks
                  },
                ),
                const SizedBox(height: 24),
                PasswordTextFieldWidget(
                  controller: _authController.confirmPasswordController,
                  labelText: 'Confirm Password',
                  hintText: 'Password',
                  // focusNode: _passwordFocusNode,
                  validator: (val) => (val != _authController.passwordController.text) ? 'Passwords do not match.' : null,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Password must include:', style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 8),
                      _buildPasswordRule(context, 'At least 8 characters', _authController.isAtLeast8Characters),
                      _buildPasswordRule(context, 'An uppercase character', _authController.hasUpperCase),
                      _buildPasswordRule(context, 'A lowercase character', _authController.hasLowerCase),
                      _buildPasswordRule(context, 'A number', _authController.hasDigit),
                      _buildPasswordRule(context, 'A special character', _authController.hasSpecialCharacter),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _authController.verifyCode();
                    }
                    Get.toNamed(home);
                  },
                  child: const Text('Activate Account'),
                ),
                const SizedBox(height: 30),
                Center(child: Text('By registering, you accept our ', style: Theme.of(context).textTheme.bodySmall)),
                Center(
                  child: Wrap(
                    // alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () => Get.toNamed(termsAndCondition),
                        style: TextButton.styleFrom(minimumSize: const Size(100, 48.0)),
                        child: const Text('Terms & Conditions'),
                      ),
                      Text('and', style: Theme.of(context).textTheme.bodySmall, textAlign: TextAlign.center),
                      TextButton(
                        onPressed: () => Get.toNamed(privacyPolicy),
                        style: TextButton.styleFrom(minimumSize: const Size(100, 48.0)),
                        child: const Text('Privacy Policy'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordRule(BuildContext context, String ruleText, RxBool isValid) {
    return Obx(() => Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 8,
          children: [
            Icon(
              isValid.value ? Icons.check : Icons.close,
              color: isValid.value ? Theme.of(context).primaryColor : const Color(0XFFD30201),
            ),
            Text(ruleText, style: Theme.of(context).textTheme.bodySmall),
          ],
        ));
  }
}
