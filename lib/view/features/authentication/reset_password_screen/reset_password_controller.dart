import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/datasource/remote/dio/dio_client.dart';
import '../../../../data/model/base_model/api_response.dart';
import '../../../../data/repositories/remote/reset_password_repo.dart';
import '../../../../utils/global/custom_snack_bar.dart';
import '../../../../utils/global/global_variable.dart';
import '../../../../utils/theme/app_colors/basic_color.dart';

class ResetPasswordController extends GetxController {
  DioClient dioClient;
  ResetPasswordRepo resetPasswordRepo;
  ResetPasswordController({required this.dioClient, required this.resetPasswordRepo});

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var passwordErrorText = ''.obs;
  var confirmPasswordErrorText = ''.obs;
  var isPasswordError = true.obs;
  var isConfirmPasswordError = true.obs;
  var buttonVisibility = false.obs;
  var isLoading = false.obs;

  void loginButtonVisibility() {
    buttonVisibility.value = !isPasswordError.value && !isConfirmPasswordError.value;
  }

  //reset password
  Future<dynamic> resetPassword() async {
    isLoading.value = true;
    var data = {
      "email": passwordController.text,
    };
    ApiResponse apiResponse = await resetPasswordRepo.resetPassword(data);
    // print("apiResponse....${apiResponse.response}");
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