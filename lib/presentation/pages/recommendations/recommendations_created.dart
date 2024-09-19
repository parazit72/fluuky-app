import 'package:flutter/material.dart';
import 'package:fluuky/l10n/app_localizations.dart';

import 'package:fluuky/presentation/widgets/layout/background_scaffold.dart';
import 'package:get/get.dart';

class RecommendationsCreatedScreen extends StatelessWidget {
  const RecommendationsCreatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return Dialog(
      insetPadding: const EdgeInsets.all(0),
      child: BackgroundScaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Positioned(
                top: 25,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        t.translate('your_recommendations_list_successfully_created'),
                        style: Theme.of(context).textTheme.titleLarge,
                        // textAlign: TextAlign.center,
                      ),
                      Text(
                        t.translate('based_on_your_interests_we_think_you_will_love_these_draws'),
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Center(child: Image.asset('assets/images/recommendation-completed.png')),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ElevatedButton(onPressed: () => Get.back(), child: Text(t.translate('continue'))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
