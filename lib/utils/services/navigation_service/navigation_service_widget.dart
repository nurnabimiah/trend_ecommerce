import 'package:flutter/material.dart';


/// Navigation Service Without Context

/// For NavigationService
class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static final  currentContext = navigatorKey.currentState!.context;

  dynamic routeTo(dynamic route, {dynamic arguments}) {
    return navigatorKey.currentState?.pushNamed(route, arguments: arguments);
  }

  dynamic goBack() {
    return navigatorKey.currentState?.pop();
  }
}
