import 'package:flutter/material.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/pages/checkout/draggable_checkout_sheet.dart';
import 'package:fluuky/presentation/pages/checkout/order_summary_widget.dart';
import 'package:fluuky/presentation/widgets/layout/app_bar_single.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool userIsSubscribed = true;
  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return BackgroundScaffold(
      appBar: AppBarSingleWidget(title: t.translate('checkout')),
      // bottomNavigationBar: CustomNavBar(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const OrderSummaryWidget(),
                // const PaymentMethodWidget(),
                // const PromocodeWidget(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.35)
              ],
            ),
          ),
          const DraggableCheckoutSheet(),
        ],
      ),
    );
  }
}

class BasketTextHeaderWidget extends StatelessWidget {
  const BasketTextHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(t.translate('cart'), style: Theme.of(context).textTheme.titleLarge),
          Text(t.translate('explore_items_in_cart'), style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 24),
          const Divider(),
        ],
      ),
    );
  }
}
