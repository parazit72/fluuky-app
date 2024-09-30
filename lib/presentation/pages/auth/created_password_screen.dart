import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/widgets/password_text_field_widget.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';

import 'package:fluuky/presentation/widgets/widgets.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';

class CreatedPasswordScreen extends StatelessWidget {
  final AuthController _authController = Get.find<AuthController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final FocusNode _passwordFocusNode = FocusNode();

  CreatedPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return BackgroundScaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(t.translate('register_4_steps'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
                Text(t.translate('step_4_4'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
              ],
            ),
            const Divider(),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.h),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(t.translate('Create a Password'), style: FluukyTheme.lightTheme.textTheme.labelMedium),
                SizedBox(height: 4.h),
                Text(t.translate('lastStep'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
                SizedBox(height: 24.h),
                PasswordTextFieldWidget(
                  controller: _authController.passwordController,
                  hintText: t.translate('password'),
                  // focusNode: _passwordFocusNode,
                  validator: (val) {
                    if (val != null && val.length < 6) {
                      return t.translate('Password too short.');
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _authController.passwordController.text = value;
                    _authController.checkPassword(value); // Update password checks
                  },
                ),
                SizedBox(height: 24.h),
                PasswordTextFieldWidget(
                  controller: _authController.confirmPasswordController,
                  labelText: t.translate('Confirm Password'),
                  hintText: t.translate('password'),
                  // focusNode: _passwordFocusNode,
                  validator: (val) => (val != _authController.passwordController.text) ? t.translate('Passwords do not match.') : null,
                ),
                Padding(
                  padding: EdgeInsets.all(16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        t.translate('Password must include:'),
                        style: FluukyTheme.lightTheme.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: 8.h),
                      _buildPasswordRule(context, t.translate('min_8_characters'), _authController.isAtLeast8Characters),
                      _buildPasswordRule(context, t.translate('uppercase_character'), _authController.hasUpperCase),
                      _buildPasswordRule(context, t.translate('lowercase_character'), _authController.hasLowerCase),
                      _buildPasswordRule(context, t.translate('a_number'), _authController.hasDigit),
                      _buildPasswordRule(context, t.translate('special_character'), _authController.hasSpecialCharacter),
                    ],
                  ),
                ),
                SizedBox(height: 8.h),
                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: WidgetStatePropertyAll(Size(335.w, 48.h)),
                    textStyle: WidgetStateProperty.all(TextStyle(fontSize: 16.w, fontWeight: FontWeight.w400, fontFamily: 'Causten')),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Optionally, check other conditions here if needed
                      if (_authController.isAtLeast8Characters.value &&
                          _authController.hasUpperCase.value &&
                          _authController.hasLowerCase.value &&
                          _authController.hasDigit.value &&
                          _authController.hasSpecialCharacter.value) {
                        // If all validations pass, verify code and navigate
                        _authController.verifyCode();
                        // Get.toNamed(home);
                      } else {
                        // Show some error message if the password rules are not met
                        Get.snackbar('Validation Error', t.translate('Please make sure your password meets all the requirements.'));
                      }
                    } else {
                      // Show some error message if the form is not valid
                      Get.snackbar('Validation Error', t.translate('Please fill out all fields correctly.'));
                    }
                  },
                  child: Text(t.translate('Activate Account')),
                ),
                SizedBox(height: 24.h),
                Center(
                    child: Column(
                  children: [
                    Text(t.translate('terms_and_conditions_msg'),
                        style: FluukyTheme.lightTheme.textTheme.displaySmall!.copyWith(color: FluukyTheme.inputTextColor)),
                    Wrap(
                      // alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () => Get.toNamed(termsAndCondition),
                          style: TextButton.styleFrom(
                            textStyle: FluukyTheme.lightTheme.textTheme.bodyLarge!.copyWith(color: FluukyTheme.primaryColor),
                            minimumSize: const Size(0, 0),
                            padding: const EdgeInsets.all(0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(t.translate('Terms & Conditions')),
                        ),
                        Text(t.translate('_and_'),
                            style: FluukyTheme.lightTheme.textTheme.displaySmall!.copyWith(color: FluukyTheme.inputTextColor),
                            textAlign: TextAlign.center),
                        TextButton(
                          onPressed: () => Get.toNamed(privacyPolicy),
                          style: TextButton.styleFrom(
                            textStyle: FluukyTheme.lightTheme.textTheme.bodyLarge!.copyWith(color: FluukyTheme.primaryColor),
                            padding: const EdgeInsets.all(0),
                            minimumSize: const Size(0, 0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(t.translate('privacy_policy')),
                        ),
                      ],
                    ),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordRule(BuildContext context, String ruleText, RxBool isValid) {
    return Obx(() => Wrap(
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Icon(
              isValid.value ? Icons.check : Icons.close,
              color: isValid.value ? FluukyTheme.primaryColor : FluukyTheme.redColor,
              size: 18.w,
            ),
            SizedBox(width: 4.w),
            Text(ruleText, style: FluukyTheme.lightTheme.textTheme.displaySmall),
          ],
        ));
  }
}
