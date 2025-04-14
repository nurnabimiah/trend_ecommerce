import 'package:flutter/material.dart';
import '../../../utils/global/classes/gradient_boxdecoration.dart';

class CustomGradientContainer extends StatelessWidget {
  final Widget child;
  final double height;
  const CustomGradientContainer({
    required this.child,
    this.height  = double.infinity,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: GradientBoxDecoration.gradientBoxDecoration(borderRadius: 0,),
      child: child,
    );
  }
}
