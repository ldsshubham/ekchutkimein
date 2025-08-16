import 'package:constructo_user/src/constants/app_colors.dart';
import 'package:constructo_user/src/features/authentication/controllers/logincontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';

class ProfileWithData extends StatelessWidget {
  final dynamic profileController;
  final LoginController controller = Get.find<LoginController>();
  ProfileWithData({super.key, required this.profileController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.gray,
                      radius: 32,
                      child: Icon(
                        Icons.verified_user,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'Click here to update data',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          profileController.userProfile.value!.mobileNumber,
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Divider(color: AppColors.gray, thickness: 1),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: Center(
                child: TextButton(
                  onPressed: () {
                    controller.logOutUser();
                    print('User logged out');
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min, // keeps it compact
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Iconsax.logout),
                      SizedBox(width: 8),
                      Text('Logout'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
