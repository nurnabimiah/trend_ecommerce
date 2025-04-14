import 'package:dio/dio.dart';
import 'package:ecommerce_app/data/repositories/remote/category_repo.dart';
import 'package:ecommerce_app/data/repositories/remote/order_repo.dart';
import 'package:ecommerce_app/utils/app_constants.dart';
import 'package:ecommerce_app/view/features/category_screen/category_controller.dart';
import 'package:ecommerce_app/view/features/my_order_screens/order_controller.dart';
import 'package:ecommerce_app/view/features/products_landing_screen/products_landing_controller.dart';
import 'package:ecommerce_app/view/features/sub_category_screen/sub_category_controller.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/repositories/remote/products_landing_repo.dart';
import 'data/repositories/remote/sub_category_repo.dart';
import 'view/features/authentication/change_password_screen/change_password_controller.dart';
import 'view/features/authentication/forget_password_screen/forget_password_controller.dart';
import 'view/features/authentication/login_screen/login_controller.dart';
import 'view/features/authentication/otp_screen/otp_controller.dart';
import 'view/features/authentication/registration_screen/registration_controller.dart';
import 'view/features/authentication/reset_password_screen/reset_password_controller.dart';
import 'view/features/splash/splash_controller.dart';
import 'data/datasource/remote/dio/dio_client.dart';
import 'data/datasource/remote/dio/logging_interceptor.dart';
import 'data/repositories/remote/change_password_repo.dart';
import 'data/repositories/remote/forget_password_repo.dart';
import 'data/repositories/remote/login_repo.dart';
import 'data/repositories/remote/otp_repo.dart';
import 'data/repositories/remote/registration_repo.dart';
import 'data/repositories/remote/reset_password_repo.dart';


final sl = GetIt.instance;

Future<void> init() async {

  /// Core
  sl.registerLazySingleton(() => DioClient(AppConstants.baseUrl, sl(), loggingInterceptor: sl(), sharedPreferences: sl()));

  /// Repository
  sl.registerLazySingleton(() => RegistrationRepo(dioClient: sl()));
  sl.registerLazySingleton(() => LoginRepo(dioClient: sl()));

  sl.registerLazySingleton(() => ForgetPasswordRepo(dioClient: sl()));
  sl.registerLazySingleton(() => OtpRepo(dioClient: sl()));
  sl.registerLazySingleton(() => ResetPasswordRepo(dioClient: sl()));
  sl.registerLazySingleton(() => ChangePasswordRepo(dioClient: sl()));
  sl.registerLazySingleton(() => CategoryRepo(dioClient: sl()));
  sl.registerLazySingleton(() => SubCategoryRepo(dioClient: sl()));
  sl.registerLazySingleton(() => ProductsLandingRepo(dioClient: sl()));
  sl.registerLazySingleton(() => OrderRepo(dioClient: sl()));

/// Controller
  Get.lazyPut(() => SplashController(dioClient: sl()), fenix: true);

  /// Controller
  Get.lazyPut(() => SplashController(dioClient: sl()), fenix: true);
  Get.lazyPut(() => LoginController(dioClient: sl(), loginRepo: sl()), fenix: true);
  Get.lazyPut(() => RegistrationController(dioClient: sl(), registrationRepo: sl()), fenix: true);
  Get.lazyPut(() => ChangePasswordController(dioClient: sl(), changePasswordRepo: sl()), fenix: true);

  Get.lazyPut(() => ForgetPasswordController(dioClient: sl(), forgetPasswordRepo: sl()), fenix: true);
  Get.lazyPut(() => ResetPasswordController(dioClient: sl(), resetPasswordRepo: sl()), fenix: true);
  Get.lazyPut(() => OtpController(dioClient: sl(), otpRepo: sl()), fenix: true);
  Get.lazyPut(() => CategoryController(dioClient: sl(), categoryRepo: sl()), fenix: true);
  Get.lazyPut(() => SubCategoryController(dioClient: sl(), categoryRepo: sl()), fenix: true);
  Get.lazyPut(() => ProductsLandingController(dioClient: sl(), productsLandingRepo: sl()), fenix: true);
  Get.lazyPut(() => OrderController(dioClient: sl(), orderRepo: sl()), fenix: true);

/// External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());

}