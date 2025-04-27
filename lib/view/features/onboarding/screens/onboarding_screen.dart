

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/onboarding_controller.dart';
import '../widget/onboarding_page1.dart';


class OnboardingScreen extends StatelessWidget {
  static const String routeName = '/onboarding';
  final controller = Get.put(OnboardingController());

  final onboardingData = [
    OnboardingPage1()

    // {
    //   "title": "Stay Updated",
    //   "desc": "Get real-time updates and news.",
    // },
    // {
    //   "title": "Get Started",
    //   "desc": "Let's begin your journey today.",
    // },
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
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(item["title"]!, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                      SizedBox(height: 20),
                      Text(item["desc"]!, style: TextStyle(fontSize: 16), textAlign: TextAlign.center),
                    ],
                  ),
                );
              },
            ),
          ),


          Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
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
          Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: controller.skip,
                child: Text("Skip"),
              ),
              ElevatedButton(
                onPressed: controller.nextPage,
                child: Text(controller.pageIndex.value == 2 ? "Finish" : "Next"),
              ),
            ],
          )),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}