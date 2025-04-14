import 'package:flutter/material.dart';
import '../../theme/app_colors/basic_color.dart';
import '../../theme/app_colors/text_form_field_color.dart';

class PhoneNumberValidation{
  static String getValidPhoneNumber(String str){
    str = str.replaceAll('-', '');
    if(str.isEmpty) return "";
    if(str.length > 1){
      //phone number
      if(str[1] == '1' && str[0] == '0'){
        if (str.length > 5) {
          String tempString = str.substring(5, str.length);
          if(str.length > 11){
            tempString = str.substring(5, 11);
          }
          return "${str.substring(0, 5)}-$tempString";
          // return "${str.substring(0, 5)}-${str.substring(5)}";
        }else{
          return str;
        }

      }else{
        //telephone number
        if (str.length > 2) {
          String tempString = str.substring(2, str.length);
          if(str.length > 9){
            tempString = str.substring(2, 9);
          }
          return "02-$tempString";
        }else{
          return str;
        }
      }

    }else {
      if(str[0] == '0'){
        return str;
      }else{
        //telephone number
        return "02-$str";
      }
    }
  }

  //phone number validation border color
  static Color getPhoneNumberBoarderColor(String str){
    str = str.replaceAll("-", "");
    if(str.length < 8){
      return appRedColor;
    }else{
      if(str.substring(0, 2) == "02" && str.length < 9){
        return appRedColor;
      }else if(str.substring(0, 2) == "01" && str.length < 11){
        return appRedColor;
      }
    }
    return textFieldEnableBoarderColorLightFirst;
  }

}