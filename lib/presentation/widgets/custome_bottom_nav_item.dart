import 'package:flutter/material.dart';

class CustomBottomNavItem extends BottomNavigationBarItem {
  final bool isSelected;
  final Color selectedColor;
  final Color unselectedColor;
  final double selectedLineWidth;
  final VoidCallback onTap;

  CustomBottomNavItem({
    required String label,
    required Icon icon,
    required this.isSelected,
    required this.selectedColor,
    required this.unselectedColor,
    required this.selectedLineWidth,
    required this.onTap,
  }) : super(
          icon: Icon(icon.icon, color: isSelected ? selectedColor : unselectedColor),
          label: label,
        );

  Widget build(BuildContext context) {
    final defaultStyle = TextStyle(color: isSelected ? selectedColor : unselectedColor);

    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 4),
          Text(
            label!,
            style: isSelected ? defaultStyle.copyWith(fontWeight: FontWeight.bold) : defaultStyle,
          ),
          if (isSelected)
            Container(
              height: selectedLineWidth,
              width: 20, // Adjust the width as needed
              color: selectedColor,
            ),
        ],
      ),
    );
  }
}
