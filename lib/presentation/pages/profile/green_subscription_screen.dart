import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/pages/profile/carbon_footprint_screen_dialog.dart';
import 'package:fluuky/presentation/pages/pages.dart';
import 'package:get/get.dart';
import 'package:fluuky/presentation/widgets/layout/app_bar_single.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';

class GreenSubscriptionScreen extends StatefulWidget {
  const GreenSubscriptionScreen({super.key});

  @override
  _GreenSubscriptionScreenState createState() => _GreenSubscriptionScreenState();
}

class _GreenSubscriptionScreenState extends State<GreenSubscriptionScreen> {
  final List<FaqItem> _data = generateItems(5);

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return BackgroundScaffold(
      appBar: AppBarSingleWidget(title: t.translate('green_subscription')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32),
                  Text(t.translate('fluuky_green_subscription'), style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 6),
                  Text(t.translate('conserving_lands'), style: Theme.of(context).textTheme.bodySmall!.copyWith(color: FluukyTheme.thirdColor)),
                  const SizedBox(height: 32),
                  Text(t.translate("when_you_subscribe_we_support_your_journey"), style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildColumnCard('assets/images/foot.svg', t.translate('calculate_carbon_footprint')),
                      buildColumnCard('assets/images/navigator.svg', t.translate('discover_compensation_needs')),
                      buildColumnCard('assets/images/globe.svg', t.translate('make_a_difference')),
                    ],
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(onPressed: () => Get.toNamed(subscribingProcessScreen), child: Text(t.translate('Subscribe'))),
                  TextButton(onPressed: () => Get.toNamed(termsAndCondition), child: Text(t.translate('terms_and_conditions'))),
                  const Divider(height: 48),
                  Text(t.translate('grow_the_future'), style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 6),
                  Text(t.translate('fluuky_green_message'), style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(height: 24),
                  InkWell(
                      onTap: () => showDialog(
                            context: context,
                            builder: (BuildContext context) => const CarbonFootprintScreen(imagePath: 'assets/images/carbon-footprint.svg'),
                          ),
                      child: buildCard('assets/images/leaf.svg', t.translate('carbon_calculator'), t.translate('carbon_calculator_message'))),
                  const SizedBox(height: 24),
                  buildCard('assets/images/tree-green.svg', t.translate('carbon_compensation'), t.translate('carbon_compensation_message')),
                  const SizedBox(height: 24),
                  buildCard('assets/images/trees.svg', t.translate('double_the_impact'), t.translate('double_the_impact_message')),
                  const Divider(height: 48),
                  Text(t.translate('faq'), style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 6),
                  Text(t.translate('find_all_the_information_you_need'),
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(color: FluukyTheme.thirdColor)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            ..._data.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;

              // Check if the next item is expanded
              final bool belowItemExpanded = (index < _data.length - 1) ? _data[index + 1].isExpanded : false;

              return CustomFAQTile(
                item: item,
                onTap: () {
                  setState(() {
                    // Collapse all other items
                    for (var otherItem in _data) {
                      if (otherItem != item) {
                        otherItem.isExpanded = false;
                      }
                    }
                    // Toggle the selected item
                    item.isExpanded = !item.isExpanded;
                  });
                },
                isLastItem: index == _data.length - 1,
                belowItemExpanded: belowItemExpanded, // Pass the below item expanded state
              );
            }),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget buildColumnCard(String svgAsset, String textKey) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 40) / 3,
      child: Column(
        children: [
          SvgPicture.asset(svgAsset),
          const SizedBox(height: 16),
          Text(
            textKey,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Widget buildCard(String svgAsset, String titleKey, String messageKey) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(color: Color(0xFFDBDBDB)),
          BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
        ],
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // This will make the column take the minimum height needed
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              SvgPicture.asset(
                svgAsset,
                width: 24,
                colorFilter: ColorFilter.mode(FluukyTheme.primaryColor, BlendMode.srcIn),
              ),
              const SizedBox(width: 8),
              Text(
                titleKey,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).primaryColor),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            messageKey,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
