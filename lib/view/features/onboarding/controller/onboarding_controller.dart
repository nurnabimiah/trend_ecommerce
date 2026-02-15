

import 'package:ecommerce_app/view/features/authentication/login_screen/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../data/repositories/local/sharepreferences_class.dart';

class OnboardingController extends GetxController {
  final SharedPreferences? sharedPreferences;

  OnboardingController({required this.sharedPreferences});


  final pageController = PageController();
  var pageIndex = 0.obs;

  void nextPage() {
    if (pageIndex.value < 2) {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      finishOnboarding();
    }
  }

  void skip() {
    finishOnboarding();
  }

  void onPageChanged(int index) {
    pageIndex.value = index;
  }

  void finishOnboarding() async {
    await SharedPreferencesClass.setBoolValue(
        SharedPreferencesClass.onboarding, true);

    Get.offAllNamed(LoginScreen.routeName);
  }


}