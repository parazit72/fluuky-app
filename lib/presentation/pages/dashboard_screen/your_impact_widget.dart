import 'package:flutter/material.dart';
import 'package:fluuky/l10n/app_localizations.dart';

class YourImpactWidget extends StatelessWidget {
  const YourImpactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(t.translate('your_impact'), style: Theme.of(context).textTheme.titleLarge),
          Text(t.translate('withEverTicketPurchase'), style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: TextButton.icon(
                  style: ButtonStyle(
                      minimumSize: WidgetStateProperty.all(const Size(0, 0)),
                      padding: WidgetStateProperty.all(EdgeInsets.zero),
                      textStyle: WidgetStateProperty.all(const TextStyle(decoration: TextDecoration.underline))),
                  onPressed: () {},
                  icon: Icon(Icons.info_outline, size: 20, color: Theme.of(context).primaryColor),
                  label: Text(t.translate('more_details')),
                ),
              ),
              Text('10' + t.translate('trees'), style: Theme.of(context).textTheme.titleSmall),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              boxShadow: [
                BoxShadow(color: Color(0xFFDBDBDB)),
                BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
