import 'package:flutter/material.dart';

class BulletList extends StatelessWidget {
  final List<String> items;

  const BulletList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 6.0), // Align bullet with text
                    child: Icon(
                      Icons.circle,
                      size: 2,
                      color: Colors.black, // Set the color of the bullet
                    ),
                  ),
                  const SizedBox(width: 8), // Space between bullet and text
                  Expanded(
                    child: Text(
                      item,
                      style: Theme.of(context).textTheme.bodySmall, // Customize text style as needed
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
