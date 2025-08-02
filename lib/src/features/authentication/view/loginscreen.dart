import 'package:constructo_user/src/features/authentication/controllers/logincontroller.dart';
import 'package:constructo_user/src/features/authentication/view/widgets/logincomponents.dart';
import 'package:constructo_user/src/features/authentication/view/widgets/otpcomponent.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routing/apppages.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Show Login or OTP screen based on step
            Obx(() {
              return controller.currentStep.value == 0
                  ? LoginComponent(
                      mobileController: controller.mobileController,
                    )
                  : OtpComponent(otpController: controller.otpController);
            }),

            const SizedBox(height: 10),

            // Button to send OTP or verify
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (controller.currentStep.value == 0) {
                    controller.requestOTP();
                  } else {
                    // Later you can implement: controller.verifyOTP()
                    controller.verifyOtp(controller.otpController.text);
                  }
                },
                child: Obx(() {
                  return Text(
                    controller.currentStep.value == 0
                        ? 'Send OTP'
                        : 'Verify OTP',
                  );
                }),
              ),
            ),

            // Optional: Skip button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    controller.requestOTP();
                  },
                  child: const Text(
                    'Resend OTP',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.offNamed(AppRoutes.home);
                  },
                  child: const Text('Skip'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
