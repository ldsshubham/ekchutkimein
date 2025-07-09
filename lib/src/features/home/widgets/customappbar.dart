import 'package:constructo_user/src/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Builder(
              //   builder: (context) => IconButton(
              //     onPressed: () {
              //       // Scaffold.of(context).openDrawer();
              //     },
              //     icon: Icon(Iconsax.menu, color: AppColors.white),
              //   ),
              // ),
                  IconButton(onPressed: (){}, icon:Icon(Iconsax.user), color: AppColors.white),
              // Row(
              //   children: [
              //     SizedBox(width: 16),
                 
              //     IconButton(onPressed: (){}, icon:Icon(Iconsax.notification), color: AppColors.white),
              //   ],
              // ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                
              ]
            ),
            padding: EdgeInsets.only(left: 8, right: 8),
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Iconsax.search_normal),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
