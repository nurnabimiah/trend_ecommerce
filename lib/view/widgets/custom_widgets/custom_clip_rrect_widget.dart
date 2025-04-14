import 'package:flutter/material.dart';

class CustomClipRRectWidget extends StatelessWidget {
  final double height;
  final double width;
  final double borderRadius;
  final Widget child;
  final Function? onTap;

  const CustomClipRRectWidget({
    required this.child,
    this.height = 100,
    this.width = 100,
    this.borderRadius = 50,
    this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap != null ? ()=> onTap! : null,
      child: SizedBox(
        height: height,
        width: width,
        child: ClipRect(
          //borderRadius: BorderRadius.circular(borderRadius),
         // borderRadius: BorderRadius.,

          child: child,
        ),
      ),
    );
  }
}