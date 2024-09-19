import 'package:flutter/material.dart';
import 'package:fluuky/l10n/app_localizations.dart';

class AccountCreatedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Scaffold(
      body: Stack(children: [
        Positioned(
          top: MediaQuery.of(context).size.height * 0.5,
          child: Image.asset(
            'assets/images/long-background.jpg',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            Text(
              t.translate('amazing_all_set'),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              t.translate('click_start_planting'),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Image.asset(
              'assets/images/show-background.jpg',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
          ]),
        ),
        Positioned(
          bottom: 20,
          child: ElevatedButton(onPressed: () {}, child: Text(t.translate('let_start_planting'))),
        ),
      ]),
    );
  }
}
