import 'package:constructo_user/src/routing/apppages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    print("🚀 SplashController.onReady() running");
    Future.delayed(Duration(seconds: 3), () {
      print("Navigating to home");
      Get.offNamed(AppRoutes.onboarding);
    });
  }
}
