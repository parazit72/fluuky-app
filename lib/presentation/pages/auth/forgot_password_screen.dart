import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/controllers.dart';
import 'package:fluuky/presentation/widgets/layout/background_scaffold.dart';
import 'package:fluuky/presentation/widgets/input_text_field_widget.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> with WidgetsBindingObserver {
  final AuthController _authController = Get.find<AuthController>();
  final FocusNode _emailFocusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _emailFocusNode.requestFocus();
    });
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 12.h),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: Text(
                      t.translate('Forgot Password?'),
                      style: FluukyTheme.lightTheme.textTheme.titleLarge,
                    ),
                  ),
                  Text(
                    t.translate('No worries! Enter your email and we will send you reset instructions.'),
                    style: FluukyTheme.lightTheme.textTheme.displaySmall,
                  ),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.h),
                      child: InputTextFieldWidget(
                          labelText: t.translate('email'),
                          hintText: t.translate('enterEmailAddress'),
                          validator: (value) => EmailValidator.validate(value ?? '') ? null : t.translate("Please enter a valid email"),
                          controller: _authController.emailController,
                          focusNode: _emailFocusNode),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // _authController.resendCode(_authController.emailController.text.trim());
                        Get.toNamed(verification);
                      }
                    },
                    child: Text(t.translate('Send Instructions')),
                  ),
                  // SizedBox(height: 24.h),
                  TextButton(
                    onPressed: () => Get.back(),
                    child: Wrap(spacing: 10, crossAxisAlignment: WrapCrossAlignment.center, children: [
                      Text(
                        t.translate('Go back to'),
                        style: FluukyTheme.lightTheme.textTheme.displaySmall,
                      ),
                      Text(t.translate('Login page'))
                    ]),
                  ),
                ],
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
}
