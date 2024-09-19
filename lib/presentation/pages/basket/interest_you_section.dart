import 'package:flutter/material.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/pages/draw/draw_details.dart';

class InterestYouSection extends StatelessWidget {
  const InterestYouSection({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Text(t.translate('draws_that_may_interest_you'), style: Theme.of(context).textTheme.titleMedium),
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            const SizedBox(width: 20),
            ...List.generate(
                5,
                (index) => Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      padding: const EdgeInsets.only(left: 16, bottom: 16),
                      child: const DrawDetailsWidget(),
                    )),
          ]),
        ),
      ],
    );
  }
}
