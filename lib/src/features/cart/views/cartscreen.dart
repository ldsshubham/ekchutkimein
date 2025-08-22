import 'package:constructo_user/src/constants/app_colors.dart';
import 'package:constructo_user/src/constants/app_sizes.dart';
import 'package:constructo_user/src/constants/app_text_styles.dart';
import 'package:constructo_user/src/features/product/views/productpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../product/controller/productcontroller.dart';
import '../controllers/cartcontroller.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CartScreen extends StatelessWidget {
  final CartController cartController = Get.put(CartController());
  final ProductController controller = Get.put(ProductController());

  CartScreen({super.key});
  Future<void> _refreshCart() async {
    await cartController.fetchCard(); // calls your API again
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Obx(() {
          if (cartController.isLoading.value) {
            return Center(
              child: LoadingAnimationWidget.waveDots(
                color: AppColors.primaryColor,
                size: 50,
              ),
            );
          }

          if (cartController.cart.value == null ||
              cartController.cart.value!.items.isEmpty) {
            return RefreshIndicator(
              onRefresh: _refreshCart,
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                  Center(child: Text("Your cart is empty")),
                ],
              ),
            );
          }

          final cart = cartController.cart.value!;

          return RefreshIndicator(
            color: AppColors.primaryColor,
            onRefresh: _refreshCart,
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      final item = cart.items[index];
                      // final product = controller.productsList[index];
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => ProductPage(ProductId: item.productId));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.white,
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                          child: Row(
                            children: [
                              // Placeholder image since API doesn't return one
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.grey[300],
                                ),
                                child: const Icon(
                                  Iconsax.shopping_bag,
                                  size: 40,
                                ),
                              ),
                              const SizedBox(width: 12),

                              // Product details
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          item.productName,
                                          style: AppTextStyles.bodyText
                                              .copyWith(
                                                fontSize: AppSizes.fontL,
                                              ),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            size: 24,
                                            Iconsax.trash,
                                            color: AppColors.error,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "Product Description",
                                      style: AppTextStyles.bodyText.copyWith(
                                        fontSize: AppSizes.fontM,
                                        color: Colors.grey[700],
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '₹ ${item.price}',
                                          style: AppTextStyles.bodyText
                                              .copyWith(
                                                fontSize: AppSizes.fontL,
                                                color: AppColors.green,
                                              ),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                // handle decrease qty
                                              },
                                              icon: Icon(
                                                Iconsax.minus,
                                                color: AppColors.error,
                                              ),
                                            ),
                                            Text(
                                              item.quantity.toString(),
                                              style: AppTextStyles.bodyText
                                                  .copyWith(
                                                    fontSize: AppSizes.fontM,
                                                  ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                // handle increase qty
                                              },
                                              icon: Icon(
                                                Iconsax.add,
                                                color: AppColors.primaryColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8),
                    itemCount: cart.items.length,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '₹ ${cart.totalCartprice.finalAmount}',
                        style: AppTextStyles.heading2.copyWith(
                          fontSize: AppSizes.fontXL,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // checkout function here
                        },
                        child: Row(
                          children: const [
                            Text('Checkout'),
                            SizedBox(width: 10),
                            Icon(Iconsax.arrow_right_1),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
