import 'package:flutter/material.dart';
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
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(t.translate('create_a_password'), style: FluukyTheme.lightTheme.textTheme.titleLarge),
                const SizedBox(height: 5),
                Text(t.translate('lastStep'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
                const SizedBox(height: 24),
                PasswordTextFieldWidget(
                  controller: _authController.passwordController,
                  hintText: t.translate('password'),
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
                  labelText: t.translate('confirm_password'),
                  hintText: t.translate('password'),
                  // focusNode: _passwordFocusNode,
                  validator: (val) => (val != _authController.passwordController.text) ? t.translate('passwords_do_not_match') : null,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(t.translate('Password must include:'), style: FluukyTheme.lightTheme.textTheme.titleLarge),
                      const SizedBox(height: 8),
                      _buildPasswordRule(context, t.translate('min_8_characters'), _authController.isAtLeast8Characters),
                      _buildPasswordRule(context, t.translate('uppercase_character'), _authController.hasUpperCase),
                      _buildPasswordRule(context, t.translate('lowercase_character'), _authController.hasLowerCase),
                      _buildPasswordRule(context, t.translate('a_number'), _authController.hasDigit),
                      _buildPasswordRule(context, t.translate('special_character'), _authController.hasSpecialCharacter),
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
                  child: Text(t.translate('activate_account')),
                ),
                const SizedBox(height: 30),
                Center(
                    child: Column(
                  children: [
                    Text(t.translate('terms_and_conditions_msg'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
                    Wrap(
                      // alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () => Get.toNamed(termsAndCondition),
                          style: TextButton.styleFrom(
                            minimumSize: const Size(0, 0),
                            padding: const EdgeInsets.all(4),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(t.translate('terms_conditions')),
                        ),
                        Text(t.translate('_and_'), style: FluukyTheme.lightTheme.textTheme.displaySmall, textAlign: TextAlign.center),
                        TextButton(
                          onPressed: () => Get.toNamed(privacyPolicy),
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(4),
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
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 8,
          children: [
            Icon(
              isValid.value ? Icons.check : Icons.close,
              color: isValid.value ? Theme.of(context).primaryColor : const Color(0XFFD30201),
            ),
            Text(ruleText, style: FluukyTheme.lightTheme.textTheme.displaySmall),
          ],
        ));
  }
}
