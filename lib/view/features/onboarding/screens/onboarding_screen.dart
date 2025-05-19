

import 'package:ecommerce_app/view/features/onboarding/widget/onboading_screen2.dart';
import 'package:ecommerce_app/view/features/onboarding/widget/onboarding_screen3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/onboarding_controller.dart';
import '../widget/onboarding_page1.dart';





class OnboardingScreen extends StatelessWidget {
  static const String routeName = '/onboarding';
  final controller = Get.put(OnboardingController());

  final onboardingData = [
    OnboardingPage1(),
    OnboardingPage2(),
    OnboardingPage3(),
  ];

  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller.pageController,
              onPageChanged: controller.onPageChanged,
              itemCount: onboardingData.length,
              itemBuilder: (_, index) {
                final item = onboardingData[index];
                return Padding(
                  padding: const EdgeInsets.all(0),
                  child: item,
                );
              },
            ),
          ),

          // Dots Indicator
          Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(onboardingData.length, (index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                width: controller.pageIndex.value == index ? 12 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: controller.pageIndex.value == index ? Colors.teal : Colors.grey,
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            }),
          )),

          SizedBox(height: 24),

          // Skip / Next Buttons
          Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: controller.skip,
                child: Text("Skip"),
              ),
              ElevatedButton(
                onPressed: controller.nextPage,
                child: Text(controller.pageIndex.value == onboardingData.length - 1 ? "Finish" : "Next"),
              ),
            ],
          )),

          SizedBox(height: 30),
        ],
      ),
    );
  }
}