import 'package:flutter/material.dart';
import '../../../../../utils/theme/app_colors/basic_color.dart';


class CustomContainerWidgetForOptScreen extends StatelessWidget {
  final Widget child;
  final Color color;
  final Color boarderColor;
  final double boarderWidth;

  const CustomContainerWidgetForOptScreen({
    required this.child,
    this.color = Colors.white,
    this.boarderColor = grey400,
    this.boarderWidth = 0.5,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: boarderColor, width: boarderWidth),
        ),
        child: Center(
          //padding: const EdgeInsets.only(bottom: 0),
          child: child,
        )
    );
  }
}
