import 'package:flutter/material.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:to_arabic_number/to_arabic_number.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';

class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExpandableSection(
            title: t.translate('order_summary'),
            collapsedContent: _buildCollapsedOrderSummary(context),
            expandedContent: _buildExpandedOrderSummary(context),
          ),
          const SizedBox(height: 20),
          ExpandableSection(
            title: t.translate('billingAddress'),
            collapsedContent: const Text('John Doe / UAE / Dubai / 456 Oak Lane / Suite 789, Riverside Apartments / North Shire / 54321 '),
            expandedContent: Text(t.translate('Please_enter_phone_email_address')),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(height: 20),
          ),
          ExpandableSection(
            title: t.translate('payment_method'),
            collapsedContent: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/credit-cards/mastercard.png', width: 30, height: 30),
                const SizedBox(width: 24),
                Image.asset('assets/credit-cards/amex.png', width: 30, height: 30),
                const SizedBox(width: 24),
                Image.asset('assets/credit-cards/elo.png', width: 30, height: 30)
              ],
            ),
            expandedContent: Text(t.translate('You_seconds_away_positive_impact_card_details_below')),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(height: 20),
          ),
          ExpandableSection(
            title: t.translate('promo_code'),
            collapsedContent: const Text('AB-C1-S312'),
            expandedContent: Text(t.translate('have_promo_code')),
          ),
        ],
      ),
    );
  }

  Widget _buildCollapsedOrderSummary(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var i = 0; i < 3; i++)
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/jungle-1.jpg',
                  width: MediaQuery.of(context).size.width / 4,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildExpandedOrderSummary(BuildContext context) {
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
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: List.generate(3, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/jungle-1.jpg',
                    width: MediaQuery.of(context).size.width / 3,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Item Title',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.confirmation_number, size: 16),
                          const SizedBox(width: 4),
                          Text(t.translate('ticketsRemaining')),
                          const SizedBox(width: 16),
                          const Icon(Icons.eco, size: 16),
                          const SizedBox(width: 4),
                          Text(formatNumber('${t.translate('trees:')} 5')),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        formatNumber('\$50'),
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class ExpandableSection extends StatefulWidget {
  final String title;
  final Widget collapsedContent;
  final Widget expandedContent;

  const ExpandableSection({
    super.key,
    required this.title,
    required this.collapsedContent,
    required this.expandedContent,
  });

  @override
  _ExpandableSectionState createState() => _ExpandableSectionState();
}

class _ExpandableSectionState extends State<ExpandableSection> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: FluukyTheme.lightTheme.textTheme.titleLarge,
              ),
              IconButton(
                iconSize: 24,
                padding: EdgeInsets.zero,
                icon: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
                onPressed: () {
                  setState(() => _isExpanded = !_isExpanded);
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: _isExpanded ? widget.expandedContent : widget.collapsedContent,
        ),
      ],
    );
  }
}
