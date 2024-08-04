import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            // Handle Buy Now
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          child: const Text('Buy Now'),
        ),
        const SizedBox(height: 10),
        OutlinedButton(
          onPressed: () {
            // Handle Add to Wishlist
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: Theme.of(context).primaryColor,
            minimumSize: const Size(double.infinity, 50),
          ),
          child: const Text('Add to Wishlist'),
        ),
      ],
    );
  }
}
