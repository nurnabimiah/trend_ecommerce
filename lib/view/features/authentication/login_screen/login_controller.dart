
import 'dart:convert';
import 'package:ecommerce_app/data/repositories/remote/login_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/datasource/remote/dio/dio_client.dart';
import '../../../../data/model/base_model/api_response.dart';
import '../../../../data/repositories/local/sharepreferences_class.dart';
import '../../../../utils/global/custom_snack_bar.dart';
import '../../../../utils/global/global_variable.dart';
import '../../../../utils/theme/app_colors/basic_color.dart';

class LoginController extends GetxController {
  DioClient dioClient;
  LoginRepo loginRepo;
  LoginController({required this.dioClient, required this.loginRepo});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var isPassword = true.obs;
  var rememberMe = false.obs;

  var emailErrorText = ''.obs;
  var passwordErrorText = ''.obs;
  var isEmailError = true.obs;
  var isPasswordError = true.obs;
  var buttonVisibility = false.obs;
  var isLoading = false.obs;


  //login button visibility
  void loginButtonVisibility() {
    buttonVisibility.value = !isEmailError.value && !isPasswordError.value;
  }

  Future<void> setDefaultVariable()async{
    isLoading.value = true;
    update();
  }

  //remember me
  Future<void> setRememberMe() async{
    var map = {
      "email": emailController.text,
      "password": passwordController.text,
    };
    await SharedPreferencesClass.setValue(SharedPreferencesClass.loginRememberMe, jsonEncode(map));
    if (kDebugMode) {
      print("rem=${await SharedPreferencesClass.getValue(SharedPreferencesClass.loginRememberMe)}");
    }
  }

  //get remember me email and password
  getRememberEmailPassword()async{
    String? jsonString = await SharedPreferencesClass.getValue(SharedPreferencesClass.loginRememberMe);
    dynamic data;
    if(jsonString != null){
      data = jsonDecode(jsonString);
      emailController.text = data["email"];
      passwordController.text = data["password"];
      isEmailError.value = false;
      isPasswordError.value = false;
      buttonVisibility.value = true;
    }
    update();
  }


//login
Future<dynamic> login() async {
  isLoading.value = true;
  var data = {
    "email": emailController.text,
    "password": passwordController.text,
  };

  ApiResponse apiResponse = await loginRepo.login(data);
   if (kDebugMode) {
     print("apiResponse....${apiResponse.response}");
   }
  if(apiResponse.response == null){
    isLoading.value = false;
    customSnackBar(apiResponse.message, backGroundColor: appRedColorSecond);
    return error;
  }
  if (apiResponse.response != null &&  apiResponse.response!.statusCode==200) {
   // loginModel = LoginModel.fromJson(apiResponse.response!.data);
    //print("loginModel....${loginModel}");
    //await SharedPreferencesClass.setValue(SharedPreferencesClass.token, loginModel!.data!.accessToken);
  //  await SharedPreferencesClass.setValue(SharedPreferencesClass.userId, loginModel!.data!.sId);
    await dioClient.updateHeader();
    if(rememberMe.value){
      await setRememberMe();
    }
    customSnackBar(apiResponse.message,);
  }else{
    if (kDebugMode) {
      print("apiResponse....${apiResponse.message}");
    }
    customSnackBar(apiResponse.message, backGroundColor: appRedColorSecond);
  }
  isLoading.value = false;
  return apiResponse.response!.data["success"];
}




}