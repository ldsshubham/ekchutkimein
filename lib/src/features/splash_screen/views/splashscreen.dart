import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splashcontroller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //   Future.delayed(Duration(seconds: 3), () {
    //   Get.offNamed(AppRoutes.home);
    // });
    print("🧠 Controller: ${controller.runtimeType}");
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(AppString.appName, style: AppTextStyles.heading1),
            ClipRRect(
              clipBehavior: Clip.antiAlias,
              child: Image.asset('assets/images/mainlogo.jpg', height: 172,),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
