
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/datasource/remote/dio/dio_client.dart';
import '../../../../data/model/base_model/api_response.dart';
import '../../../../data/repositories/local/sharepreferences_class.dart';
import '../../../../data/repositories/remote/registration_repo.dart';
import '../../../../utils/global/custom_snack_bar.dart';
import '../../../../utils/global/global_variable.dart';
import '../../../../utils/theme/app_colors/basic_color.dart';

class RegistrationController extends GetxController {
  DioClient dioClient;
  RegistrationRepo registrationRepo;

  RegistrationController({required this.dioClient, required this.registrationRepo});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  var nameErrorText = ''.obs;
  var emailErrorText = ''.obs;
  var passwordErrorText = ''.obs;
  var phoneErrorText = ''.obs;
  var isNameError = true.obs;
  var isEmailError = true.obs;
  var isPasswordError = true.obs;
  var isPhoneError = true.obs;
  var buttonVisibility = false.obs;

  var isLoading = false.obs;

  //RegistrationModel? registrationModel;

  void loginButtonVisibility() {
    buttonVisibility.value = !isNameError.value && !isEmailError.value && !isPasswordError.value && !isPhoneError.value;
  }

  //registration
  Future<dynamic> registration() async {
    isLoading.value = true;
    var data = {
      "fullName": nameController.text,
      "phone": phoneController.text,
      "email": emailController.text,
      "password": passwordController.text,
    };
    ApiResponse apiResponse = await registrationRepo.registration(data);
    if (kDebugMode) {
      print("apiResponse...1.${apiResponse.response}");
    }
    if(apiResponse.response == null){
      customSnackBar(apiResponse.message);
      isLoading.value = false;
      return error;
    }
    if (apiResponse.response != null &&  apiResponse.response!.statusCode==200) {
     // registrationModel = RegistrationModel.fromJson(apiResponse.response!.data);
      //print("registrationModel....${registrationModel}");
      //await SharedPreferencesClass.setValue(SharedPreferencesClass.token, registrationModel!.data!.accessToken);
      await dioClient.updateHeader();
      customSnackBar(apiResponse.message);
    }else{
      customSnackBar(apiResponse.message, backGroundColor: appRedColorSecond);
    }
    isLoading.value = false;
    return apiResponse.response!.data["success"];
  }

}