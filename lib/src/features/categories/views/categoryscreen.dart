import 'package:constructo_user/src/constants/app_text_styles.dart';

import 'package:constructo_user/src/features/product/views/featuredproduct.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../controllers/categories_controller.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Categories"),
      ),

      body: SafeArea(
        child: Row(
          children: [
            // Left Category List
            LeftContainer(),
            Expanded(
              child: Container(
                height: double.infinity,
                padding: EdgeInsets.all(8),
                child: FeaturedProductList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
                    child: SizedBox(
                      width: 52,
                      height: 52,
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
                  const SizedBox(height: 4),
                  Text(category.cName, style: const TextStyle(fontSize: 12)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
