// lib/presentation/pages/login_screen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import '../widgets/background_scaffold.dart';

class LoginScreen extends GetView<LoginController> {
  LoginScreen({Key? key}) : super(key: key) {
    Get.put(LoginController());
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 50),
              Image.asset('assets/images/fluuky.png', height: 80),
              const SizedBox(height: 24),
              Text('Welcome back to Fluuky!', textAlign: TextAlign.center),
              const SizedBox(height: 8),
              Text('Sign in to your account to continue your tree-planting journey.', textAlign: TextAlign.center),
              const SizedBox(height: 24),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(height: 16),
              Obx(() => TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isPasswordVisible.value ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: controller.togglePasswordVisibility,
                      ),
                    ),
                    obscureText: !controller.isPasswordVisible.value,
                  )),
              const SizedBox(height: 16),
              Row(
                children: [
                  Obx(() => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (_) => controller.toggleRememberMe(),
                      )),
                  Text(
                    'Remember me',
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      // Handle forgot password
                    },
                    child: Text(
                      'Forgot Password?',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => controller.login(
                  _emailController.text,
                  _passwordController.text,
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  'Login',
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to sign up page
                    },
                    child: Text(
                      'Sign up',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
