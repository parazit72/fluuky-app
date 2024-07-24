import 'package:flutter/material.dart';
import 'package:fluuky/presentation/widgets/background_scaffold.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class VerificationScreen extends StatefulWidget {
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> with WidgetsBindingObserver {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthController _authController = Get.find<AuthController>();
  final DraggableScrollableController _scrollableController = DraggableScrollableController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    _emailFocusNode.addListener(_handleFocusChange);
    _passwordFocusNode.addListener(_handleFocusChange);
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
        0.64,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _updateSheetSize() {
    final targetExtent = _isKeyboardVisible ? 1.0 : 0.64;
    _scrollableController.animateTo(
      targetExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 0.16,
            right: 0,
            left: 0,
            child: Image.asset('assets/images/fluuky.png', height: 28),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: DraggableScrollableSheet(
              expand: false,
              controller: _scrollableController,
              initialChildSize: 0.64,
              minChildSize: 0.64,
              maxChildSize: 1.0,
              snap: true,
              builder: (BuildContext context, ScrollController scrollController) {
                return NotificationListener<DraggableScrollableNotification>(
                  onNotification: (notification) {
                    if (notification.extent > 0.7) {
                      return false;
                    }
                    return true;
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/images/paper.jpg"), fit: BoxFit.cover),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)),
                      boxShadow: [BoxShadow(offset: Offset(0, -1), color: Colors.black26, spreadRadius: 0, blurRadius: 4)],
                    ),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: SizedBox(
                        // height: MediaQuery.of(context).size.height * 0.64,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 20),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  'Welcome back to Fluuky!',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ),
                              Text(
                                'Sign in to your account to continue your tree-planting journey.',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              const SizedBox(height: 20),
                              TextField(
                                controller: _emailController,
                                focusNode: _emailFocusNode,
                                decoration: const InputDecoration(labelText: 'Email'),
                              ),
                              const SizedBox(height: 16),
                              TextField(
                                controller: _passwordController,
                                focusNode: _passwordFocusNode,
                                decoration: const InputDecoration(labelText: 'Password'),
                                obscureText: true,
                              ),
                              const SizedBox(height: 24),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Checkbox(value: true, onChanged: onPressed),
                                          Text(
                                            'Remember me?',
                                            style: Theme.of(context).textTheme.bodySmall,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: TextButton(
                                        onPressed: () {},
                                        child: const Text(
                                          'Forgot Password?',
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  final (success, errorMessage) = await _authController.login(
                                    _emailController.text,
                                    _passwordController.text,
                                  );
                                  if (success) {
                                    Get.offAllNamed('/home');
                                  } else {
                                    Get.snackbar(
                                      'Error',
                                      errorMessage ?? 'An error occurred',
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: Colors.red,
                                      colorText: Colors.white,
                                      duration: const Duration(seconds: 3),
                                    );
                                  }
                                },
                                child: const Text('Login'),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text('Don’t have an account? Sign Up'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void onPressed(bool? value) {}
}
