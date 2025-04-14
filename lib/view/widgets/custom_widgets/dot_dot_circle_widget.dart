import 'package:flutter/material.dart';
import 'dart:math';
import '../../../utils/theme/app_colors/basic_color.dart';

class DottedCircleWidget extends StatelessWidget {
  final double size; // Diameter of the circle
  final int dotCount; // Number of dots around the circle
  final double dotSize; // Diameter of each dot
  final Color dotColor;
  final Color? bgColor;
  final Widget? child;

  const DottedCircleWidget({
    super.key,
    this.size = 25,
    this.dotCount = 10,
    this.dotSize = 2.0,
    this.bgColor,
    this.dotColor = labelColorSmall,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
     // color: Colors.red,
      decoration: BoxDecoration(
          color: bgColor,
        shape: BoxShape.circle
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (child != null) child!,
          for (int i = 0; i < dotCount; i++)
            Transform.translate(
              offset: Offset(
                (size / 2 - dotSize) * cos(2 * pi * i / dotCount),
                (size / 2 - dotSize) * sin(2 * pi * i / dotCount),
              ),
              child: Container(
                width: dotSize,
                height: dotSize,
                decoration: BoxDecoration(
                  color: dotColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
