import 'package:flutter/material.dart';

import '../../../utils/theme/app_colors/basic_color.dart';
class CustomVerticalDivider extends StatelessWidget {
  final double width;
  final double height;
  final double boarderRadius;
  final Color color;
  const CustomVerticalDivider({
    this.width = 1.2,
    this.height = 60,
    this.color = whiteOnly,
    this.boarderRadius = 5,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(boarderRadius),
      ),
    );
  }
}
