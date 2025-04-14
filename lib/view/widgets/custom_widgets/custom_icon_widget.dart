import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconWidget extends StatelessWidget {
  final dynamic child;
  final double size;
  final Color color;
  final double? height;
  final double? width;
  final double? scale;
  final bool? isSvgString;

  const CustomIconWidget({
    required this.child,
    this.size = 15,
    this.color = Colors.black,
    this.height,
    this.width,
    this.scale,
    this.isSvgString = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return child is IconData ? Icon(
      child,
      size: size,
      color: color,
    ) : child is String && isSvgString == false ? Image.asset(child, height: height, width: width, color: color, scale: scale,)
        :  SvgPicture.asset(child, height: height, width: width, colorFilter: ColorFilter.mode(
      color,
      BlendMode.srcIn, // A blending mode that works well for coloring SVGs
    ),);
  }
}