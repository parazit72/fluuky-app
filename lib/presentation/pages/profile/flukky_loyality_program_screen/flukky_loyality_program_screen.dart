import 'package:flutter/material.dart';
import 'package:fluuky/presentation/pages/profile/flukky_loyality_program_screen/gold_tier_widget.dart';
import 'package:fluuky/presentation/widgets/layout/app_bar_single.dart';
import 'package:fluuky/presentation/pages/profile/flukky_loyality_program_screen/validity_tier_maintenance_widget.dart';
import 'package:fluuky/presentation/pages/profile/flukky_loyality_program_screen/silver_tier_widget.dart';

import 'package:fluuky/presentation/widgets/widgets.dart';

class FlukkyLoyalityProgramScreen extends StatelessWidget {
  const FlukkyLoyalityProgramScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      appBar: const AppBarSingleWidget(title: 'Flukky Loyality Program'),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: ListView(
          children: const [
            SizedBox(height: 32),
            Text('Unlock rewards with our tiered loyalty program!'),
            SilverTierWidget(),
            GoldTierWidget(),
            ValidityTierMaintenanceWidget(),
          ],
        ),
      ),
    );
  }
}
