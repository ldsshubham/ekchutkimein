import 'package:constructo_user/src/constants/app_colors.dart';
import 'package:constructo_user/src/features/home/controller/bottomnavcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final Bottomnavcontroller controller = Get.put(Bottomnavcontroller());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        drawer: Drawer(backgroundColor: AppColors.white),
        body: controller
            .pages[controller.currentIndex.value], // ✅ this is a widget
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex.value, // ✅ fixed here
          onTap: controller.changeTabIndex, // ✅ and here
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Iconsax.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.category),
              label: 'Category',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.location),
              label: 'Nearby',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(icon: Icon(Iconsax.tree), label: 'Farmer'),
            BottomNavigationBarItem(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
