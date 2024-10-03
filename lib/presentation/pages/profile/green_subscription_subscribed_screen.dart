import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/subscription_controller.dart';
import 'package:fluuky/presentation/pages/profile/carbon_footprint_screen_dialog.dart';
import 'package:fluuky/presentation/pages/pages.dart';
import 'package:get/get.dart';
import 'package:fluuky/presentation/widgets/layout/app_bar_single.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';

class GreenSubscriptionSubscribedScreen extends StatefulWidget {
  const GreenSubscriptionSubscribedScreen({super.key});

  @override
  _GreenSubscriptionSubscribedScreenState createState() => _GreenSubscriptionSubscribedScreenState();
}

class _GreenSubscriptionSubscribedScreenState extends State<GreenSubscriptionSubscribedScreen> {
  final List<FaqItem> _data = generateItems(5);
  final SubscriptionController subscriptionController = Get.find<SubscriptionController>();

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
                  const SizedBox(height: 24),
                  _buildCreditsSection(t),
                  const Divider(height: 48),
                  _buildBenefitsSection(t),
                  const Divider(height: 48),
                  _buildManageSubscriptionSection(t),
                  _buildFAQSection(t),
                  const SizedBox(height: 24),
                ],
              ),
            ),
            _buildFAQItems(),
            const SizedBox(height: 24),
          ],
        ),
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
              const SizedBox(height: 4),
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
        const SizedBox(height: 6),
        Text(
          t.translate('Discover all the benefits of your FLUUKY subscription below.'),
          style: FluukyTheme.lightTheme.textTheme.displaySmall,
        ),
        const SizedBox(height: 24),
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
        const SizedBox(height: 24),
        buildCard(
          'assets/images/tree-green.svg',
          t.translate('carbon_compensation'),
          t.translate('carbon_compensation_message'),
        ),
        const SizedBox(height: 24),
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
        const SizedBox(height: 6),
        Text(
          t.translate('Manage all your essential information.'),
          style: FluukyTheme.lightTheme.textTheme.bodySmall,
        ),
        const SizedBox(height: 16),
        _buildSubscriptionOptions(t),
        TextButton(
          style: const ButtonStyle(
            minimumSize: WidgetStatePropertyAll(Size(0, 0)),
            padding: WidgetStatePropertyAll(EdgeInsets.all(0)),
          ),
          onPressed: () => Get.toNamed(receiptScreen),
          child: const Text('View Your Receipt'),
        ),
        const SizedBox(height: 24),
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
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(text, style: FluukyTheme.lightTheme.textTheme.displaySmall)),
          const SizedBox(width: 8),
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

  Widget _buildFAQSection(AppLocalizations t) {
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
    return Column(
      children: _data.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        final bool belowItemExpanded = (index < _data.length - 1) ? _data[index + 1].isExpanded : false;

        return CustomFAQTile(
          item: item,
          onTap: () {
            setState(() {
              for (var otherItem in _data) {
                if (otherItem != item) {
                  otherItem.isExpanded = false;
                }
              }
              item.isExpanded = !item.isExpanded;
            });
          },
          isLastItem: index == _data.length - 1,
          belowItemExpanded: belowItemExpanded,
        );
      }).toList(),
    );
  }

  Widget buildCard(String svgAsset, String titleKey, String messageKey) {
    return Container(
      width: double.infinity,
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
        mainAxisSize: MainAxisSize.min,
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
                style: FluukyTheme.lightTheme.textTheme.titleLarge!.copyWith(color: Theme.of(context).primaryColor),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            messageKey,
            style: FluukyTheme.lightTheme.textTheme.displaySmall,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
