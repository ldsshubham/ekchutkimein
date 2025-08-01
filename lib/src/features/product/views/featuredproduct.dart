import 'package:constructo_user/src/features/home/controller/productcontroller.dart';
import 'package:constructo_user/src/features/product/views/productcard.dart';
import 'package:constructo_user/src/features/product/views/productpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class FeaturedProductList extends StatelessWidget {
  final ProductController controller = Get.put(ProductController());
  final String? categoryId;
  final ScrollPhysics physics;

  FeaturedProductList({super.key, this.categoryId, required this.physics});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        // Show shimmer placeholders while loading
        return GridView.builder(
          shrinkWrap: false,
          physics: physics,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: .7,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            return Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            );
          },
        );
      } else {
        // Actual data
        return GridView.builder(
          shrinkWrap: true,
          physics: physics,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: .7,
          ),
          itemCount: controller.productsList.length,
          itemBuilder: (context, index) {
            final product = controller.productsList[index];
            return ProductCard(
              product: product,
              widget: ProductPage(product: product),
            );
          },
        );
      }
    });
  }
}
