import 'package:constructo_user/src/constants/app_colors.dart';
import 'package:constructo_user/src/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AiGeneratorBox extends StatelessWidget {
  const AiGeneratorBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsGeometry.only(left: 24, right: 24),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.gray, // Shadow color
            spreadRadius: 2, // How much the shadow spreads
            blurRadius: 5, // Softness of the shadow
            offset: Offset(0, 3), // Changes the position of the shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('New Project?', style: AppTextStyles.heading2),
          SizedBox(height: 6),
          Text(
            'Let our AI help you plan the materials',
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyText,
          ),
          SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            child: ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Iconsax.star1, color: Colors.amber),
                  Text('AI Project Planner'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
