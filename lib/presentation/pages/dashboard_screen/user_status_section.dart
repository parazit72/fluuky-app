import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:to_arabic_number/to_arabic_number.dart';

class UserStatusWidget extends StatelessWidget {
  const UserStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    // Get the current locale
    final locale = Get.locale;

    // Define a method to format numbers based on locale
    String formatNumber(String number) {
      if (locale?.languageCode == 'ar') {
        return Arabic.number(number);
      } else {
        return number;
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: InkWell(
        onTap: () => Get.toNamed(flukkyLoyalityProgram),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            image: DecorationImage(fit: BoxFit.fill, image: AssetImage('assets/images/paper-box.png')),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/leaf-circle-green.svg',
                          colorFilter: ColorFilter.mode(Theme.of(context).primaryColor, BlendMode.srcIn), width: 16, height: 16),
                      const SizedBox(width: 5),
                      Text(t.translate('basic'), style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/leaf-circle-green.svg',
                          colorFilter: ColorFilter.mode(Theme.of(context).primaryColor, BlendMode.srcIn), width: 16, height: 16),
                      const SizedBox(width: 5),
                      Text(t.translate('silver'), style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8, top: 8),
                child: LinearProgressIndicator(
                  value: 0,
                  borderRadius: BorderRadius.circular(50),
                  color: FluukyTheme.primaryColor,
                  backgroundColor: FluukyTheme.lightTheme.primaryColor,
                  valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formatNumber('5,000/10,000 AED'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
                  Text(formatNumber(t.translate('12_months_left')), style: FluukyTheme.lightTheme.textTheme.displaySmall),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/exclamation-mark.png', width: 20, height: 20),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        formatNumber(t.translate('spend_5k_more')),
                        style: FluukyTheme.lightTheme.textTheme.displaySmall!.copyWith(fontSize: 11),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
