import 'package:flutter/material.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';

class TreesPlantedWithFlukkyWidget extends StatelessWidget {
  const TreesPlantedWithFlukkyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.black87),
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset('assets/images/jungle-1.jpg', fit: BoxFit.cover),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height: 100,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 100,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '15,000',
                  style: FluukyTheme.lightTheme.textTheme.titleLarge!.copyWith(color: Colors.white),
                ),
                Text(
                  t.translate('TREES_PLANTED_WITH_FLUUKY'),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
