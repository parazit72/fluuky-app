import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';

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
              padding: EdgeInsets.only(bottom: 16.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 6.h), // Align bullet with text
                    child: const Icon(
                      Icons.circle,
                      size: 2,
                      color: Colors.black, // Set the color of the bullet
                    ),
                  ),
                  SizedBox(width: 8.w), // Space between bullet and text
                  Expanded(
                    child: Text(
                      item,
                      style: FluukyTheme.lightTheme.textTheme.bodySmall, // Customize text style as needed
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
