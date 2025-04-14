import 'dart:developer';
import 'package:ecommerce_app/utils/app_constants.dart';
import 'package:ecommerce_app/utils/global/classes/internet_connection_class.dart';
import 'package:ecommerce_app/utils/helper/local_notifications.dart';
import 'package:ecommerce_app/utils/services/navigation_service/navigation_service_widget.dart';
import 'package:ecommerce_app/utils/theme/app_colors/all_colors_export.dart';
import 'package:ecommerce_app/view/features/onboarding/screens/onboarding_screen.dart';
import 'package:ecommerce_app/view/features/onboarding/widget/onboarding_page1.dart';
import 'package:ecommerce_app/view/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:permission_handler/permission_handler.dart';
import 'app_routes.dart';
import 'di_container.dart' as di;


final LocalNotifications localNotifications = LocalNotifications();
Future<void> requestPermissions() async {
  if (await Permission.notification.isDenied) {
    await Permission.notification.request();
  }
}


void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  try{
    await localNotifications.initializeNotification();
  }catch(e){
    log('LocalNotification initialization error:$e');
  }
  requestPermissions();

  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //for internet connect set up for global responding
  initializeInternet(context)async{
    InternetConnectionClass.startStreaming(context);
  }

  @override
  Widget build(BuildContext context) {
    initializeInternet(context);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: ((context, child) {
        return GetMaterialApp(
          title: AppConstants.appName,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: appPrimaryColor),
            useMaterial3: true,
          ),
          initialRoute: SplashScreen.routeName,
          getPages: AppRoutes.appRoutes,
          navigatorKey: NavigationService.navigatorKey,
        );
      }),
    );
  }
}

