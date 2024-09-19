import 'package:flutter/material.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/l10n/app_localizations.dart';
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
    var t = AppLocalizations.of(context)!;
    return BackgroundScaffold(
        appBar: AppBarSingleWidget(title: t.translate('change_password')),
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
                            hintText: t.translate('current_password'),
                            // focusNode: _passwordFocusNode,
                            validator: (val) {
                              if (val != null && val.length < 6) {
                                return t.translate('password_too_short');
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
                            hintText: t.translate('newPassword'),
                            // focusNode: _passwordFocusNode,
                            validator: (val) {
                              if (val != null && val.length < 6) {
                                return t.translate('password_too_short');
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
                            labelText: t.translate('confirmPassword'),
                            hintText: t.translate('password'),
                            // focusNode: _passwordFocusNode,
                            validator: (val) => (val != _authController.passwordController.text) ? t.translate('passwords_do_not_match') : null,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(t.translate('password_requirements'), style: Theme.of(context).textTheme.titleLarge),
                                const SizedBox(height: 8),
                                _buildPasswordRule(context, t.translate('min_8_characters'), _authController.isAtLeast8Characters),
                                _buildPasswordRule(context, t.translate('uppercase_character'), _authController.hasUpperCase),
                                _buildPasswordRule(context, t.translate('lowercase_character'), _authController.hasLowerCase),
                                _buildPasswordRule(context, t.translate('a_number'), _authController.hasDigit),
                                _buildPasswordRule(context, t.translate('special_character'), _authController.hasSpecialCharacter),
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
                        SnackBar(content: Text(t.translate('processing_data'))),
                      );
                      Get.toNamed(helpCenter);

                      // _authController.registerWithEmail();
                    }
                  },
                  child: Text(t.translate('saveChanges')),
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
