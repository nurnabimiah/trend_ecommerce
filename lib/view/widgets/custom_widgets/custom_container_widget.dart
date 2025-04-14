import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainerWidget extends StatelessWidget {
  final dynamic child;
  final double? height;
  final double? width;
  final Color backGroundColor;
  final Color boarderColor;
  final Color shadColor;
  final bool isOnlyPadding;
  final bool isOnlyMargin;
  final bool isSymmetricPadding;
  final bool isSymmetricMargin;
  final bool isAllBoarder;
  final bool isOnlyBoarder;
  final bool isTopBoarder;
  final bool isBottomBoarder;
  final bool isLeftBoarder;
  final bool isRightBoarder;
  final bool isOnlyBorderRadius;
  final double boarderWidth;
  final double offsetDx;
  final double offsetDy;
  final double spreadRadius;
  final double blurRadius;
  final double horizontalPadding;
  final double verticalPadding;
  final double leftPadding;
  final double rightPadding;
  final double topPadding;
  final double bottomPadding;
  final double horizontalMargin;
  final double verticalMargin;
  final double leftMargin;
  final double rightMargin;
  final double topMargin;
  final double bottomMargin;
  final double topLeftBorderRadius;
  final double topRightBorderRadius;
  final double bottomLeftBorderRadius;
  final double bottomRightBorderRadius;
  final Color? topBoarderColor;
  final Color? bottomBoarderColor;
  final Color? leftBoarderColor;
  final Color? rightBoarderColor;
  final Color? boxShadowColor;
  final double backGroundColorOpacity;
  final double boarderColorOpacity;
  final double shadowColorOpacity;
  final double boarderRadius;
  final BoxShape shape;
  final double padding;
  final double margin;
  final bool isBoxShadow ;
  final bool isAllBoarderRadius ;
  final DecorationImage? image ;
  final List<Color> gradientColorList;
  final Alignment alignment;

  const CustomContainerWidget({
    super.key,
    this.child,
    this.height,
    this.width,
    this.backGroundColor = Colors.white,
    this.boarderColor = Colors.white,
    this.shadColor = Colors.black,
    this.isSymmetricPadding = false,
    this.isSymmetricMargin = false,
    this.isOnlyPadding = false,
    this.isOnlyMargin = false,
    this.isAllBoarder = false,
    this.isOnlyBoarder = false,
    this.isTopBoarder = false,
    this.isBottomBoarder = false,
    this.isLeftBoarder = false,
    this.isRightBoarder = false,
    this.isOnlyBorderRadius = false,
    this.boarderWidth = 2,
    this.offsetDx = 0.5,
    this.offsetDy = 0.5,
    this.blurRadius = 10,
    this.spreadRadius = 1,
    this.horizontalPadding = 0,
    this.verticalPadding = 0,
    this.leftPadding = 0,
    this.rightPadding = 0,
    this.topPadding = 0,
    this.bottomPadding = 0,
    this.horizontalMargin = 0,
    this.verticalMargin = 0,
    this.leftMargin = 0,
    this.rightMargin = 0,
    this.topMargin = 0,
    this.bottomMargin = 0,
    this.topLeftBorderRadius = 0,
    this.topRightBorderRadius = 0,
    this.bottomRightBorderRadius = 0,
    this.bottomLeftBorderRadius = 0,
    this.topBoarderColor,
    this.bottomBoarderColor,
    this.leftBoarderColor,
    this.rightBoarderColor,
    this.boxShadowColor,
    this.boarderColorOpacity = 0.5,
    this.shadowColorOpacity = 0.12,
    this.boarderRadius = 10,
    this.shape = BoxShape.rectangle,
    this.padding = 0,
    this.margin = 0,
    this.backGroundColorOpacity = 1,
    this.isBoxShadow = false,
    this.isAllBoarderRadius = false,
    this.image,
    this.gradientColorList = const[],
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height?.h ?? height,
      width: width?.w ?? width,
      padding: isOnlyPadding ? EdgeInsets.only(left: leftPadding.w, right: rightPadding.w, top: topPadding.w, bottom: bottomPadding.w) : isSymmetricPadding ? EdgeInsets.symmetric(horizontal: horizontalPadding.w, vertical: verticalPadding.w) : EdgeInsets.all(padding.w),
      margin: isOnlyMargin ? EdgeInsets.only(left: leftMargin.w, right: rightMargin.w, top: topMargin.w, bottom: bottomMargin.w) : isSymmetricMargin ? EdgeInsets.symmetric(horizontal: horizontalMargin.w, vertical: verticalMargin.w) : EdgeInsets.all(margin.w),
      alignment: alignment,
      decoration: BoxDecoration(
        image: image,
        shape: shape,
        color: backGroundColor.withOpacity(backGroundColorOpacity),
        borderRadius: isOnlyBorderRadius ? BorderRadius.only(topLeft: Radius.circular(topLeftBorderRadius.r), topRight: Radius.circular(topRightBorderRadius.r), bottomLeft: Radius.circular(bottomLeftBorderRadius.r), bottomRight: Radius.circular(bottomRightBorderRadius.r)) :  isAllBoarderRadius ?  BorderRadius.all(Radius.circular(boarderRadius.r)) : null,
        border: isOnlyBoarder ? Border(
          bottom: isBottomBoarder ? BorderSide(width: boarderWidth.r, color: boarderColor.withOpacity(boarderColorOpacity)) : BorderSide.none,
          top: isTopBoarder ? BorderSide(width: boarderWidth.r, color: boarderColor.withOpacity(boarderColorOpacity)) : BorderSide.none,
          left: isLeftBoarder ? BorderSide(width: boarderWidth.r, color: boarderColor.withOpacity(boarderColorOpacity)) : BorderSide.none,
          right: isRightBoarder ? BorderSide(width: boarderWidth.r, color: boarderColor.withOpacity(boarderColorOpacity)) : BorderSide.none,
        ) : isAllBoarder ? Border.all(width: boarderWidth.r, color: boarderColor) : null,
        boxShadow: isBoxShadow ?  [
          BoxShadow(
            offset: Offset(offsetDx, offsetDx),
            color: shadColor.withOpacity(shadowColorOpacity),
            blurRadius: blurRadius.r,
            spreadRadius: spreadRadius.r,
          ),
        ] : [],
        gradient: gradientColorList.isEmpty ? null : LinearGradient(
          // begin: FractionalOffset(beingDx, beginDy),
          // end: FractionalOffset(endDx, endDy),


          // begin: Alignment.topRight,
          // end: Alignment.bottomLeft,

          begin: Alignment.topCenter,
          end: Alignment.bottomLeft,

          // stops: [0.2, 0.7, 1],
          // center: Alignment.center,
          // radius: 1,
          colors: gradientColorList,
        ),
      ),
      child: child,
    );
  }
}