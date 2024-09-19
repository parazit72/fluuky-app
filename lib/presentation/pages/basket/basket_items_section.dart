import 'package:flutter/material.dart';
import 'basket_item.dart';

class BasketItemsSection extends StatelessWidget {
  final List<dynamic> items; // Dynamically passed basket items

  const BasketItemsSection({required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.map((item) => BasketItemWidget(item: item)).toList(),
    );
  }
}
