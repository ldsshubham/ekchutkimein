import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';
import '../controllers/categories_controller.dart';

class LeftContainer extends StatelessWidget {
  final CategoriesController controller = Get.put(CategoriesController());
  LeftContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = controller.categories;
    return Expanded(
      flex: 0,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.gray.withAlpha(50),
              offset: Offset.zero,
              blurRadius: 1,
              spreadRadius: .1,
            ),
          ],
        ),
        width: 80,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8),

          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return Container(
              height: 96,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
                              category.cName.isNotEmpty
                                  ? category.cName[0].toUpperCase()
                                  : '?',
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Expanded(
                    child: Text(
                      category.cName,
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
            );
          },
        ),
      ),
    );
  }
}
