import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluuky/presentation/controllers/controllers.dart';
import 'package:fluuky/presentation/pages/auth/login_screen.dart';
import 'package:fluuky/presentation/pages/home_screen/home_screen.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../app/config/assets_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthController _authRepository = Get.find();
  Timer? _navigateTimer;

  @override
  void initState() {
    super.initState();
    // _navigateHomepage();
    // _initializeSettings();
  }

  Future<void> _initializeSettings() async {
    _authRepository.checkLoginStatus();
  }

  @override
  void dispose() {
    _navigateTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeSettings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return waitingView();
        } else {
          if (snapshot.hasError) {
            return errorView(snapshot);
          } else {
            return const OnBoard();
          }
        }
      },
    );
  }

  Scaffold waitingView() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: LottieBuilder.asset(AssetConstants.splashLottie, repeat: true),
      ),
    );
  }

  Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
    return Scaffold(body: Center(child: Text('Error: ${snapshot.error}')));
  }
}

class OnBoard extends StatelessWidget {
  const OnBoard({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authRepository = Get.find();

    return Obx(() {
      return authRepository.isLogged.value ? const HomeScreen() : LoginScreen();
    });
  }
}
