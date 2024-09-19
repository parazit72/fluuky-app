import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/l10n/app_localizations.dart';

class ReferralRewardsWidget extends StatelessWidget {
  const ReferralRewardsWidget({super.key});
  @override
  Widget build(BuildContext context) {
    String referralCode = 'HPA212F0AK1T';
    final GlobalKey<TooltipState> tooltipkey = GlobalKey<TooltipState>();
    var t = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(t.translate('referral_rewards'), style: Theme.of(context).textTheme.titleLarge),
          Text(t.translate('refer_fluuky_to_your_friends'), style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 24),
          Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                // boxShadow: [
                //   BoxShadow(color: Colors.white),
                //   BoxShadow(color: Color(0xFFDBDBDB), spreadRadius: -4.0, blurRadius: 8.6),
                // ],
                borderRadius: BorderRadius.all(Radius.circular(8)),
                image: DecorationImage(image: AssetImage("assets/images/ticket-back.png"), fit: BoxFit.contain),
              ),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Text(
                    referralCode,
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .7,
                    child: Text(
                      t.translate('when_your_friend_signs_up_with_your_referral_code'),
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Tooltip(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: FluukyTheme.secondaryColor,
                    ),
                    height: 14,
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(15),
                    preferBelow: false,
                    textStyle: const TextStyle(fontSize: 12),
                    waitDuration: const Duration(seconds: 1),
                    key: tooltipkey,
                    triggerMode: TooltipTriggerMode.manual,
                    showDuration: const Duration(seconds: 3),
                    message: t.translate('code_copied'),
                    child: ElevatedButton(
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: referralCode));
                          tooltipkey.currentState?.ensureTooltipVisible();
                        },
                        child: Text(t.translate('COPY_CODE'))),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
