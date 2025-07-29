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
        return Expanded(
          child: ListView.builder(
            scrollDirection: scrollDirection,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: SizedBox(
                        width: 52,
                        height: 52,

                        // child: Image.asset(category.imgPath, fit: BoxFit.cover),
                        child: Center(
                          child: Text(
                            style: AppTextStyles.heading1,
                            category.cName.isNotEmpty
                                ? category.cName[0].toUpperCase()
                                : '?',
                          ),
                        ),
                      ),
                    ),

                    Text(category.cName, style: TextStyle(fontSize: 12)),
                  ],
                ),
              );
            },
          ),
        );
      }),

      // ListView.builder(
      //   scrollDirection: scrollDirection,
      //   itemCount: appCategories.length,
      //   itemBuilder: (context, index) {
      //     final category = controller.categories;
      //     return Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 8),
      //       child: Column(
      //         children: [
      //           ClipRRect(
      //             borderRadius: BorderRadius.circular(50),
      //             child: SizedBox(
      //               width: 52,
      //               height: 52,
      //               child: Image.asset(category.imgPath, fit: BoxFit.cover),
      //             ),
      //           ),

      //           Text(category.name, style: TextStyle(fontSize: 12)),
      //         ],
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
