import 'package:flutter/material.dart';

class InwardArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    // Start from the top-left corner
    path.moveTo(0, 0);
    // Draw a line to the top-right corner
    path.lineTo(size.width, 0);
    // Draw a line to the inward arrow point (from the top-right corner)
    path.lineTo(size.width  * 0.75, size.height / 2); // Adjust '40' for arrow depth
    // Draw a line to the bottom-right corner
    path.lineTo(size.width, size.height);
    // Draw a line to the bottom-left corner
    path.lineTo(0, size.height);
    // Close the path
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // Reclip if the old clipper changes
    return false;
  }
}