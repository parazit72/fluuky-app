import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluuky/data/local/local_storage.dart';
import 'package:fluuky/presentation/controllers/controllers.dart';
import 'package:fluuky/presentation/pages/auth/login_screen.dart';
import 'package:fluuky/presentation/pages/draw/draws_list_screen.dart';
import 'package:fluuky/presentation/pages/home_screen/home_screen.dart';
import 'package:fluuky/presentation/pages/intro/walkthrough_screen.dart';
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
  bool isFirstLaunch = false;

  @override
  void initState() {
    super.initState();
    _initializeSettings();
  }

  Future<void> _initializeSettings() async {
    // Check if it's the first app launch
    isFirstLaunch = await LocalStorage.isFirstLaunch();

    // Check if the user is logged in
    await _authRepository.checkLoginStatus();

    await Future.delayed(const Duration(seconds: 2));
    // Navigate after initialization is complete
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() {
    if (isFirstLaunch) {
      Get.offAll(() => const WalkthroughScreen());
    } else if (_authRepository.isLogged.value) {
      Get.offAll(() => const HomeScreen());
    } else {
      Get.offAll(() => const DrawsListScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: LottieBuilder.asset(AssetConstants.splashLottie, repeat: true),
      ),
    );
  }
}
