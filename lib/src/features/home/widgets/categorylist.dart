import 'dart:math';

import 'package:constructo_user/src/constants/app_colors.dart';
import 'package:constructo_user/src/constants/app_text_styles.dart';
import 'package:constructo_user/src/features/categories/controllers/categories_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryList extends StatelessWidget {
  final CategoriesController controller = Get.put(CategoriesController());
  final Axis scrollDirection;
  CategoryList({super.key, required this.scrollDirection});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72, // Adjust height as needed
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
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                      child: Center(
                        child: Text(
                          style: AppTextStyles.heading1.copyWith(
                            color: AppColors.white,
                          ),
                          category.cName.isNotEmpty
                              ? category.cName[0].toUpperCase()
                              : '?',
                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(height: 6),
                  Text(
                    category.cName,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12),
                    maxLines: 2, // Limit to 2 lines
                    overflow:
                        TextOverflow.ellipsis, // Add ellipsis if it overflows
                    softWrap: true,
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
