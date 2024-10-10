import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(t.translate('referral_rewards'), style: FluukyTheme.lightTheme.textTheme.titleLarge),
          SizedBox(height: 4.h),
          Text(t.translate('refer_fluuky_to_your_friends'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
          SizedBox(height: 24.h),
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.w)),
                image: const DecorationImage(image: AssetImage("assets/images/ticket-back.png"), fit: BoxFit.contain),
              ),
              width: MediaQuery.of(context).size.width,
              child: Container(
                padding: EdgeInsets.all(24.w),
                child: Column(
                  children: [
                    Text(
                      referralCode,
                      style: FluukyTheme.lightTheme.textTheme.labelLarge,
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      width: 240.w,
                      child: Text(
                        t.translate('when_your_friend_signs_up_with_your_referral_code'),
                        style: FluukyTheme.lightTheme.textTheme.displaySmall!.copyWith(fontSize: 11.w),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Tooltip(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(14.w), color: FluukyTheme.secondaryColor),
                      height: 14.h,
                      key: tooltipkey,
                      preferBelow: false,
                      padding: EdgeInsets.all(15.w),
                      margin: EdgeInsets.only(bottom: 10.w),
                      textStyle: TextStyle(fontSize: 12.w),
                      triggerMode: TooltipTriggerMode.manual,
                      waitDuration: const Duration(seconds: 1),
                      showDuration: const Duration(seconds: 3),
                      message: t.translate('code_copied'),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            textStyle: WidgetStateProperty.all(FluukyTheme.lightTheme.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.w600)),
                            minimumSize: WidgetStateProperty.all<Size>(Size(240.w, 36.h)),
                          ),
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
          ),
        ],
      ),
    );
  }
}
