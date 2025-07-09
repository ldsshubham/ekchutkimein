import 'package:constructo_user/src/features/product/views/productcard.dart';
import 'package:flutter/material.dart';
import '../../home/widgets/appcategory.dart';

class FeaturedProductList extends StatelessWidget {
  const FeaturedProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing:8,
        crossAxisSpacing: 8,
        childAspectRatio: .75,
      ),
    
      itemCount: appCategories.length,
      itemBuilder: (context, index) {
        final product = appCategories[index];
        // print('Product: ${product.name}, Desc: ${product.appDesc}, Img: ${product.imgPath}');
        return ProductCard(product: product);
      },
    );
  }
}