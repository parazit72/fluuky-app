import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/data/local/local_storage.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/controllers.dart';
import 'package:fluuky/presentation/widgets/layout/background_scaffold.dart';
import 'package:fluuky/presentation/widgets/input_text_field_widget.dart';
import 'package:fluuky/presentation/widgets/password_text_field_widget.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with WidgetsBindingObserver {
  final AuthController _authController = Get.find<AuthController>();
  final DraggableScrollableController _scrollableController = DraggableScrollableController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  bool _isKeyboardVisible = false;
  bool isFirstLaunch = false;
  final double _targetExtent = 570.h / 812.h;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initializeSettings();
    _emailFocusNode.addListener(_handleFocusChange);
    _passwordFocusNode.addListener(_handleFocusChange);
  }

  Future<void> _initializeSettings() async {
    // Check if it's the first app launch
    isFirstLaunch = await LocalStorage.isFirstLaunch();
    LocalStorage.setFirstLaunch(false);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    _emailFocusNode.removeListener(_handleFocusChange);
    _passwordFocusNode.removeListener(_handleFocusChange);
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    final keyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
    if (_isKeyboardVisible != keyboardVisible) {
      setState(() {
        _isKeyboardVisible = keyboardVisible;
      });
      _updateSheetSize();
    }
  }

  void _handleFocusChange() {
    if (_emailFocusNode.hasFocus || _passwordFocusNode.hasFocus) {
      _scrollableController.animateTo(
        1.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _scrollableController.animateTo(
        _targetExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _updateSheetSize() {
    final targetExtent = _isKeyboardVisible ? 1.0 : _targetExtent;
    _scrollableController.animateTo(
      targetExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return BackgroundScaffold(
      body: Stack(
        children: [
          Positioned(
            top: 100.h,
            right: 0,
            left: 0,
            child: Image.asset('assets/images/fluuky.png', height: 28.h),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: DraggableScrollableSheet(
              expand: false,
              controller: _scrollableController,
              initialChildSize: _targetExtent,
              minChildSize: _targetExtent,
              maxChildSize: 1,
              // snap: true,
              builder: (BuildContext context, ScrollController scrollController) {
                return NotificationListener<DraggableScrollableNotification>(
                  onNotification: (notification) {
                    if (notification.extent > _targetExtent) {
                      return false;
                    }
                    return true;
                  },
                  child: Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Container(
                      padding: EdgeInsets.only(top: 28.h, left: 20.w, right: 20.w),
                      decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/images/paper.jpg"), fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)),
                        boxShadow: [BoxShadow(offset: Offset(0, -1), color: Colors.black26, spreadRadius: 0, blurRadius: 4)],
                      ),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              child: Text(
                                isFirstLaunch ? t.translate('Welcome to FLUUKY!') : t.translate('Welcome back to FLUUKY!'),
                                style: FluukyTheme.lightTheme.textTheme.titleLarge,
                              ),
                            ),
                            Text(
                              t.translate('sign_in_continue_tree_planting'),
                              style: FluukyTheme.lightTheme.textTheme.displaySmall,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 24.h),
                              child: InputTextFieldWidget(
                                labelText: t.translate('email'),
                                hintText: t.translate('enterEmailAddress'),
                                controller: _authController.emailController,
                                focusNode: _emailFocusNode,
                                validator: (value) => EmailValidator.validate(value ?? '') ? null : t.translate("Please enter a valid email"),
                              ),
                            ),
                            PasswordTextFieldWidget(
                              controller: _authController.passwordController,
                              hintText: t.translate('Enter your password'),
                              focusNode: _passwordFocusNode,
                              validator: (value) {
                                if (value != null && value.length < 6) {
                                  return t.translate('Password too short.');
                                }
                                return null;
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 24.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Wrap(
                                    alignment: WrapAlignment.start,
                                    crossAxisAlignment: WrapCrossAlignment.center,
                                    children: [
                                      Obx(
                                        () => Stack(
                                          children: [
                                            Image.asset('assets/images/checkbox.png', width: 24.w, height: 24.h),
                                            SizedBox(
                                              width: 24.w,
                                              height: 24.h,
                                              child: Transform.scale(
                                                scale: 1.2,
                                                child: Checkbox(
                                                  fillColor: WidgetStateProperty.all(Colors.transparent),
                                                  value: _authController.rememberMe.value,
                                                  onChanged: (bool? value) {
                                                    _authController.rememberMe.value = value!;
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 8.w),
                                      Text(
                                        t.translate('remember_me?'),
                                        style: FluukyTheme.lightTheme.textTheme.labelMedium,
                                      ),
                                    ],
                                  ),
                                  Flexible(
                                    child: TextButton(
                                      style: ButtonStyle(
                                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                        padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 0)),
                                        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
                                      ),
                                      onPressed: () => Get.toNamed(forgotPassword),
                                      child: Text(t.translate('forgot_password')),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  await _authController.loginWithEmail();
                                }
                              },
                              child: Text(t.translate('login')),
                            ),
                            SizedBox(height: 24.h),
                            TextButton(
                              style: ButtonStyle(
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 0)),
                                minimumSize: WidgetStateProperty.all(Size(double.infinity, 24.h)),
                              ),
                              onPressed: () => Get.toNamed(signUp),
                              child: Wrap(spacing: 10, crossAxisAlignment: WrapCrossAlignment.center, children: [
                                Text(
                                  t.translate('dontHaveAccount'),
                                  style: FluukyTheme.lightTheme.textTheme.displaySmall,
                                ),
                                Text(t.translate('signup'))
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
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
