import 'package:constructo_user/src/features/home/widgets/appcategory.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  final Axis scrollDirection;
  const CategoryList({
    super.key, required this.scrollDirection,
  });

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      height: 72, // Adjust height as needed
      child: ListView.builder(
        scrollDirection: scrollDirection,
        itemCount: appCategories.length,
        itemBuilder: (context, index) {
          final category = appCategories[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: SizedBox(
                    width: 52,
                    height: 52,
                    child: Image.asset(
                      category.imgPath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                
                Text(
                  category.name,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
