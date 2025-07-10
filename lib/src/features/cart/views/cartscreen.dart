import 'package:constructo_user/src/constants/app_colors.dart';
import 'package:constructo_user/src/constants/app_sizes.dart';
import 'package:constructo_user/src/constants/app_text_styles.dart';
import 'package:constructo_user/src/features/home/widgets/appcategory.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Cart'),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 16, horizontal: 8),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    // Complete Card
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.white,
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: AppColors.gray,
                        //     spreadRadius: 1,
                        //     blurRadius: 6,
                        //     offset: Offset(0, 1), // x, y offset
                        //   ),
                        // ],
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),

                      // Both left and right container starts from here
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: AssetImage(appCategories[index].imgPath),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),

                          // Right Column for title and description starts from here
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  appCategories[index].name,
                                  style: AppTextStyles.bodyText.copyWith(
                                    fontSize: AppSizes.fontL,
                                  ),
                                ),
                                Text(
                                  appCategories[index].appDesc,
                                  style: AppTextStyles.bodyText.copyWith(
                                    fontSize: AppSizes.fontM,
                                    color: Colors.grey[700],
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                ),
                                // Title and description ends here
                                // Price and counter starts
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '₹ ${appCategories[index].price}',
                                      style: AppTextStyles.bodyText.copyWith(
                                        fontSize: AppSizes.fontL,
                                        color: AppColors.green,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Iconsax.minus,
                                            color: AppColors.error,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 24,

                                          // width: 24,
                                          child: Text(
                                            '0',
                                            style: AppTextStyles.bodyText
                                                .copyWith(
                                                  fontSize: AppSizes.fontM,
                                                ),
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {},
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
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 8);
                  },
                  itemCount: appCategories.length,
                ),
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Text('Total:', style: AppTextStyles.button,),
                    Text(
                      '₹ 10000',
                      style: AppTextStyles.heading2.copyWith(
                        fontSize: AppSizes.fontXL,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
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
        ),
      ),
    );
  }
}
