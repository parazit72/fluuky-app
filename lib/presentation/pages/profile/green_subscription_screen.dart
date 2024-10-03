import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      appBar: AppBarSingleWidget(title: t.translate('Green Subscription')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 32.h),
                  Text(t.translate('fluuky_green_subscription'), style: FluukyTheme.lightTheme.textTheme.titleLarge),
                  SizedBox(height: 4.h),
                  Text(t.translate('conserving_lands'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildColumnCard('assets/images/foot.svg', t.translate('calculate_carbon_footprint'), 90.w),
                      buildColumnCard('assets/images/navigator.svg', t.translate('discover_compensation_needs'), 112.w),
                      buildColumnCard('assets/images/globe.svg', t.translate('make_a_difference'), 90.w),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  ElevatedButton(
                    style: ButtonStyle(
                        minimumSize: WidgetStatePropertyAll(Size(335.w, 48.h)),
                        textStyle: WidgetStateProperty.all(TextStyle(fontSize: 14.w, fontWeight: FontWeight.w600, height: 1.5))),
                    onPressed: () => Get.toNamed(subscribingProcessScreen),
                    child: Text(t.translate('Subscribe')),
                  ),
                  TextButton(
                      style: ButtonStyle(textStyle: WidgetStateProperty.all(TextStyle(fontSize: 16.w, fontWeight: FontWeight.w600, height: 1.5))),
                      onPressed: () => Get.toNamed(termsAndCondition),
                      child: Text(t.translate('terms_and_conditions'))),
                  Divider(height: 48.h),
                  Text(t.translate('Grow the Future'), style: FluukyTheme.lightTheme.textTheme.titleLarge),
                  SizedBox(height: 4.h),
                  Text(t.translate('fluuky_green_message'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
                  SizedBox(height: 24.h),
                  InkWell(
                      onTap: () => showDialog(
                            context: context,
                            builder: (BuildContext context) => const CarbonFootprintScreen(imagePath: 'assets/images/carbon-footprint.svg'),
                          ),
                      child: buildCard('assets/images/leaf.svg', t.translate('carbon_calculator'), t.translate('carbon_calculator_message'))),
                  SizedBox(height: 24.h),
                  buildCard('assets/images/tree-green.svg', t.translate('carbon_compensation'), t.translate('carbon_compensation_message')),
                  SizedBox(height: 24.h),
                  buildCard('assets/images/trees.svg', t.translate('double_the_impact'), t.translate('double_the_impact_message')),
                  Divider(height: 48.h),
                  Text(t.translate('Frequently Asked Questions'), style: FluukyTheme.lightTheme.textTheme.titleLarge),
                  SizedBox(height: 6.h),
                  Text(t.translate('find_all_the_information_you_need'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
                ],
              ),
            ),
            SizedBox(height: 24.h),
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
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  Widget buildColumnCard(String svgAsset, String textKey, double width) {
    return SizedBox(
      width: width.w,
      child: Column(
        children: [
          SvgPicture.asset(svgAsset, width: 48.w),
          SizedBox(height: 16.h),
          Text(
            textKey,
            textAlign: TextAlign.center,
            style: FluukyTheme.lightTheme.textTheme.labelSmall,
          ),
        ],
      ),
    );
  }

  Widget buildCard(String svgAsset, String titleKey, String messageKey) {
    return Container(
      width: 335.w,
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: FluukyTheme.secondaryColor),
          const BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
        ],
        color: FluukyTheme.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16.w),
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
                width: 24.w,
                colorFilter: ColorFilter.mode(FluukyTheme.primaryColor, BlendMode.srcIn),
              ),
              SizedBox(width: 8.w),
              Text(
                titleKey,
                style: FluukyTheme.lightTheme.textTheme.titleLarge!.copyWith(color: FluukyTheme.primaryColor),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            messageKey,
            style: FluukyTheme.lightTheme.textTheme.labelMedium,
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
