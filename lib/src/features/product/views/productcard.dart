import 'package:constructo_user/src/features/product/model/product_card_model.dart';
import 'package:constructo_user/src/features/product/views/productpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';

class ProductCard extends StatelessWidget {
  final ProductsModel product;
  final Widget widget;
  ProductCard({super.key, required this.product, required this.widget});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductPage());
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
                  child:
                      product.productImg != null &&
                          product.productImg!.isNotEmpty
                      ? Image.network(
                          product.productImg!,
                          width: double.infinity,
                          height: constraints.maxWidth * 0.6,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey.shade200,
                              height: constraints.maxWidth * 0.6,
                              child: Icon(Icons.image_not_supported),
                            );
                          },
                        )
                      : Container(
                          color: Colors.grey.shade200,
                          height: constraints.maxWidth * 0.6,
                          width: double.infinity,
                          child: Icon(Icons.image, size: 40),
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
                        product.productName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      // const SizedBox(height: 4),
                      Text(
                        product.productDescription,
                        style: const TextStyle(fontSize: 12),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      // const SizedBox(height: 8),
                      Text(
                        '₹${product.productPrice}',
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
