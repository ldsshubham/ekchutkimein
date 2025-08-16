import 'package:constructo_user/src/features/profile/controllers/profileController.dart';
import 'package:constructo_user/src/features/profile/wigets/profile_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../constants/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return profileController.isLoading.value
          ? Center(
              child: LoadingAnimationWidget.waveDots(
                color: AppColors.primaryColor,
                size: 50,
              ),
            )
          : ProfileWithData(profileController: profileController);
    });
  }
}
