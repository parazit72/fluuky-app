import 'package:flutter/material.dart';
import 'package:fluuky/l10n/app_localizations.dart';

class ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            // Handle Buy Now
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          child: Text(t.translate('Buy Now')),
        ),
        const SizedBox(height: 10),
        OutlinedButton(
          onPressed: () {
            // Handle Add to Wishlist
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: Theme.of(context).primaryColor,
            minimumSize: const Size(double.infinity, 50),
          ),
          child: Text(t.translate('Add to Wishlist')),
        ),
      ],
    );
  }
}
