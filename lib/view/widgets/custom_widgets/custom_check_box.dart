import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCheckBox extends StatelessWidget {
  final int themeIndex;
  final bool value;
  final Function? onChanged;
  final Color? activeColor;
  final Color? checkColor;
  final Color borderColor;
  const CustomCheckBox({
    this.themeIndex = 0,
    this.value = false,
    required this.onChanged,
    this.activeColor,
    this.borderColor = Colors.black,
    this.checkColor,
    super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: Checkbox(
        activeColor: activeColor,
        checkColor: checkColor,
        //splashRadius: 0,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.0),
        ),
        side: BorderSide(
          width: 1.2,
          color: borderColor,
        ),
        value: value,
        onChanged:  onChanged != null ? (bool? flag) => onChanged!(flag) : null,
      ),
    );
  }
}
