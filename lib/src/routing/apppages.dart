import 'package:constructo_user/src/features/authentication/view/SignupScreen.dart';
import 'package:constructo_user/src/features/authentication/view/loginscreen.dart';
import 'package:constructo_user/src/features/authentication/view/mainloginsign.dart';
import 'package:constructo_user/src/features/cart/views/cartscreen.dart';
import 'package:constructo_user/src/features/categories/views/categoryscreen.dart';
import 'package:constructo_user/src/features/onboarding/views/onboardingscreen.dart';
import 'package:constructo_user/src/features/profile/views/profilescreen.dart';
import 'package:constructo_user/src/features/splash_screen/binding/splash_binding.dart';
import 'package:constructo_user/src/features/splash_screen/views/splashscreen.dart';
import '../features/farmers/views/farmerscreen.dart';
import '../features/home/views/homescreen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const splash = "/";
  static const home = "/home";
  static const onboarding = '/onboarding';
  static const mainLoginSign = '/mainloginsign';
  static const login = "/login";
  static const signup = '/signup';
  static const cart = '/cart';
  static const category = '/category';
  static const farmer = '/farmer';
  static const profile = '/profile';
}

class AppPages {
  static const initial = AppRoutes.splash;

  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(name: AppRoutes.home, page: () => HomeScreen()),
    GetPage(name: AppRoutes.onboarding, page: () => OnBoardingScreen()),
    GetPage(name: AppRoutes.mainLoginSign, page: () => MainLoginSign()),
    GetPage(name: AppRoutes.login, page: () => LoginScreen()),
    GetPage(name: AppRoutes.signup, page: () => SignupScreen()),
    GetPage(name: AppRoutes.category, page: () => CategoryScreen()),
    GetPage(name: AppRoutes.cart, page: () => CartScreen()),
    GetPage(name: AppRoutes.profile, page: () => ProfileScreen()),
    GetPage(name: AppRoutes.farmer, page: () => FarmerScreen()),
  ];
}
