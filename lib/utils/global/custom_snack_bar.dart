import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../style/app_style.dart';
import '../theme/app_colors/basic_color.dart';
import '../theme/app_colors/text_color.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> customSnackBar(String? message,{Color backGroundColor = appPrimaryColor}) {
  return ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(
    SnackBar(
      backgroundColor: backGroundColor,
      duration: const Duration(milliseconds: 1500),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(Get.overlayContext!).size.width - 100,
            child: Text(message.toString(), maxLines: 2,
                    style: myTxt14(color: txtColorWhiteLight),
            ),
          ),
        ],
      ),
    ),
  );
}