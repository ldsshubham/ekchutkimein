import 'package:constructo_user/src/constants/app_colors.dart';
import 'package:constructo_user/src/features/order/views/order_summary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              // height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Image
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    height: 200,
                    child: Center(
                      child: Icon(Icons.shopping_bag_outlined, size: 150),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  // Product Name
                  Text(
                    'Product Name lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w200),
                  ),
                  SizedBox(height: 8.0),
                  // Product Name
                  Text(
                    '₹999',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w100,
                      color: AppColors.error,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: AppColors.error,
                      decorationThickness: 2,
                    ),
                  ),
                  Text(
                    '₹999',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: AppColors.green,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  // Product Description
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                    'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                    'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          // Add to Cart Button
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Iconsax.shopping_cart5),
                        Text('Add to Cart'),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => OrderSummary());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Icon(Iconsax.shopping_bag), Text('Buy Now')],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
