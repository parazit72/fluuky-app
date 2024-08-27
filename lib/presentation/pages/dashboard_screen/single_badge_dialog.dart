import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/presentation/widgets/layout/app_bar_dialog.dart';
import 'package:fluuky/presentation/widgets/layout/background_scaffold.dart';
import 'package:get/get.dart';

class SingleBadgeScreen extends StatelessWidget {
  final String imagePath;
  const SingleBadgeScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(0),
      child: BackgroundScaffold(
        appBar: const AppBarDialog(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Positioned(
                top: MediaQuery.of(context).size.height * 0.1,
                left: 0,
                right: 0,
                child: Column(children: [
                  Text(
                    'Congratulations, John Doe!',
                    style: Theme.of(context).textTheme.bodySmall,
                    // textAlign: TextAlign.center,
                  ),
                  Text(
                    'You’ve just earned your first badge.',
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 2.0,
                      ),
                      shape: BoxShape.circle,
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        imagePath,
                        width: 72,
                        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text('Eco Guardian', style: Theme.of(context).textTheme.titleLarge),
                  SizedBox(
                      width: MediaQuery.of(context).size.width - 130,
                      child: Text('Feel good knowing you have planted 10 trees!',
                          textAlign: TextAlign.center, style: Theme.of(context).textTheme.titleLarge)),
                ]),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    ElevatedButton(onPressed: () => Get.back(), child: const Text('THANK YOU FOR YOUR IMPACT!')),
                    const SizedBox(height: 16.0),
                    OutlinedButton(onPressed: () {}, child: const Text('Share'))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
