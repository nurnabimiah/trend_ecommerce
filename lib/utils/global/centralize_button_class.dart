import 'package:ecommerce_app/utils/services/navigation_service/navigation_service_widget.dart';
import 'package:flutter/material.dart';

class CentralizeButtonClass{
  static ScrollController scrollController = ScrollController();
  static Map<int, GlobalKey> buttonKeys = {};

  initializeButtonKeys(dynamic list){
    buttonKeys = {};
    for (int i = 0; i < list.length; i++) {
      buttonKeys[i] = GlobalKey();
    }
  }

  void centerButton(int index) {
    // Find the button's width and position using the GlobalKey
    RenderBox renderBox =
    buttonKeys[index]!.currentContext!.findRenderObject() as RenderBox;
    double buttonWidth = renderBox.size.width;
    Offset buttonPosition = renderBox.localToGlobal(Offset.zero);

    // Calculate the target offset for centering
    double screenWidth = MediaQuery.of(NavigationService.currentContext).size.width;
    double targetOffset = buttonPosition.dx +
        (buttonWidth / 2) -
        (screenWidth / 2);

    // Scroll to the calculated position
    scrollController.animateTo(
      targetOffset + scrollController.offset,
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeInOut,
    );
  }
}