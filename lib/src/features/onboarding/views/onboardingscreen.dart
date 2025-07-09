import 'package:constructo_user/src/constants/app_colors.dart';
import 'package:constructo_user/src/constants/app_sizes.dart';
import 'package:constructo_user/src/constants/app_text_styles.dart';
import 'package:constructo_user/src/features/onboarding/widgets/language_screen.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(16, 32, 0, 32),
              height: 124,
              child: Text(
                'Choose Your language',
                style: AppTextStyles.bodyText.copyWith(
                  fontSize: AppSizes.fontXL,
                  color: AppColors.white,
                ),
              ),
            ),
            Expanded(
              child: LanguageScreening(),
            ),
          ],
        ),
      ),
    );
  }
}

