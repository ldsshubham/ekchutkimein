import 'package:constructo_user/src/constants/app_colors.dart';
import 'package:constructo_user/src/constants/app_text_styles.dart';
import 'package:constructo_user/src/routing/apppages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CustomLanguageTile extends StatelessWidget {
  const CustomLanguageTile({
    super.key,
    required this.title,
    required this.subTitle,
    required this.imgPath,
  });

  final String title;
  final String subTitle;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.offNamed(AppRoutes.mainLoginSign);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryColor, width: 1.5),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Iconsax.sound),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.button.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Text(
                      subTitle,
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.gray,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Image.asset(imgPath, height: 48,),
          ],
        ),
      ),
    );
  }
}
