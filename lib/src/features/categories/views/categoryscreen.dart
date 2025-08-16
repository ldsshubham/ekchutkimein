import 'package:constructo_user/src/features/categories/widgets/LeftContainer.dart';
import 'package:constructo_user/src/features/product/views/featuredproduct.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Categories"),
      ),

      body: SafeArea(
        child: Row(
          children: [
            // Left Category List
            LeftContainer(),
            // Right category list
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FeaturedProductList(
                  physics: AlwaysScrollableScrollPhysics(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
