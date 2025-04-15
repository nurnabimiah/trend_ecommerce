

import 'package:ecommerce_app/view/features/bottom_nav_bar_screen/bottom_nav_bar_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
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

  void finishOnboarding() {
    Get.offAllNamed(BottomNavBarScreen.routeName);
  }
}