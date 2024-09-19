import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/widgets/layout/app_bar_dialog.dart';
import 'package:fluuky/presentation/widgets/layout/background_scaffold.dart';
import 'package:get/get.dart';

class SingleBadgeScreen extends StatelessWidget {
  final String imagePath;
  const SingleBadgeScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

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
                    t.translate('congratulations') + 'John Doe!',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(color: FluukyTheme.thirdColor),
                    // textAlign: TextAlign.center,
                  ),
                  Text(
                    t.translate('youve_just_earned_your_first_badge'),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(color: FluukyTheme.thirdColor),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColor, width: 2.0),
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
                  Text(t.translate('eco_guardian'), style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 16),
                  SizedBox(
                      width: MediaQuery.of(context).size.width - 130,
                      child: Text(t.translate('feel_good_knowing_you_have_planted_10_trees'),
                          textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelMedium)),
                ]),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    ElevatedButton(onPressed: () => Get.back(), child: Text(t.translate('THANK_YOU_FOR_YOUR_IMPACT'))),
                    const SizedBox(height: 16.0),
                    OutlinedButton(onPressed: () {}, child: Text(t.translate('share')))
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
