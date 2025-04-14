import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/datasource/remote/dio/dio_client.dart';
import '../../../../data/model/base_model/api_response.dart';
import '../../../../data/repositories/remote/change_password_repo.dart';
import '../../../../utils/global/custom_snack_bar.dart';
import '../../../../utils/global/global_variable.dart';
import '../../../../utils/theme/app_colors/basic_color.dart';

class ChangePasswordController extends GetxController {

  DioClient dioClient;
  ChangePasswordRepo changePasswordRepo;
  ChangePasswordController({required this.dioClient, required this.changePasswordRepo});

  final currentPasswordController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var currentPasswordErrorText = ''.obs;
  var passwordErrorText = ''.obs;
  var confirmPasswordErrorText = ''.obs;
  var isCurrentPasswordError = true.obs;
  var isPasswordError = true.obs;
  var isConfirmPasswordError = true.obs;
  var buttonVisibility = false.obs;
  var isLoading = false.obs;

  void loginButtonVisibility() {
    buttonVisibility.value = !isCurrentPasswordError.value  && !isPasswordError.value && !isConfirmPasswordError.value;
  }

  //change password
  Future<dynamic> changePassword() async {
    isLoading.value = true;
    var data = {
      "oldPassword": currentPasswordController.text,
      "newPassword": passwordController.text,
    };
    ApiResponse apiResponse = await changePasswordRepo.changePassword(data);
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