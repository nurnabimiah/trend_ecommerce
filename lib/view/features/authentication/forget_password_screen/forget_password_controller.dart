
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/datasource/remote/dio/dio_client.dart';
import '../../../../data/model/base_model/api_response.dart';
import '../../../../data/repositories/remote/forget_password_repo.dart';
import '../../../../utils/global/custom_snack_bar.dart';
import '../../../../utils/global/global_variable.dart';
import '../../../../utils/theme/app_colors/basic_color.dart';

class ForgetPasswordController extends GetxController {
  DioClient dioClient;
  ForgetPasswordRepo forgetPasswordRepo;
  ForgetPasswordController({required this.dioClient, required this.forgetPasswordRepo});

  final emailController = TextEditingController();
  var emailErrorText = ''.obs;
  var isEmailError = true.obs;
  var buttonVisibility = false.obs;
  var isLoading = false.obs;

  void loginButtonVisibility() {
    buttonVisibility.value = !isEmailError.value;
  }

  //forget password
  Future<dynamic> forgetPassword() async {
    isLoading.value = true;
    var data = {
      "email": emailController.text,
    };
    ApiResponse apiResponse = await forgetPasswordRepo.forgetPassword(data);
     if (kDebugMode) {
       print("apiResponse....${apiResponse.response}");
     }
    if(apiResponse.response == null){
      isLoading.value = false;
      customSnackBar(apiResponse.message, backGroundColor: appRedColorSecond);
      return error;
    }
    if (apiResponse.response != null &&  apiResponse.response!.statusCode==200) {
      customSnackBar(apiResponse.message);
    }else{
      customSnackBar(apiResponse.message, backGroundColor: appRedColorSecond);
    }
    isLoading.value = false;
    return apiResponse.response!.data["success"];
  }
}