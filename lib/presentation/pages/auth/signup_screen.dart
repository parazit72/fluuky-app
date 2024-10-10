import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/auth_controller.dart';
import 'package:fluuky/presentation/widgets/mobile_input_widget.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';

import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final AuthController _authController = Get.find<AuthController>();
  final _formKey = GlobalKey<FormState>();
  String initialCountry = 'AE';
  PhoneNumber number = PhoneNumber(isoCode: 'AE');

  var isLogin = false.obs;
  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return BackgroundScaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: null,
        toolbarHeight: 90.h,
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: 375.w,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(t.translate('Register in 4 steps:'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
                      Text(t.translate('step_1_4'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 375.w, child: const Expanded(child: Divider(thickness: 1))),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(18.w),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(t.translate('create_account'), style: FluukyTheme.lightTheme.textTheme.titleLarge),
            SizedBox(height: 4.h),
            Text(t.translate('readyToMakeImpact'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
            SizedBox(height: 24.h),
            Container(
              padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(color: FluukyTheme.primaryShadowColor, spreadRadius: 0),
                  BoxShadow(color: FluukyTheme.fourthColor, spreadRadius: -4.0, blurRadius: 8.6),
                ],
                color: FluukyTheme.secondaryColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(16.w),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: Icon(Icons.info_outline, size: 16.w, color: FluukyTheme.primaryColor),
                  ),
                  SizedBox(width: 8.w),
                  SizedBox(
                    width: 287.w,
                    child: Text(
                      t.translate('pleaseEnterFirstNameMandatoryPrizesWinning'),
                      style: FluukyTheme.lightTheme.textTheme.labelSmall!.copyWith(color: FluukyTheme.primaryColor, height: 1.66),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            registerWidget()
          ]),
        ),
      ),
    );
  }

  Widget registerWidget() {
    var t = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            InputTextFieldWidget(
              controller: _authController.firstNameController,
              labelText: t.translate('firstName'),
              hintText: t.translate('enterFirstName'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return t.translate('Please enter your first name');
                } else if (value.length > 50) {
                  return t.translate('Maximum length is 50 characters');
                }
                return null;
              },
            ),
            SizedBox(height: 24.h),
            InputTextFieldWidget(
              controller: _authController.lastNameController,
              labelText: t.translate('lastName'),
              hintText: t.translate('enterLastName'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return t.translate('Please enter your last name');
                } else if (value.length > 50) {
                  return t.translate('Maximum length is 50 characters');
                }
                return null;
              },
            ),
            SizedBox(height: 24.h),
            MobileInputWidget(
              controller: _authController.mobileController,
              showCode: true,
              hintText: t.translate('Enter your mobile number'),
              labelText: t.translate('phoneNumber'),
            ),
            SizedBox(height: 24.h),
            InputTextFieldWidget(
              controller: _authController.emailController,
              labelText: t.translate('email'),
              hintText: t.translate('Enter your Email Address'),
              keyboardType: TextInputType.emailAddress,
              validator: (value) => EmailValidator.validate(value ?? '') ? null : t.translate("Please enter a valid email"),
            ),
            SizedBox(height: 24.h),
            InputTextFieldWidget(
              controller: _authController.referralCodeController,
              labelText: t.translate('referral_code'),
              labelTextHelper: t.translate('(If Available)'),
              hintText: t.translate('enter_referral_code'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24.h),
              child: ElevatedButton(
                style: ButtonStyle(
                  minimumSize: WidgetStatePropertyAll(Size(335.w, 48.h)),
                  textStyle: WidgetStateProperty.all(TextStyle(fontSize: 16.w, fontWeight: FontWeight.w600, fontFamily: FluukyTheme.fontFamily)),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Get.toNamed(verification, arguments: {'email': _authController.emailController.text});
                    // _authController.registerWithEmail();
                  }
                },
                child: Text(t.translate('continue')),
              ),
            ),
            TextButton(
                onPressed: goSignIn,
                child: Wrap(
                  children: [
                    Text(t.translate('Already have an account?'), style: FluukyTheme.lightTheme.textTheme.labelMedium),
                    SizedBox(width: 6.w),
                    Text(t.translate('Sign in'), style: FluukyTheme.lightTheme.textTheme.labelLarge),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  void goSignIn() {
    Navigator.pushReplacementNamed(context, login);
  }
}
