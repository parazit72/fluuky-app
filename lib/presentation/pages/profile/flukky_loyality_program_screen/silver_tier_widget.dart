import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/l10n/app_localizations.dart';

class SilverTierWidget extends StatelessWidget {
  const SilverTierWidget({super.key});
  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/paper-box.png"), fit: BoxFit.fill),
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(color: Color(0xFFDBDBDB)),
            BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
          ],
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).primaryColor, width: 2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(child: Image.asset('assets/images/tree-green.png', width: 24)),
                ),
                Text(t.translate('SilverTier'), style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
            const SizedBox(height: 16),
            Text(t.translate('spend10kAEDwithin12Months'), style: Theme.of(context).textTheme.bodySmall!.copyWith(color: FluukyTheme.thirdColor)),
            const SizedBox(height: 24),
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Center(
                      child: SvgPicture.asset(
                    'assets/images/percentage.svg',
                    colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  )),
                ),
                Expanded(child: Text(t.translate('5percentOnAllDraws'))),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Center(
                      child: SvgPicture.asset(
                    'assets/images/diamond.svg',
                    width: 24,
                    height: 24,
                    colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  )),
                ),
                Expanded(child: Text(t.translate('exclusiveSilverTierDraws'))),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Center(
                      child: SvgPicture.asset(
                    width: 24,
                    height: 24,
                    'assets/images/cake.svg',
                    colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  )),
                ),
                Expanded(child: Text(t.translate('freeBirthdayCredittoPlantATree'))),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ));
  }
}
