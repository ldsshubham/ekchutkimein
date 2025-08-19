import 'package:constructo_user/src/constants/app_colors.dart';
import 'package:constructo_user/src/features/order/views/addresses.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order Summary')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                    child: Row(
                      children: [
                        // Image Section
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.gray.withAlpha(125),
                          ),
                          height: 75,
                          width: 75,
                          child: Icon(Iconsax.image, size: 48),
                        ),
                        SizedBox(width: 4),

                        // Product Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Product Name',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    '₹999',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  color: AppColors.gray.withAlpha(50),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Iconsax.minus,
                                        color: AppColors.warning,
                                      ),
                                    ),
                                    SizedBox(child: Text('1')),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Iconsax.add,
                                        color: AppColors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => AddressScreen());
                },
                child: Text('Proceed To Checkout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
