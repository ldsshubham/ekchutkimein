import 'package:constructo_user/src/features/authentication/view/widgets/otpcomponent.dart';
import 'package:constructo_user/src/routing/apppages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/singupcontroller.dart';
import '../view/widgets/singupcomponent.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final SignupController controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(16, 32, 16, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Obx(() {
            //   return controller.currentStep.value == 0
            //       ? SignupComponent()
            //       : OtpComponent();
            // }),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.gotoNextStep,
                child: Obx(() {
                  return controller.currentStep.value == 0
                      ? Text('Next')
                      : Text('Verify OTP');
                }),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Already have an account?"),
                TextButton(
                  onPressed: () {
                    Get.offNamed(AppRoutes.login);
                  },
                  child: Text('Login'),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.home);
                },
                child: Text('Skip'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
