
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../theme/app_colors/basic_color.dart';
import '../size_box.dart';

class OverlaySnackBar {
  static OverlayEntry? overlayEntry;

  //show overlay message
  static void show(String message) async{
    //OverlayState? overlayState = Overlay.of(GlobalNavigationService.navigatorKey.currentState!.context);
    OverlayState? overlayState = Overlay.of(Get.overlayContext!);
    if(overlayEntry != null){
      overlayEntry!.remove();
    }
    overlayEntry =  OverlayEntry(builder: (context) {
      return GestureDetector(
        onTap: cancel,
        child: Stack(
          children: [
            // Blurred background
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0.1, sigmaY: 0.1),
              child: Container(
                color: Colors.black.withOpacity(0.001),
              ),
            ),
            // Overlay message
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                child: Container(
                  // height: 100,
                  color: appRedColor,
                  padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(message, maxLines: 3, style: const TextStyle(fontSize: 12, color: Colors.white, decoration: TextDecoration.none, ),),
                      ),
                      szW5(),
                      SizedBox(
                        width: 40.w,
                        child: const Center(
                          child: TextButton(
                              onPressed: cancel,
                              child: Icon(Icons.cancel, color: Colors.white,)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
    overlayState.insert(overlayEntry!);
    //overlayState = overlayEntry!;
  }

  static void cancel() {
    if(overlayEntry != null){
      overlayEntry!.remove();
      overlayEntry = null;
    }
  }
}