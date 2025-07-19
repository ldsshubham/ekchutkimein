

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../home/widgets/appcategory.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product, required this.widget
  });

  final AppCategory product;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => widget);
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
             
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Image.asset(
                    product.imgPath,
                    width: double.infinity,
                    height: constraints.maxWidth * 0.6, // Responsive height
                    fit: BoxFit.cover,
                  ),
                ),

                // Text and Price
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                     
                      // const SizedBox(height: 4),
                      Text(
                        product.appDesc,
                        style: const TextStyle(fontSize: 12),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      // const SizedBox(height: 8),
                      Text(
                        '₹${product.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
