import 'dart:async';
import 'package:ecommerce_app/utils/images/app_images.dart';
import 'package:ecommerce_app/view/features/onboarding/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/repositories/local/sharepreferences_class.dart';
import '../../../utils/theme/app_colors/basic_color.dart';
import '../authentication/login_screen/login_screen.dart';
import '../bottom_nav_bar_screen/bottom_nav_bar_screen.dart';



class SplashScreen extends StatefulWidget {
  static const String routeName = '/SplashScreen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  //Checking token null or not
  Future<bool> checkToken() async{
    String? token = await SharedPreferencesClass.getValue(SharedPreferencesClass.token);
    return token == null ? false : true;
  }

  Future<bool> checkOnboarding() async {
    bool? value = await SharedPreferencesClass
        .getBoolValue(SharedPreferencesClass.onboarding);

    return value ?? false;
  }

  startTimer() {
    Timer(const Duration(seconds: 2), () async {

      bool hasToken = await checkToken();
      bool hasOnboarded = await checkOnboarding();

      if (hasToken) {
        Get.offAllNamed(BottomNavBarScreen.routeName);
      } else {
        if (hasOnboarded) {
          Get.offAllNamed(BottomNavBarScreen.routeName);
          // Get.offAllNamed(LoginScreen.routeName);
        } else {
          Get.offAllNamed(BottomNavBarScreen.routeName);
          // Get.offAllNamed(OnboardingScreen.routeName);
        }
      }
    });
  }


  @override
  void initState() {
    startTimer();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteOnly,
      body:  Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.appLogo)

          ],
        ),
      ),
    );
  }
}