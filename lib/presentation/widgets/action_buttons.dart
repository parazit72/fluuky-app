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
          child: Text('Buy Now'),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 50),
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ),
        SizedBox(height: 10),
        OutlinedButton(
          onPressed: () {
            // Handle Add to Wishlist
          },
          child: Text('Add to Wishlist'),
          style: OutlinedButton.styleFrom(
            foregroundColor: Theme.of(context).primaryColor,
            minimumSize: Size(double.infinity, 50),
          ),
        ),
      ],
    );
  }
}
