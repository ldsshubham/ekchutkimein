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
          border: Border(
            right: BorderSide(color: AppColors.primaryColor, width: 1.5),
          ),
        ),
        width: 100,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 8),
          separatorBuilder: (context, index) => const Divider(height: 4),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
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
                  const SizedBox(height: 4),
                  Text(
                    category.cName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 12),
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
