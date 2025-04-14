
import 'package:ecommerce_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
/// For Roboto Google Font
myTxtCustom({
  double fontSize = 14,
  Color color = Colors.black,
  FontWeight? fontWeight,
  FontStyle? fontStyle,
  double? letterSpacing,
  TextDecoration? decoration,
  Color? decorationColor, TextStyle? texStyle}){
  return GoogleFonts.aBeeZee(height: 0, fontSize: fontSize, color: color, fontWeight: fontWeight,
      fontStyle: fontStyle, decoration: decoration, decorationColor: decorationColor,
      letterSpacing: letterSpacing, textStyle: texStyle,);
}

/// For Extra Large Size
myTxt18({Color color = Colors.black, FontWeight? fontWeight, double? fontSize, TextStyle? texStyle}){
  return GoogleFonts.aBeeZee(height: 0, fontSize: fontSize?.sp ?? 18.sp, color: color, fontWeight: fontWeight ?? FontWeight.w800, textStyle: texStyle,);
}

/// For Large Size
myTxt16({Color color = Colors.black, FontWeight? fontWeight, double? fontSize, FontStyle fonStyle = FontStyle.normal, TextStyle? texStyle}){
  return GoogleFonts.aBeeZee(height: 0, fontSize: fontSize?.sp ?? 16.sp, color: color, fontWeight: fontWeight ?? FontWeight.w600, textStyle: texStyle, fontStyle: fonStyle,);
}
/// For Medium Size
myTxt15({Color color = Colors.black, FontWeight? fontWeight, double? fontSize, FontStyle fonStyle = FontStyle.normal, TextStyle? texStyle}){
  return GoogleFonts.aBeeZee(height: 0, fontSize: fontSize?.sp ?? 15.sp, color: color, fontWeight: fontWeight ?? FontWeight.normal, textStyle: texStyle, fontStyle: fonStyle,);
}

/// For Medium Size
myTxt14({Color color = Colors.black, FontWeight? fontWeight, double? fontSize, FontStyle fonStyle = FontStyle.normal, TextStyle? texStyle}){
  return GoogleFonts.aBeeZee(height: 0, fontSize: fontSize?.sp ?? 14.sp, color: color, fontWeight: fontWeight ?? FontWeight.normal, textStyle: texStyle, fontStyle: fonStyle,);
}

/// For Medium Size
myTxt13({Color color = Colors.black, FontWeight? fontWeight, double? fontSize, FontStyle fonStyle = FontStyle.normal, TextStyle? texStyle}){
  return GoogleFonts.aBeeZee(height: 0, fontSize: fontSize?.sp ?? 13.sp, color: color, fontWeight: fontWeight ?? FontWeight.normal, textStyle: texStyle, fontStyle: fonStyle,);
}

/// For Small Size
myTxt12({Color color = Colors.black, FontWeight? fontWeight, double? fontSize}){
  return GoogleFonts.aBeeZee(height: 0, fontSize: fontSize?.sp ?? 12.sp, color: color, fontWeight: fontWeight ?? FontWeight.w400);
}

/// For Very Small Size
myTxt11({Color color = Colors.black, FontWeight? fontWeight, double? fontSize}){
  return GoogleFonts.aBeeZee(height: 0, fontSize: fontSize?.sp ?? 11.sp, color: color, fontWeight: fontWeight ?? FontWeight.w400);
}

/// For Very Small Size
myTxt10({Color color = Colors.black, FontWeight? fontWeight, double? fontSize}){
  return GoogleFonts.aBeeZee(height: 0, fontSize: fontSize?.sp ?? 10.sp, color: color, fontWeight: fontWeight ?? FontWeight.w400);
}


