import 'package:flutter/material.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/pages/profile/flukky_loyality_program_screen/gold_tier_widget.dart';
import 'package:fluuky/presentation/widgets/layout/app_bar_single.dart';
import 'package:fluuky/presentation/pages/profile/flukky_loyality_program_screen/validity_tier_maintenance_widget.dart';
import 'package:fluuky/presentation/pages/profile/flukky_loyality_program_screen/silver_tier_widget.dart';

import 'package:fluuky/presentation/widgets/widgets.dart';

class FlukkyLoyalityProgramScreen extends StatelessWidget {
  const FlukkyLoyalityProgramScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return BackgroundScaffold(
      appBar: AppBarSingleWidget(title: t.translate('flukkyLoyaltyProgram')),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: ListView(
          children: [
            const SizedBox(height: 32),
            Text(t.translate('unlockRewardsWithOurTieredLoyaltyProgram'), style: FluukyTheme.lightTheme.textTheme.bodySmall),
            const SizedBox(height: 24),
            const SilverTierWidget(),
            const SizedBox(height: 32),
            const GoldTierWidget(),
            const SizedBox(height: 32),
            const ValidityTierMaintenanceWidget(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
