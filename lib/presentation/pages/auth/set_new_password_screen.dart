import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/controllers.dart';
import 'package:fluuky/presentation/widgets/layout/background_scaffold.dart';
import 'package:fluuky/presentation/widgets/password_text_field_widget.dart';
import 'package:get/get.dart';

class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({super.key});

  @override
  _SetNewPasswordScreenState createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> with WidgetsBindingObserver {
  final AuthController _authController = Get.find<AuthController>();
  final FocusNode _passwordFocusNode = FocusNode();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<TooltipState> tooltipkey = GlobalKey<TooltipState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _passwordFocusNode.requestFocus();
    });

    // Add listeners for real-time validation
    _authController.passwordController.addListener(_validateInputs);
    _confirmPasswordController.addListener(_validateInputs);
  }

  void _validateInputs() {
    setState(() {});
  }

  @override
  void dispose() {
    // Remove listeners when the widget is disposed
    _authController.passwordController.removeListener(_validateInputs);
    _confirmPasswordController.removeListener(_validateInputs);
    super.dispose();
  }

  bool _arePasswordsMatching() {
    return _authController.passwordController.text == _confirmPasswordController.text;
  }

  // Validation function to check password requirements
  String? _validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return AppLocalizations.of(context)!.translate('Password Required');
    }
    if (password.length < 8) {
      return AppLocalizations.of(context)!.translate('password_too_short');
    }
    if (!RegExp(r'^(?=.*?[A-Z])').hasMatch(password)) {
      return AppLocalizations.of(context)!.translate('password_uppercase_required');
    }
    if (!RegExp(r'^(?=.*?[a-z])').hasMatch(password)) {
      return AppLocalizations.of(context)!.translate('password_lowercase_required');
    }
    if (!RegExp(r'^(?=.*?[0-9])').hasMatch(password)) {
      return AppLocalizations.of(context)!.translate('password_number_required');
    }
    if (!RegExp(r'^(?=.*?[!@#\$&*~])').hasMatch(password)) {
      return AppLocalizations.of(context)!.translate('password_special_char_required');
    }
    return null;
  }

  // Validation function to check password confirmation
  String? _validateConfirmPassword(String? confirmPassword) {
    if (confirmPassword != _authController.passwordController.text) {
      return AppLocalizations.of(context)!.translate('passwords_do_not_match');
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return BackgroundScaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 30.h, left: 20.w, right: 20.w),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 12.h),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      child: Text(
                        t.translate('Set a New Password'),
                        style: FluukyTheme.lightTheme.textTheme.titleLarge,
                      ),
                    ),
                    Text(
                      t.translate('Enter your new password and you are all set.'),
                      style: FluukyTheme.lightTheme.textTheme.displaySmall,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.h),
                      child: PasswordTextFieldWidget(
                        controller: _authController.passwordController,
                        hintText: t.translate('Enter your password'),
                        focusNode: _passwordFocusNode,
                        onChanged: _validateConfirmPassword,
                        validator: _validatePassword,
                      ),
                    ),
                    Tooltip(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(14.w), color: FluukyTheme.secondaryColor),
                      height: 14.h,
                      key: tooltipkey,
                      preferBelow: true,
                      padding: EdgeInsets.all(15.w),
                      margin: EdgeInsets.only(bottom: 10.w),
                      textStyle: TextStyle(fontSize: 12.w),
                      triggerMode: TooltipTriggerMode.manual,
                      waitDuration: const Duration(seconds: 1),
                      showDuration: const Duration(seconds: 3),
                      message: t.translate('passwords_do_not_match'),
                      child: PasswordTextFieldWidget(
                        labelText: t.translate('Confirm Password'),
                        controller: _confirmPasswordController,
                        hintText: t.translate('Confirm Password'),
                        validator: _validateConfirmPassword,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            t.translate('Password must include:'),
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: FluukyTheme.inputTextColor, height: 1.5),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildValidationCheck(t.translate('At least 8 characters'), _authController.passwordController.text.length >= 8),
                              _buildValidationCheck(
                                  t.translate('An uppercase character'), RegExp(r'^(?=.*?[A-Z])').hasMatch(_authController.passwordController.text)),
                              _buildValidationCheck(
                                  t.translate('A lowercase character'), RegExp(r'^(?=.*?[a-z])').hasMatch(_authController.passwordController.text)),
                              _buildValidationCheck(
                                  t.translate('A number'), RegExp(r'^(?=.*?[0-9])').hasMatch(_authController.passwordController.text)),
                              _buildValidationCheck(t.translate('A special character'),
                                  RegExp(r'^(?=.*?[!@#\$&*~])').hasMatch(_authController.passwordController.text)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.h),
                      child: ElevatedButton(
                        onPressed: _arePasswordsMatching()
                            ? () {
                                if (_formKey.currentState!.validate()) {
                                  // _authController.resendCode(_authController.emailController.text.trim());
                                  // Action when passwords match
                                  Get.toNamed(login);
                                }
                              }
                            : () => tooltipkey.currentState?.ensureTooltipVisible(),
                        child: Text(t.translate('Update Password')),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Obx(() {
            return _authController.isLoading.value ? const Center(child: CircularProgressIndicator()) : Container();
          }),
        ],
      ),
    );
  }

  // Helper method to create validation check icons and texts
  Widget _buildValidationCheck(String text, bool isValid) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.check,
          color: isValid ? FluukyTheme.primaryColor : FluukyTheme.redColor,
        ),
        SizedBox(width: 4.w),
        Text(
          text,
          style: TextStyle(
            fontSize: 14.w,
            fontWeight: FontWeight.w400,
            color: isValid ? FluukyTheme.thirdColor : FluukyTheme.redColor,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
