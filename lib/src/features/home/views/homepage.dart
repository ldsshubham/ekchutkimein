import 'package:flutter/material.dart';

import '../../../constants/app_text_styles.dart';
import '../../product/views/featuredproduct.dart';
import '../widgets/aigeneratorbox.dart';
import '../widgets/categorylist.dart';
import '../widgets/customappbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Appbar Customer
            CustomAppBar(),
            SizedBox(height: 16),
            AiGeneratorBox(),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Categories', style: AppTextStyles.heading2),
                  SizedBox(height: 16),
                  // Horizontal ListView with fixed height
                  CategoryList(scrollDirection: Axis.horizontal),
                  // Featured product list
                  SizedBox(height: 16),

                  Text('Featured Product', style: AppTextStyles.heading2),

                  SizedBox(height: 16),
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
