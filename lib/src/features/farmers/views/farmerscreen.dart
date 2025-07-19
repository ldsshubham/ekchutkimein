import 'package:constructo_user/src/features/farmers/views/servicepage.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../home/widgets/appcategory.dart';
import '../../product/views/productcard.dart';

class FarmerScreen extends StatelessWidget {
  const FarmerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agricultural Services'),
      ),
      body: Padding(padding: EdgeInsetsGeometry.all(8),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.search_normal)
            ),
          ),SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: GridView.builder(
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
              return ProductCard(product: product, widget: Servicepage(service: product),);
                      },
                    ),
            ),
          )
        ],
      ),),
    );
  }
}