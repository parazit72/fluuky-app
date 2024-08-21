import 'package:flutter/material.dart';
import 'basket_item.dart';

class BasketItemsSection extends StatelessWidget {
  const BasketItemsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(5, (index) => const BasketItem()),
    );
  }
}
