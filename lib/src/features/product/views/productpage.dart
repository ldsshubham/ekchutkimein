import 'package:constructo_user/src/constants/app_colors.dart';
import 'package:constructo_user/src/constants/strings.dart';
import 'package:constructo_user/src/features/cart/controllers/cartcontroller.dart';
import 'package:constructo_user/src/features/order/views/addresses.dart';
import 'package:constructo_user/src/features/product/controller/product_details_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ProductPage extends StatelessWidget {
  final int ProductId;
  const ProductPage({super.key, required this.ProductId});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    final controller = Get.put(ProductDetailsController(ProductId));
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: LoadingAnimationWidget.waveDots(
              color: AppColors.primaryColor,
              size: 24,
            ),
          );
        }
        final product = controller.productDetails.value;
        if (product == null) {
          return Center(child: Text('No data found'));
        }
        return Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * .25,
                      decoration: BoxDecoration(
                        color: AppColors.gray,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Iconsax.gallery),
                    ),
                    SizedBox(height: 8),
                    Text(
                      product.productName,
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      product.categoryName,
                      style: TextStyle(color: AppColors.green, fontSize: 16),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "${AppString.ruppee} ${product.price}",
                      style: TextStyle(
                        color: AppColors.error,
                        fontSize: 12,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: AppColors.error,
                      ),
                    ),
                    Text(
                      "${AppString.ruppee} ${product.finalPrice}",
                      style: TextStyle(
                        color: AppColors.green,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "In Stock: ${product.stock}",
                      style: TextStyle(
                        color: product.stock > 0
                            ? AppColors.green
                            : AppColors.error,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      product.productDesc,
                      style: TextStyle(color: AppColors.gray),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        cartController.addToCart(product.productId, 1);
                      },
                      child: Text('Add To Cart'),
                    ),
                  ),
                  SizedBox(width: 4),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => AddressScreen());
                      },
                      child: Text('Buy Now'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
