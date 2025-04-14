
import '../global_variable.dart';

class EmptyTextFieldCheck{
  //if text form empty, it's invalid
  static String getEmptyFieldText(String? str){
    if(str!.isEmpty) return "Field should not be empty";
    return noError;
  }
}