import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/datasource/remote/dio/dio_client.dart';
import '../../../../data/model/base_model/api_response.dart';
import '../../../../data/repositories/local/sharepreferences_class.dart';
import '../../../../data/repositories/remote/otp_repo.dart';
import '../../../../utils/global/custom_snack_bar.dart';
import '../../../../utils/global/global_variable.dart';
import '../../../../utils/theme/app_colors/basic_color.dart';

class OtpController extends GetxController {
  DioClient dioClient;
  OtpRepo otpRepo;
  OtpController({required this.dioClient, required this.otpRepo});

  final firstController = TextEditingController();
  final secondController = TextEditingController();
  final thirdController = TextEditingController();
  final fourthController = TextEditingController();
  var buttonVisibility = false.obs;
  int resendCounterForOTP = 3;
  int otpTimerValue = 120;
  var isLoading = false.obs;
  var otpDigits = "".obs;

  void loginButtonVisibility() {
    buttonVisibility.value = firstController.text.isNotEmpty && secondController.text.isNotEmpty && thirdController.text.isNotEmpty && fourthController.text.isNotEmpty;
    update();
  }

  //set time
  Future<void> setTimerValue(int value)async{
    otpTimerValue = value;
    update();
  }

  //start and count down time
  void startTimer(){
    resendCounterForOTP--;
    const second = Duration(seconds: 1);
    Timer timer = Timer.periodic(second, (timer) {
      if(otpTimerValue == 0){
        timer.cancel();
        update();
      }
      else{
        otpTimerValue--;
        update();
      }
    });
  }


  String formatTime() {
    final minutes = (otpTimerValue / 60).floor();
    final remainingSeconds = otpTimerValue % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  //verify otp
  Future<dynamic> otp() async {
    isLoading.value = true;
    String? token = await SharedPreferencesClass.getValue(SharedPreferencesClass.token);
    var data = {
      "otp": otpDigits,
      "userToken": token.toString(),
    };
    ApiResponse apiResponse = await otpRepo.otp(data);
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