import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/app/config/route_constants.dart';
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
  final List<Item> _data = generateItems(5);

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      appBar: const AppBarSingleWidget(title: 'Green Subscription'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32),
                  Text('Fluuky Green Subscription', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 6),
                  Text(
                      'Conserving lands and waters is essential for maintaining biodiversity, providing habitat for endangered species, and fighting climate change.',
                      style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(height: 32),
                  Text(
                      "When you subscribe, we'll support your journey with Fluuky by matching your contributions to our planet. For every tree you plant, we'll plant one on your behalf too.",
                      style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: (MediaQuery.of(context).size.width - 40) / 3,
                        child: Column(
                          children: [
                            SvgPicture.asset('assets/images/foot.svg'),
                            const SizedBox(height: 16),
                            Text('Calculate Your Carbon Footprint', textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodySmall),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width - 40) / 3,
                        child: Column(
                          children: [
                            SvgPicture.asset('assets/images/navigator.svg'),
                            const SizedBox(height: 16),
                            Text('Discover your Compensation Needs', textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodySmall),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width - 40) / 3,
                        child: Column(
                          children: [
                            SvgPicture.asset('assets/images/globe.svg'),
                            const SizedBox(height: 16),
                            Text('Make a Tangible Difference', textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodySmall),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(onPressed: () {}, child: const Text('Subscribe')),
                  TextButton(onPressed: () => Get.toNamed(termsAndCondition), child: const Text('Terms & Conditions')),
                  const Divider(height: 48),
                  Text('Grow the Future', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 6),
                  Text(
                      'Get a Fluuky Green Subscription and get involved and help protect the places that protect us. Subscribe to make a difference and enter exclusive luxury draws for 12 months.',
                      style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(height: 24),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(color: Color(0xFFDBDBDB)),
                        BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
                      ],
                      color: Theme.of(context).primaryColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            SvgPicture.asset('assets/images/leaf.svg',
                                width: 24, colorFilter: ColorFilter.mode(FluukyTheme.primaryColor, BlendMode.srcIn)),
                            const SizedBox(width: 8),
                            Text('Carbon Calculator', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).primaryColor)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text('Calculate, analyse, and optimise your carbon footprint and take tangible steps towards a greener tomorrow. ',
                            style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(color: Color(0xFFDBDBDB)),
                        BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
                      ],
                      color: Theme.of(context).primaryColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            SvgPicture.asset('assets/images/tree-green.svg',
                                width: 24, colorFilter: ColorFilter.mode(FluukyTheme.primaryColor, BlendMode.srcIn)),
                            const SizedBox(width: 8),
                            Text('Carbon Compensation',
                                style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).primaryColor)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text('Plant trees to compensate your carbon footprint.', style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(color: Color(0xFFDBDBDB)),
                        BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
                      ],
                      color: Theme.of(context).primaryColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            SvgPicture.asset('assets/images/trees.svg',
                                width: 24, colorFilter: ColorFilter.mode(FluukyTheme.primaryColor, BlendMode.srcIn)),
                            const SizedBox(width: 8),
                            Text('Double the Impact', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).primaryColor)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text('Calculate, analyse, and optimise your carbon footprint and take tangible steps towards a greener tomorrow. ',
                            style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                  ),
                  const Divider(height: 48),
                  Text('Frequently Asked Questions', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 6),
                  Text('Find all the information you need to start your green journey with Fluuky. ',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: FluukyTheme.thirdColor,
                          )),
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
}
