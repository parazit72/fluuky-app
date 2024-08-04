import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluuky/data/local/local_storage.dart';
import 'package:lottie/lottie.dart';
import '../../../app/config/assets_constants.dart';
import '../../../app/config/route_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _navigateTimer;

  @override
  void initState() {
    _navigateHomepage();
    super.initState();
  }

  @override
  void dispose() {
    _navigateTimer?.cancel();
    super.dispose();
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

  _navigateHomepage() async {
    bool isFirstLaunch = await LocalStorage.isFirstLaunch();

    _navigateTimer = Timer(const Duration(seconds: 2), () {
      if (mounted) {
        if (isFirstLaunch) {
          Navigator.pushReplacementNamed(context, walkthrough);
          LocalStorage.setFirstLaunch(false);
        } else {
          Navigator.pushReplacementNamed(context, walkthrough);
        }
      }
    });
  }
}
