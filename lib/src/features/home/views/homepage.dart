import 'package:constructo_user/src/features/nearby/views/nearbyshoplist.dart';
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
      child: ListView(
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

                Text('Nearby', style: AppTextStyles.heading2),
                SizedBox(height: 16),
                Nearbyshoplist(),
                SizedBox(height: 16),
                // Featured product list
                Text('Featured Product', style: AppTextStyles.heading2),
                SizedBox(height: 16),
                FeaturedProductList(physics: NeverScrollableScrollPhysics()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
