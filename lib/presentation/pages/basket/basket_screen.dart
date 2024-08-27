import 'package:flutter/material.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/presentation/pages/basket/basket_items_section.dart';
import 'package:fluuky/presentation/pages/basket/draggable_basket_sheet.dart';
import 'package:fluuky/presentation/pages/basket/interest_you_section.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  bool userIsSubscribed = true;
  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      appBar: const AppBarFluuky(),
      // bottomNavigationBar: CustomNavBar(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const BasketTextHeaderWidget(),
                const BasketItemsSection(),
                const InterestYouSection(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.35)
              ],
            ),
          ),
          const DraggableBasketSheet(),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Cart', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 4),
          Text('Explore items in your cart and browse draws you may be interested in.',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(color: FluukyTheme.thirdColor)),
          const SizedBox(height: 24),
          const Divider(),
        ],
      ),
    );
  }
}
