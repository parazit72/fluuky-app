import 'package:flutter/material.dart';
import 'package:fluuky/presentation/widgets/layout/background_scaffold.dart';
import 'package:fluuky/presentation/pages/draw/bundle_section.dart';

class TreesPlantedDialog extends StatelessWidget {
  const TreesPlantedDialog({super.key});

  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    'Grow more trees and save more when you purchase Fluuky bundles',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                const SizedBox(height: 20),
                const BundleSection(
                  title: 'Thrive Bundle',
                  description: 'Purchase between 5-9 tickets and save 5%!',
                  ticketsInfo: 'Number of Tickets: 5-9',
                  discountInfo: 'Discount: 5% off the total ticket price.',
                ),
                const SizedBox(height: 20),
                const BundleSection(
                  title: 'Flourish Bundle',
                  description: 'Purchase 10 or more tickets and save 10%!',
                  ticketsInfo: 'Number of Tickets: 10 or more',
                  discountInfo: 'Discount: 10% off the total ticket price.',
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
