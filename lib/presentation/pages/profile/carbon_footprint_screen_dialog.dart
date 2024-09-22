import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/widgets/layout/app_bar_dialog.dart';
import 'package:fluuky/presentation/widgets/layout/background_scaffold.dart';
import 'package:get/get.dart';

class CarbonFootprintScreen extends StatelessWidget {
  final String imagePath;
  const CarbonFootprintScreen({super.key, required this.imagePath});

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
                  Center(
                    child: SvgPicture.asset(
                      imagePath,
                      width: 100,
                      colorFilter: ColorFilter.mode(FluukyTheme.primaryColor, BlendMode.srcIn),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(t.translate('WHAT_IS_YOUR'), style: FluukyTheme.lightTheme.textTheme.bodySmall),
                  const SizedBox(height: 16),
                  Text(t.translate('carbon_footprint?'), style: FluukyTheme.lightTheme.textTheme.titleLarge),
                  const SizedBox(height: 16),
                  SizedBox(
                      width: MediaQuery.of(context).size.width - 130,
                      child: Text(t.translate('a_carbon_footprint_is_msg'),
                          textAlign: TextAlign.center, style: FluukyTheme.lightTheme.textTheme.bodySmall)),
                ]),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    ElevatedButton(onPressed: () => Get.toNamed(questionPage), child: Text(t.translate('calculate_my_carbon_footprint'))),
                    const SizedBox(height: 16.0),
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
