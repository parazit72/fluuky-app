import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';

class ReferralRewardsWidget extends StatelessWidget {
  const ReferralRewardsWidget({super.key});
  @override
  Widget build(BuildContext context) {
    String referralCode = 'HPA212F0AK1T';
    final GlobalKey<TooltipState> tooltipkey = GlobalKey<TooltipState>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Referral Rewards', style: Theme.of(context).textTheme.titleLarge),
          Text('Refer Fluuky to your friends and family and get rewarded!', style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 24),
          Center(
            child: Container(
              padding: const EdgeInsets.all(47),
              decoration: const BoxDecoration(
                // image: DecorationImage(image: AssetImage("assets/images/paper.jpg"), fit: BoxFit.cover),
                borderRadius: BorderRadius.all(Radius.circular(8)),
                boxShadow: [
                  BoxShadow(color: Color(0xFFDBDBDB)),
                  BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
                ],
              ),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Text(
                    referralCode,
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'When your friend signs up with your referral code and makes their first purchase, both of you receive a 25 AED credit.',
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
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
                    message: 'Code copied to clipboard',
                    child: ElevatedButton(
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: referralCode));
                          tooltipkey.currentState?.ensureTooltipVisible();
                        },
                        child: const Text('COPY CODE')),
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
