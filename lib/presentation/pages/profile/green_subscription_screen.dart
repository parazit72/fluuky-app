import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/data/models/faq_model.dart';
import 'package:fluuky/data/repositories/home_repository_impl.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/home_controller.dart';
import 'package:fluuky/presentation/pages/profile/carbon_footprint_screen_dialog.dart';
import 'package:fluuky/presentation/pages/pages.dart';
import 'package:fluuky/presentation/widgets/faq_widget.dart';
import 'package:get/get.dart';
import 'package:fluuky/presentation/widgets/layout/app_bar_single.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';

class GreenSubscriptionScreen extends StatefulWidget {
  const GreenSubscriptionScreen({super.key});

  @override
  _GreenSubscriptionScreenState createState() => _GreenSubscriptionScreenState();
}

class _GreenSubscriptionScreenState extends State<GreenSubscriptionScreen> {
  final HomeController faqController = Get.find();

  @override
  Widget build(BuildContext context) {
    FluukyTheme.updateFontFamilyBasedOnLocale();
    var t = AppLocalizations.of(context)!;
    return BackgroundScaffold(
      appBar: AppBarSingleWidget(title: t.translate('Green Subscription')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                        textStyle: WidgetStateProperty.all(
                            TextStyle(fontSize: 14.w, fontWeight: FontWeight.w600, height: 1.5, fontFamily: FluukyTheme.fontFamily))),
                    onPressed: () => Get.toNamed(subscribingProcessScreen),
                    child: Text(t.translate('Subscribe')),
                  ),
                  TextButton(
                      style: ButtonStyle(
                          textStyle: WidgetStateProperty.all(
                              TextStyle(fontSize: 14.w, fontWeight: FontWeight.w600, height: 1.5, fontFamily: FluukyTheme.fontFamily))),
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
            Obx(
              () {
                if (faqController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (faqController.faqs.isEmpty) {
                  return Center(
                      child: Container(
                    padding: EdgeInsets.all(10.w),
                    width: 375.w,
                    height: 150.h,
                    color: FluukyTheme.primaryColor,
                  ));
                }

                // Constrain ListView.builder inside Expanded
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(), // Prevents ListView from scrolling independently
                  itemCount: faqController.faqs.length,
                  itemBuilder: (context, index) {
                    final bool belowItemExpanded = (index < faqController.faqs.length - 1) ? faqController.faqs[index + 1].isExpanded : false;
                    final faq = faqController.faqs[index];
                    return CustomFAQTile(
                      item: faq,
                      onTap: () {
                        for (var otherItem in faqController.faqs) {
                          if (otherItem != faq) {
                            otherItem.isExpanded = false;
                          }
                        }
                        faq.isExpanded = !faq.isExpanded;
                        faqController.faqs.refresh(); // Refresh to update UI
                      },
                      isLastItem: index == faqController.faqs.length - 1,
                      belowItemExpanded: belowItemExpanded,
                    );
                  },
                );
              },
            ),
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
