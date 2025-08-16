import 'package:constructo_user/src/features/product/controller/productcontroller.dart';
import 'package:constructo_user/src/features/product/model/product_card_model.dart';
import 'package:constructo_user/src/constants/app_colors.dart';
import 'package:constructo_user/src/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductPage extends StatelessWidget {
  final ProductController controller = Get.put(ProductController());
  final ProductsModel product;
  ProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    controller.fetchProductById(product.productId);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Iconsax.arrow_left),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(24, 32, 24, 32),
          child: Builder(
            builder: (context) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(12),
                    child:
                        product.productImg != null &&
                            product.productImg!.isNotEmpty
                        ? Image.network(
                            product.productImg!,
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey.shade200,
                                height: 200,
                                child: Icon(Icons.image_not_supported),
                              );
                            },
                          )
                        : Container(
                            color: Colors.grey.shade200,
                            height: 200,
                            width: double.infinity,
                            child: Icon(Icons.image, size: 40),
                          ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    product.productName,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Price: ₹${product.productPrice}',
                    style: TextStyle(color: Colors.green, fontSize: 20),
                  ),
                  SizedBox(height: 8),
                  Text(product.productDescription),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('In Stock: ', style: AppTextStyles.bodyText),
                          Text(
                            product.productId > 0 ? "Yes" : "No",
                            style: AppTextStyles.bodyText.copyWith(
                              color: product.productId > 10
                                  ? AppColors.green
                                  : AppColors.error,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.error,
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Iconsax.minus, color: AppColors.white),
                            ),
                          ),
                          SizedBox(width: 8),
                          Container(
                            width: 32,
                            alignment: Alignment.center,
                            child: Obx(
                              () => Text('0', style: AppTextStyles.bodyText),
                            ),
                          ),
                          SizedBox(width: 8),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.success,
                            ),
                            child: IconButton(
                              onPressed: () {
                                // if (count < product.productId) {
                                //   count++;
                                // } else {
                                //   Get.snackbar(
                                //     'Error',
                                //     'Cannot add more than available stock',
                                //     backgroundColor: AppColors.warning,
                                //     colorText: AppColors.white,
                                //     snackPosition: SnackPosition.TOP,
                                //   );
                                // }
                              },
                              icon: Icon(Iconsax.add, color: AppColors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Add to cart'),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text('Buy Now'),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
