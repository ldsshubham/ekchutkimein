import 'package:constructo_user/src/features/home/widgets/appcategory.dart';
import 'package:constructo_user/src/features/product/views/featuredproduct.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Categories",

          ),
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

            // Right Product Grid
            // Expanded(
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: GridView.builder(
            //       itemCount: 10, // Set your number of products
            //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 2,
            //         mainAxisSpacing: 8,
            //         crossAxisSpacing: 8,
            //         childAspectRatio: .75,
            //       ),
            //       itemBuilder: (context, index) {
            //         return const FeaturedProductList();
            //       },
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class LeftContainer extends StatelessWidget {
  const LeftContainer({super.key});

  @override
  Widget build(BuildContext context) {
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
          itemCount: appCategories.length,
          itemBuilder: (context, index) {
            final category = appCategories[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: SizedBox(
                      width: 52,
                      height: 52,
                      child: Image.asset(category.imgPath, fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(category.name, style: const TextStyle(fontSize: 12)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
