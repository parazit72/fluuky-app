import 'package:flutter/material.dart';
import 'package:fluuky/presentation/widgets/layout/app_bar_fluuky_widget.dart';
import 'package:fluuky/presentation/widgets/layout/custom_nav_bar.dart';

class BackgroundScaffold extends StatelessWidget {
  final Widget body;
  final Widget? appBar;
  final Widget? bottomNavigationBar;
  final bool? resizeToAvoidBottomInset;

  const BackgroundScaffold({
    required this.body,
    this.appBar,
    this.bottomNavigationBar,
    super.key,
    bool this.resizeToAvoidBottomInset = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const AppBarFluuky(),
      // bottomNavigationBar: CustomNavBar(),

      resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? true,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/long-background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                if (appBar != null) appBar!,
                Expanded(child: body),
                if (bottomNavigationBar != null) bottomNavigationBar!,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
