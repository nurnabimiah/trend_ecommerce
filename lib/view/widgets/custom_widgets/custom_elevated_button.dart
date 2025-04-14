import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/style/app_style.dart';
import '../../../utils/theme/app_colors/all_colors_export.dart';

class CustomElevatedButton extends StatelessWidget {
  final int themeIndex;
  final double buttonHeight;
  final double buttonWidth;
  final double horizontalPadding;
  final double textFontSize;
  final Color? textColor;
  final double boarderRadius;
  final double boarderWidth;
  final Color boarderColor;
  final Color? backgroundColor;
  final dynamic textWidget;
  final VoidCallback? onPressed;

  const CustomElevatedButton({
    super.key,
    required this.themeIndex,
    this.buttonHeight = 47,
    this.buttonWidth = 80,
    this.horizontalPadding = 0,
    this.textFontSize = 15,
    this.textColor,
    this.boarderRadius = 10,
    this.boarderWidth = 0.5,
    this.boarderColor = Colors.white,
    this.textWidget,
    this.onPressed,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight.h,
      child: ElevatedButton(
        onPressed:  onPressed != null ? () => onPressed!() : null,
        style: ElevatedButton.styleFrom(
          padding:  EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 0),
          minimumSize: Size(buttonWidth.w, 20.h),
          elevation: 0,
          fixedSize: Size.fromHeight(buttonHeight.h),
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(boarderRadius.sp),
          ),
          side: BorderSide(
            width: boarderWidth,
            color: boarderColor,
          ),
        ),
        child: textWidget is String
            ? Text(textWidget, overflow: TextOverflow.ellipsis, style: myTxt16(color: whiteOnly))
            : textWidget,
      ),
    );
  }
}
