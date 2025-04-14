import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final dynamic textWidget;
  final Function? onPressed;
  final Icon? icon;
  final double? textFontSize;
  final Color? textColor;
  final double boarderWidth;
  final Color? boarderColor;
  final BoxShape boxShape;
  final Color? backgroundColor;
  final double borderRadius;
  final double buttonHeight;
  final double buttonWidth;
  final MainAxisAlignment myMainAxisAlignment;
  final bool isBoarder;

  const CustomTextButton({
    this.textWidget = "",
    this.onPressed,
    this.icon,
    this.textFontSize = 14.0,
    this.textColor,
    this.boxShape = BoxShape.rectangle,
    this.myMainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.backgroundColor,
    this.borderRadius = 5,
    this.buttonHeight  = 32,
    this.buttonWidth = 60,
    this.isBoarder = false,
    this.boarderColor,
    this.boarderWidth = 0.5,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed:  onPressed != null ? () => onPressed!() : null,
      style: TextButton.styleFrom(
        minimumSize: const Size(80, 20),
        fixedSize: Size.fromHeight(buttonHeight),
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
        //visualDensity: VisualDensity.compact, // Reduces extra spacing inside the button
        visualDensity: VisualDensity(vertical: -4, horizontal: -4),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          side: boarderColor != null ? BorderSide(color: boarderColor!, width: boarderWidth) : BorderSide.none,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: textWidget is String  ?  Padding(
        padding: const EdgeInsets.only(left: 5.0, right: 5),
        child: Text(textWidget,  maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: textFontSize!,  color: textColor),),
      ) : textWidget,
    );
  }
}
