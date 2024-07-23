import 'package:flutter/material.dart';
import 'package:fluuky/presentation/widgets/background_scaffold.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthController _authController = Get.find<AuthController>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Stack(children: [
        Positioned(
          top: 150,
          child: Image.asset('assets/images/fluuky.png', height: 80),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 24),
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
            ],
          ),
        ),
      ]),
    );
  }
}
