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
        padding: EdgeInsets.fromLTRB(16, 32, 16, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              return controller.currentStep.value == 0
                  ? SignupComponent()
                  : OtpComponent();
            }),

            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.goToNextStep,
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
                Text("Don't have an account?"),
                TextButton(onPressed: () {
                  Get.offNamed(AppRoutes.signup);
                }, child: Text('Create Account')),
              ],
            ),
            
            SizedBox(width:double.infinity,  child: TextButton(onPressed: (){
              Get.toNamed(AppRoutes.home);
            }, child:Text('Skip')))
          ],
        ),
      ),
    );
  }
}
