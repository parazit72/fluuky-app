import 'package:flutter/material.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/domain/entities/winner_entity.dart';
import 'package:fluuky/l10n/app_localizations.dart';

class WinnerCardWidget extends StatelessWidget {
  final WinnerEntity winner;

  const WinnerCardWidget({super.key, required this.winner});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.only(bottom: 20, right: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: MediaQuery.of(context).size.width * 0.17,
            backgroundImage: const AssetImage('assets/images/avatar.jpg'),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child:
                Text(t.translate('winner_of_the'), style: FluukyTheme.lightTheme.textTheme.displaySmall!.copyWith(color: FluukyTheme.primaryColor)),
          ),
          Text('Rolex Submariner', style: Theme.of(context).textTheme.titleSmall),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Text(winner.name, style: FluukyTheme.lightTheme.textTheme.displaySmall),
          ),
          Text('20 December 2023', style: FluukyTheme.lightTheme.textTheme.displaySmall!.copyWith(color: FluukyTheme.secondaryColor)),
        ],
      ),
    );
  }
}
