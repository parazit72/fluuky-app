import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/auth_controller.dart';
import 'package:fluuky/presentation/widgets/layout/app_bar_single.dart';
import 'package:fluuky/presentation/widgets/password_text_field_widget.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';

class ChangePasswordScreen extends GetView<AuthController> {
  ChangePasswordScreen({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return BackgroundScaffold(
        appBar: AppBarSingleWidget(title: t.translate('change_password')),
        bottomNavigationBar: CustomNavBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 32.h),
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
                            controller: controller.currentPasswordController,
                            hintText: t.translate('current_password'),
                            // focusNode: _passwordFocusNode,
                            validator: (val) {
                              if (val != null && val.length < 6) {
                                return t.translate('Password too short.');
                              }
                              return null;
                            },
                            onChanged: (value) {
                              controller.currentPasswordController.text = value;
                              controller.checkPassword(value); // Update password checks
                            },
                          ),
                          SizedBox(height: 24.h),
                          PasswordTextFieldWidget(
                            controller: controller.passwordController,
                            hintText: t.translate('newPassword'),
                            // focusNode: _passwordFocusNode,
                            validator: (val) {
                              if (val != null && val.length < 6) {
                                return t.translate('Password too short.');
                              }
                              return null;
                            },
                            onChanged: (value) {
                              controller.passwordController.text = value;
                              controller.checkPassword(value); // Update password checks
                            },
                          ),
                          SizedBox(height: 24.h),
                          PasswordTextFieldWidget(
                            controller: controller.confirmPasswordController,
                            labelText: t.translate('confirmPassword'),
                            hintText: t.translate('password'),
                            // focusNode: _passwordFocusNode,
                            validator: (val) => (val != controller.passwordController.text) ? t.translate('Passwords do not match.') : null,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 24.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(t.translate('Password must include:'), style: FluukyTheme.lightTheme.textTheme.bodySmall),
                                const SizedBox(height: 8),
                                _buildPasswordRule(context, t.translate('min_8_characters'), controller.isAtLeast8Characters),
                                _buildPasswordRule(context, t.translate('uppercase_character'), controller.hasUpperCase),
                                _buildPasswordRule(context, t.translate('lowercase_character'), controller.hasLowerCase),
                                _buildPasswordRule(context, t.translate('a_number'), controller.hasDigit),
                                _buildPasswordRule(context, t.translate('special_character'), controller.hasSpecialCharacter),
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
                      Get.toNamed(helpCenter);

                      controller.updateUserPassword();
                    }
                  },
                  child: Text(t.translate('Save Changes')),
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
              color: isValid.value ? FluukyTheme.primaryColor : FluukyTheme.redColor,
            ),
            Text(ruleText, style: FluukyTheme.lightTheme.textTheme.bodySmall),
          ],
        ));
  }
}
