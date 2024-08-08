import 'package:flutter/material.dart';

class TicketShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double cutoutRadius = 20.0; // Adjust the cutout size as needed

    Path path = Path();
    path.moveTo(cutoutRadius, 0);
    path.lineTo(size.width - 2 * cutoutRadius, 0);

    path.arcToPoint(
      Offset(size.width, size.height),
      radius: Radius.circular(cutoutRadius),
      clockwise: true,
    );

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    // path.arcToPoint(
    //   Offset(size.width, cutoutRadius),
    //   radius: Radius.circular(cutoutRadius),
    //   clockwise: true,
    // );
    path.lineTo(size.width, size.height - cutoutRadius);
    path.arcToPoint(
      Offset(size.width, size.height),
      radius: Radius.circular(cutoutRadius),
      clockwise: true,
    );
    path.lineTo(0, size.height);
    path.arcToPoint(
      Offset(0, size.height - cutoutRadius),
      radius: Radius.circular(cutoutRadius),
      clockwise: true,
    );
    path.lineTo(0, cutoutRadius);
    path.arcToPoint(
      Offset(0, 0),
      radius: Radius.circular(cutoutRadius),
      clockwise: true,
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
