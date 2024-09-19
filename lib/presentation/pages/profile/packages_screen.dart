import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/auth_controller.dart';
import 'package:fluuky/presentation/widgets/bullet_list.dart';
import 'package:fluuky/presentation/widgets/custom_dropdown_button.dart';
import 'package:fluuky/presentation/widgets/payment_form_widget.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluuky/presentation/widgets/layout/app_bar_single.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';

class PackagesScreen extends StatefulWidget {
  const PackagesScreen({super.key});

  @override
  _PackagesScreenState createState() => _PackagesScreenState();
}

class _PackagesScreenState extends State<PackagesScreen> {
  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return BackgroundScaffold(
      appBar: AppBarSingleWidget(title: t.translate('Packages')),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
        children: [
          Text(t.translate('Prebuy Tree-Planting Packages'), style: Theme.of(context).textTheme.titleLarge!.copyWith(height: 2)),
          Text(t.translate('Receive additional credits when you prebuy bundle packages!'),
              style: Theme.of(context).textTheme.bodySmall!.copyWith(color: FluukyTheme.thirdColor)),
          PaymentFormWidget(),
          Container(
            margin: const EdgeInsets.only(top: 32),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(image: AssetImage('assets/images/paper-box.png'), fit: BoxFit.fill),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Theme.of(context).primaryColor, width: 2),
                      ),
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        'assets/images/tree-green.svg',
                        colorFilter: ColorFilter.mode(Theme.of(context).primaryColor, BlendMode.srcIn),
                        width: 24,
                        height: 24,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(t.translate('Forester Package'), style: Theme.of(context).textTheme.titleLarge),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  t.translate('Prebuy Amount: 10,000 AED'),
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(color: FluukyTheme.thirdColor),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).primaryColor),
                      child: Center(
                          child: SvgPicture.asset(
                        'assets/images/percentage.svg',
                        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      )),
                    ),
                    const SizedBox(width: 16),
                    Expanded(child: Text(t.translate('Receive an additional 10% credit (1000 AED)'))),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).primaryColor),
                      child: Center(
                          child: SvgPicture.asset(
                        'assets/images/db.svg',
                        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      )),
                    ),
                    const SizedBox(width: 16),
                    Expanded(child: Text(t.translate('Total credit in your FLUUKY account: 11,000 AED'))),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).primaryColor),
                      child: Center(
                          child: SvgPicture.asset(
                        'assets/images/diamond.svg',
                        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      )),
                    ),
                    const SizedBox(width: 16),
                    Expanded(child: Text(t.translate('directAccessForesterDsc'))),
                  ],
                ),
                const SizedBox(height: 48),
                ElevatedButton(
                  onPressed: () {
                    // Get.toNamed(greenSubscription);
                  },
                  child: Text(t.translate('Buy Now')),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 32),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(image: AssetImage('assets/images/paper-box.png'), fit: BoxFit.fill),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(t.translate("terms_and_conditions"), style: Theme.of(context).textTheme.titleLarge!.copyWith(height: 2)),
                const SizedBox(height: 16),
                BulletList(items: [
                  t.translate("Prebuy credit packages are non-refundable"),
                  t.translate("Credits from the prebuy packages are non-transferable and cannot be exchanged for cash. Credits do not expire."),
                  t.translate(
                      "Direct access to loyalty tiers through prebuy packages lasts for one year from the date of purchase. After one year, tier status will be determined by the regular criteria of the FLUUKY Loyalty Program."),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
