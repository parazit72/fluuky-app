import 'package:flutter/material.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/widgets/layout/background_scaffold.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';

class WeForestInfoScreen extends StatelessWidget {
  const WeForestInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Dialog(
      insetPadding: const EdgeInsets.all(0),
      child: BackgroundScaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(color: const Color.fromARGB(255, 233, 239, 235), borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Image.asset('assets/images/weforest-logo.png', fit: BoxFit.contain, height: 121),
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                t.translate('fluukyPartnerWeForest'),
                style: FluukyTheme.lightTheme.textTheme.titleLarge,
              ),
              const SizedBox(height: 8.0),
              Text(
                t.translate('throughThisPartnership'),
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Text(
                t.translate('valuesThatInspire'),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 16.0),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: <Widget>[
                  Chip(
                    backgroundColor: Colors.white,
                    label: Text(t.translate('Passion')),
                    shape: const StadiumBorder(side: BorderSide(color: Colors.grey)),
                  ),
                  Chip(
                    backgroundColor: Colors.white,
                    label: Text(t.translate('collaboration')),
                    shape: const StadiumBorder(side: BorderSide(color: Colors.grey)),
                  ),
                  Chip(
                    backgroundColor: Colors.white,
                    label: Text(t.translate('integrity')),
                    shape: const StadiumBorder(side: BorderSide(color: Colors.grey)),
                  ),
                ],
              ),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: <Widget>[
                  Chip(
                    backgroundColor: Colors.white,
                    label: Text(t.translate('transparency')),
                    shape: const StadiumBorder(side: BorderSide(color: Colors.grey)),
                  ),
                  Chip(
                    backgroundColor: Colors.white,
                    label: Text(t.translate('excellence')),
                    shape: const StadiumBorder(side: BorderSide(color: Colors.grey)),
                  ),
                ],
              ),
              Chip(
                backgroundColor: Colors.white,
                label: Text(t.translate('courage')),
                shape: const StadiumBorder(side: BorderSide(color: Colors.grey)),
              ),
              const Spacer(),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle learn more action
                  },
                  child: Text(t.translate('learnMore')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
