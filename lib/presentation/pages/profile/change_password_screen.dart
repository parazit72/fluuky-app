import 'package:flutter/material.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/presentation/controllers/auth_controller.dart';
import 'package:fluuky/presentation/widgets/layout/app_bar_single.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
        appBar: const AppBarSingleWidget(title: 'Change Password'),
        bottomNavigationBar: CustomNavBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
          child: Stack(
            children: [
              ListView(
                children: [
                  Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PasswordTextFieldWidget(
                            controller: _authController.passwordController,
                            hintText: 'Current Password',
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
                            controller: _authController.passwordController,
                            hintText: 'New Password',
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
                        ],
                      )),
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                      Get.toNamed(helpCenter);

                      // _authController.registerWithEmail();
                    }
                  },
                  child: const Text('Save Changes'),
                ),
              ),
            ],
          ),
        ));
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
