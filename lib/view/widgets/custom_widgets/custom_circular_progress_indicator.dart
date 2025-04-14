import 'package:flutter/material.dart';

import '../../../utils/theme/app_colors/basic_color.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  final Color? color;
  const CustomCircularProgressIndicator({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color ?? whiteOnly,
        strokeWidth: 2,
      ),
    );
  }
}
