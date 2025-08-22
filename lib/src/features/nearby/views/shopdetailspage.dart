import 'package:constructo_user/src/constants/app_text_styles.dart';
import 'package:constructo_user/src/features/product/views/featuredproduct.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../constants/app_colors.dart';

class Shopdetailspage extends StatelessWidget {
  const Shopdetailspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListView(
          children: [
            // Shop Image Container To show the images or logo
            ShopImageContainer(),
            SizedBox(height: 12),
            // Shop Name And Address
            ShopMainDetailsContainer(),
            SizedBox(height: 4),
            // Shop About And Description Box
            ShopAboutContainer(),
            SizedBox(height: 4),
            // Product by Shop
            Container(
              margin: EdgeInsets.symmetric(vertical: 4),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.gray.withAlpha(50),
                    blurRadius: 2,
                    spreadRadius: 1,
                    blurStyle: BlurStyle.normal,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Products',
                    style: AppTextStyles.heading2.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.secondaryColor,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 4),
                  FeaturedProductList(physics: NeverScrollableScrollPhysics()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShopAboutContainer extends StatelessWidget {
  const ShopAboutContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.gray.withAlpha(50),
            blurRadius: 2,
            spreadRadius: 1,
            blurStyle: BlurStyle.normal,
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About Us',
            style: AppTextStyles.heading2.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.secondaryColor,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 4),
          Text(
            style: TextStyle(color: AppColors.secondaryColor.withAlpha(150)),
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          ),
        ],
      ),
    );
  }
}

class ShopMainDetailsContainer extends StatelessWidget {
  const ShopMainDetailsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.gray.withAlpha(50),
            blurRadius: 2,
            spreadRadius: 1,
            blurStyle: BlurStyle.normal,
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Shop Name',
                style: AppTextStyles.heading1.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.secondaryColor,
                  fontSize: 24,
                ),
              ),
              SizedBox(width: 4),
              Icon(Iconsax.verify5, color: Colors.blue),
            ],
          ),
          SizedBox(height: 4),
          Text('South Delhi, New Delhi, 221304,'),
        ],
      ),
    );
  }
}

class ShopImageContainer extends StatelessWidget {
  const ShopImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.green,
        boxShadow: [
          BoxShadow(
            color: AppColors.gray.withAlpha(50),
            blurRadius: 2,
            spreadRadius: 2,
            blurStyle: BlurStyle.normal,
          ),
        ],
      ),
      child: Center(child: Icon(Iconsax.gallery)),
    );
  }
}
