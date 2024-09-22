import 'package:flutter/material.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/widgets/layout/background_scaffold.dart';
import 'package:fluuky/presentation/pages/draw/bundle_section.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';

class TreesPlantedDialog extends StatelessWidget {
  const TreesPlantedDialog({super.key});

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
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    t.translate('growMoreTrees'),
                    textAlign: TextAlign.center,
                    style: FluukyTheme.lightTheme.textTheme.displaySmall,
                  ),
                ),
                const SizedBox(height: 20),
                BundleSection(
                  title: t.translate('thriveBundle'),
                  description: t.translate('thriveBundleDescription'),
                  ticketsInfo: t.translate('NumberTickets5-9'),
                  discountInfo: t.translate('discount5%'),
                ),
                const SizedBox(height: 20),
                BundleSection(
                  title: t.translate('flourishBundle'),
                  description: t.translate('flourishBundleDescription'),
                  ticketsInfo: t.translate('NumberTickets10orMore'),
                  discountInfo: t.translate('discount10%'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(t.translate('ok')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
