import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/data/models/faq_model.dart';
import 'package:fluuky/data/repositories/home_repository_impl.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/home_controller.dart';
import 'package:fluuky/presentation/controllers/subscription_controller.dart';
import 'package:fluuky/presentation/pages/profile/carbon_footprint_screen_dialog.dart';
import 'package:fluuky/presentation/pages/pages.dart';
import 'package:fluuky/presentation/widgets/faq_widget.dart';
import 'package:get/get.dart';
import 'package:fluuky/presentation/widgets/layout/app_bar_single.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';

class GreenSubscriptionSubscribedScreen extends StatefulWidget {
  const GreenSubscriptionSubscribedScreen({super.key});

  @override
  _GreenSubscriptionSubscribedScreenState createState() => _GreenSubscriptionSubscribedScreenState();
}

class _GreenSubscriptionSubscribedScreenState extends State<GreenSubscriptionSubscribedScreen> {
  final SubscriptionController subscriptionController = Get.find<SubscriptionController>();
  final HomeController faqController = Get.find();

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return BackgroundScaffold(
      appBar: AppBarSingleWidget(title: t.translate('Green Subscription')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.h),
                _buildCreditsSection(t),
                Divider(height: 48.h),
                _buildBenefitsSection(t),
                Divider(height: 48.h),
                _buildManageSubscriptionSection(t),
                _buildFAQTitle(t),
                SizedBox(height: 24.h),
              ],
            ),
          ),
          _buildFAQItems(),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }

  Widget _buildCreditsSection(AppLocalizations t) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(t.translate('Credits: 5,000'), style: FluukyTheme.lightTheme.textTheme.titleLarge),
              SizedBox(height: 4.h),
              Text(t.translate('Expires at May 26, 2024'), style: FluukyTheme.lightTheme.textTheme.displaySmall),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBenefitsSection(AppLocalizations t) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(t.translate('Green Benefits'), style: FluukyTheme.lightTheme.textTheme.titleLarge),
        SizedBox(height: 6.h),
        Text(
          t.translate('Discover all the benefits of your FLUUKY subscription below.'),
          style: FluukyTheme.lightTheme.textTheme.displaySmall,
        ),
        SizedBox(height: 24.h),
        InkWell(
          onTap: () => showDialog(
            context: context,
            builder: (BuildContext context) => const CarbonFootprintScreen(imagePath: 'assets/images/carbon-footprint.svg'),
          ),
          child: buildCard(
            'assets/images/leaf.svg',
            t.translate('carbon_calculator'),
            t.translate('carbon_calculator_message'),
          ),
        ),
        SizedBox(height: 24.h),
        buildCard(
          'assets/images/tree-green.svg',
          t.translate('carbon_compensation'),
          t.translate('carbon_compensation_message'),
        ),
        SizedBox(height: 24.h),
        buildCard(
          'assets/images/trees.svg',
          t.translate('double_the_impact'),
          t.translate('double_the_impact_message'),
        ),
      ],
    );
  }

  Widget _buildManageSubscriptionSection(AppLocalizations t) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(t.translate('Manage Subscription'), style: FluukyTheme.lightTheme.textTheme.titleLarge),
        SizedBox(height: 6.h),
        Text(
          t.translate('Manage all your essential information.'),
          style: FluukyTheme.lightTheme.textTheme.bodySmall,
        ),
        SizedBox(height: 16.h),
        _buildSubscriptionOptions(t),
        TextButton(
          style: const ButtonStyle(
            minimumSize: WidgetStatePropertyAll(Size(0, 0)),
            padding: WidgetStatePropertyAll(EdgeInsets.all(0)),
          ),
          onPressed: () => Get.toNamed(receiptScreen),
          child: const Text('View Your Receipt'),
        ),
        SizedBox(height: 24.h),
      ],
    );
  }

  Widget _buildSubscriptionOptions(AppLocalizations t) {
    return Column(
      children: [
        _buildSubscriptionOptionRow(
          t.translate('Next billing date: May 26, 2024'),
          'Deactivate',
          () {
            // Add action for deactivate
          },
        ),
        _buildSubscriptionOptionRow(
          t.translate('Billed with Visa •••• 8275'),
          'Edit',
          () {
            // Add action for edit
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                t.translate('Automatic Subscription Renewal'),
                style: FluukyTheme.lightTheme.textTheme.displaySmall,
              ),
            ),
            Obx(
              () => Switch(
                value: subscriptionController.isAutomaticRenewal.value,
                onChanged: (value) {
                  subscriptionController.isAutomaticRenewal(value);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSubscriptionOptionRow(String text, String buttonText, VoidCallback onPressed) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(text, style: FluukyTheme.lightTheme.textTheme.displaySmall)),
          SizedBox(width: 8.w),
          TextButton(
            style: ButtonStyle(
              padding: WidgetStateProperty.all(const EdgeInsets.all(0)),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              minimumSize: WidgetStateProperty.all(const Size(0, 0)),
            ),
            onPressed: onPressed,
            child: Text(buttonText),
          ),
        ],
      ),
    );
  }

  Widget _buildFAQTitle(AppLocalizations t) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(t.translate('Frequently Asked Questions'), style: FluukyTheme.lightTheme.textTheme.titleLarge),
        const SizedBox(height: 6),
        Text(
          t.translate('find_all_the_information_you_need'),
          style: FluukyTheme.lightTheme.textTheme.bodySmall,
        ),
      ],
    );
  }

  Widget _buildFAQItems() {
    return Obx(
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
    );
  }

  Widget buildCard(String svgAsset, String titleKey, String messageKey) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(color: Color(0xFFDBDBDB)),
          BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
        ],
        color: FluukyTheme.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
                style: FluukyTheme.lightTheme.textTheme.titleLarge!.copyWith(color: Theme.of(context).primaryColor),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            messageKey,
            style: FluukyTheme.lightTheme.textTheme.displaySmall,
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
