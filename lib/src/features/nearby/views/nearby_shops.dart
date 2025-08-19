import 'dart:math';

import 'package:constructo_user/src/constants/app_colors.dart';
import 'package:constructo_user/src/constants/app_text_styles.dart';
import 'package:constructo_user/src/features/categories/controllers/categories_controller.dart';
import 'package:constructo_user/src/features/nearby/views/nearby.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NearbyShopsList extends StatelessWidget {
  final CategoriesController controller = Get.put(CategoriesController());
  final Axis scrollDirection;
  NearbyShopsList({super.key, required this.scrollDirection});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      // padding: EdgeInsets.all(8), // Adjust height as needed
      child: Obx(() {
        if (controller.isLoading.value) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: AppColors.gray.withAlpha(125),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(height: 4),
                  Container(
                    width: 40,
                    height: 10,
                    decoration: BoxDecoration(
                      color: AppColors.gray.withAlpha(125),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        final categories = controller.categories;
        return ListView.builder(
          scrollDirection: scrollDirection,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return GestureDetector(
              onTap: () {
                Get.to(() => NearbyScreen());
              },
              child: Container(
                width: 60,
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                          color: Color(0xFF000000 + Random().nextInt(0xFFFFFF)),
                        ),
                        child: Image.network(
                          '${category.cImg}',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, StackTrace) {
                            return Center(
                              child: Text(
                                style: AppTextStyles.heading1.copyWith(
                                  color: AppColors.white,
                                ),
                                '${index + 1}',
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    // const SizedBox(height: 6),
                    Expanded(
                      child: Text(
                        "Shop ${index + 1}",

                        softWrap: true,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          height: 1.2, // line height
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
