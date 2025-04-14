// Email Validation Class
import '../all_regex.dart';
import '../global_variable.dart';

class EmailValidation{

  // static String getEmailValidText(String str){
  //   //check to have any value or not
  //   if(uppercaseRegex.hasMatch(str) || lowercaseRegex.hasMatch(str) || digitRegex.hasMatch(str) || specialCharRegex.hasMatch(str)){
  //     // If email does not contain '@', it's invalid
  //     if(!str.contains('@')){
  //       return "Please insert valid input";
  //     }
  //   }
  //   return "no_error";
  // }

  String getValidEmail(String srt) {
    // Check if the input email matches the regex pattern
    bool flag =  emailRegex.hasMatch(srt);
    return flag ? noError : "Please insert valid email";
  }

}