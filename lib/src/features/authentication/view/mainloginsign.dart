import 'package:constructo_user/src/constants/app_font_weight.dart';
import 'package:constructo_user/src/constants/app_text_styles.dart';
import 'package:constructo_user/src/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routing/apppages.dart';

class MainLoginSign extends StatelessWidget {
  const MainLoginSign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(top: 32),
                child: Text(
                  AppString.appName,
                  style: AppTextStyles.heading1.copyWith(
                    fontWeight: AppFontWeight.semiBold,
                    fontSize: 20,
                  ),
                ),
              ),
ClipRRect(
              clipBehavior: Clip.antiAlias,

              child: Image.asset('assets/images/mainlogo.jpg', height: 172,),
            ),
              Container(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 32),
                child: Column(
                  spacing: 4,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.signup);
                        },
                        child: Text("Signup for joining"),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.login);
                        },
                        child: Text("Login"),
                      ),
                    ), 
                    SizedBox(width: double.infinity, child: TextButton(onPressed: (){}, child: Text('Skip')))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
