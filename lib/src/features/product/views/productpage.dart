import 'package:constructo_user/src/constants/app_colors.dart';
import 'package:constructo_user/src/constants/app_text_styles.dart';
import 'package:constructo_user/src/features/home/widgets/appcategory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductPage extends StatelessWidget {
  final AppCategory product;
  const ProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    var count = 0.obs;
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
                    child: Image.asset(
                      product.imgPath,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    product.name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Price: ₹${product.price.toStringAsFixed(2)}',
                    style: TextStyle(color: Colors.green, fontSize: 20),
                  ),
                  SizedBox(height: 8),
                  Text(product.appDesc),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('In Stock: ', style: AppTextStyles.bodyText),
                          Text(
                            product.stock.toString(),
                            style: AppTextStyles.bodyText.copyWith(
                              color: AppColors.warning,
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
                              onPressed: () {
                                if (count > 0) count--;
                              },
                              icon: Icon(Iconsax.minus, color: AppColors.white),
                            ),
                          ),
                          SizedBox(width: 8),
                          Container(
                            width: 32,
                            alignment: Alignment.center,
                            child: Obx(
                              () => Text(
                                '${count.value}',
                                style: AppTextStyles.bodyText,
                              ),
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
                                count++;
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
