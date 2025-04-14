
import '../all_regex.dart';
import '../global_variable.dart';

class PasswordValidation{
  // Method to get error message for password validation
  String getPasswordValidationText({bool isWeek = true, String? password, String? previousPassword}){
    // If password is empty, it's valid
    if(password!.isEmpty){
      //return noError;
      return "Enter valid password";
    }
    if(previousPassword == null){
    }
    if(previousPassword != null ){
      // If password and confirm password don't match, it's invalid
      if(password.compareTo(previousPassword) != 0  && previousPassword.isNotEmpty){
        return "Password and confirm password not matching";
      }
    }
    // If isWeek is true, check for minimum length of 8 characters
    if(isWeek){
      if(password.length < 8 && password.isNotEmpty){
        return "Password should be at least 8 characters";
      }
    }else{
      // Check for strong password criteria (uppercase, lowercase, digit, special character)
      if(!uppercaseRegex.hasMatch(password) || !lowercaseRegex.hasMatch(password) || !digitRegex.hasMatch(password) || !specialCharRegex.hasMatch(password)){
        return "Should contain 0-9, uppercase, lowercase, special character";
      } else if(password.length < 8){
        return "Password should be at least 8 characters";
      }
    }
    return noError;
  }

}
