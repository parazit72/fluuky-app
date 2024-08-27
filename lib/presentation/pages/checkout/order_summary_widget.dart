import 'package:flutter/material.dart';

class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExpandableSection(
            title: 'Order Summary',
            collapsedContent: _buildCollapsedOrderSummary(context),
            expandedContent: _buildExpandedOrderSummary(context),
          ),
          const SizedBox(height: 20),
          const ExpandableSection(
            title: 'Billing Address',
            collapsedContent: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('John Doe / UAE / Dubai / 456 Oak Lane / Suite 789, Riverside Apartments / North Shire / 54321 '),
            ),
            expandedContent: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Please enter your phone number and email address.'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(height: 20),
          ),
          ExpandableSection(
            title: 'Payment Method',
            collapsedContent: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('assets/credit-cards/mastercard.png', width: 30, height: 30),
                  const SizedBox(width: 24),
                  Image.asset('assets/credit-cards/amex.png', width: 30, height: 30),
                  const SizedBox(width: 24),
                  Image.asset('assets/credit-cards/elo.png', width: 30, height: 30)
                ],
              ),
            ),
            expandedContent: const Text('You’re seconds away from making a positive impact! Please enter your card details below.'),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(height: 20),
          ),
          const ExpandableSection(
            title: 'Promocode',
            collapsedContent: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('AB-C1-S312'),
            ),
            expandedContent: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Have a promo code? '),
            ),
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
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Item Title',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.confirmation_number, size: 16),
                          SizedBox(width: 4),
                          Text('Tickets: 3'),
                          SizedBox(width: 16),
                          Icon(Icons.eco, size: 16),
                          SizedBox(width: 4),
                          Text('Trees: 5'),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        '\$50',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
                style: Theme.of(context).textTheme.titleLarge,
              ),
              IconButton(
                iconSize: 24,
                padding: EdgeInsets.zero,
                icon: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        _isExpanded ? widget.expandedContent : widget.collapsedContent,
      ],
    );
  }
}
