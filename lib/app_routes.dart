import 'package:ecommerce_app/view/features/address/screen/address_setup_screen.dart';
import 'package:ecommerce_app/view/features/category_screen/category_screen.dart';
import 'package:ecommerce_app/view/features/checkout/screen/check_out_screen.dart';
import 'package:ecommerce_app/view/features/fevorite/screen/favorite_screen.dart';
import 'package:ecommerce_app/view/features/home_screen/home_screen.dart';
import 'package:ecommerce_app/view/features/bottom_nav_bar_screen/bottom_nav_bar_screen.dart';
import 'package:ecommerce_app/view/features/my_order_screens/my_order_screen.dart';
import 'package:ecommerce_app/view/features/my_order_screens/order_details_screen.dart';
import 'package:ecommerce_app/view/features/onboarding/screens/onboarding_screen.dart';
import 'package:ecommerce_app/view/features/product_details/product_details_screen.dart';
import 'package:ecommerce_app/view/features/products_landing_screen/products_landing_screen.dart';
import 'package:ecommerce_app/view/features/sub_category_screen/sub_category_screen.dart';
import 'package:get/get.dart';
import 'view/features/authentication/change_password_screen/change_password_screen.dart';
import 'view/features/authentication/forget_password_screen/forget_password_screen.dart';
import 'view/features/authentication/login_screen/login_screen.dart';
import 'view/features/authentication/otp_screen/otp_screen.dart';
import 'view/features/authentication/registration_screen/registration_screen.dart';
import 'view/features/authentication/reset_password_screen/reset_password_screen.dart';
import '../view/features/splash/splash_screen.dart';

class AppRoutes {
  static int duration = 300;
  static final appRoutes = [
    GetPage(name: SplashScreen.routeName, page: () => const SplashScreen()),
    GetPage(name: BottomNavBarScreen.routeName, page: () => const BottomNavBarScreen()),
    GetPage(name: LoginScreen.routeName, page: () => const LoginScreen(), transition: Transition.rightToLeft, transitionDuration:  Duration(milliseconds: duration)),
    GetPage(name: RegistrationScreen.routeName, page: () => const RegistrationScreen(), transition: Transition.rightToLeft, transitionDuration:  Duration(milliseconds: duration)),
    GetPage(name: ForgetPasswordScreen.routeName, page: () => const ForgetPasswordScreen(), transition: Transition.rightToLeft, transitionDuration:  Duration(milliseconds: duration)),
    GetPage(name: ResetPasswordScreen.routeName, page: () => const ResetPasswordScreen(), transition: Transition.rightToLeft, transitionDuration:  Duration(milliseconds: duration)),
    GetPage(name: OtpScreen.routeName, page: () => const OtpScreen(), transition: Transition.rightToLeft, transitionDuration:  Duration(milliseconds: duration)),
    GetPage(name: ChangePasswordScreen.routeName, page: () => const ChangePasswordScreen(), transition: Transition.rightToLeft, transitionDuration:  Duration(milliseconds: duration)),
    GetPage(name: HomeScreen.routeName, page: () => const HomeScreen(), transition: Transition.rightToLeft, transitionDuration:  Duration(milliseconds: duration)),
    GetPage(name: OrderDetailsScreen.routeName, page: () => const OrderDetailsScreen(), transition: Transition.rightToLeft, transitionDuration:  Duration(milliseconds: duration)),
    GetPage(name: CategoryScreen.routeName, page: () => const CategoryScreen(), transition: Transition.rightToLeft, transitionDuration:  Duration(milliseconds: duration)),
    GetPage(name: SubCategoryScreen.routeName, page: () => const SubCategoryScreen(), transition: Transition.rightToLeft, transitionDuration:  Duration(milliseconds: duration)),
    GetPage(name: ProductsLandingScreen.routeName, page: () => const ProductsLandingScreen(), transition: Transition.rightToLeft, transitionDuration:  Duration(milliseconds: duration)),
    GetPage(name: MyOrderScreen.routeName, page: () => const MyOrderScreen(), transition: Transition.rightToLeft, transitionDuration:  Duration(milliseconds: duration)),
    GetPage(name: ProductDetailsScreen.routeName, page: () => const ProductDetailsScreen(), transition: Transition.rightToLeft, transitionDuration:  Duration(milliseconds: duration)),
    GetPage(name: FavoriteScreen.routeName, page: () => const FavoriteScreen(), transition: Transition.rightToLeft, transitionDuration:  Duration(milliseconds: duration)),

    // checkout
    GetPage(name: CheckOutScreen.routeName, page: () =>  CheckOutScreen(), transition: Transition.rightToLeft, transitionDuration:  Duration(milliseconds: duration)),

    // Onboarding
    GetPage(name: OnboardingScreen.routeName, page: () =>  OnboardingScreen(), transition: Transition.rightToLeft, transitionDuration:  Duration(milliseconds: duration)),

    // address setup
    GetPage(name: DeliveryAddressSetupScreen.routeName, page: () =>  DeliveryAddressSetupScreen(), transition: Transition.rightToLeft, transitionDuration:  Duration(milliseconds: duration)),

  ];
}