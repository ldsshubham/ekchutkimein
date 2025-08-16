import 'package:get/get.dart';
import '../../categories/views/categoryscreen.dart';
import '../../cart/views/cartscreen.dart';
import '../../farmers/views/farmerscreen.dart';
import '../../profile/views/profilescreen.dart';
import '../../home/views/homepage.dart'; // ✅ NOT HomeScreen

class Bottomnavcontroller extends GetxController {
  var currentIndex = 0.obs;

  final pages = [
    HomePage(), // ✅ real content page
    CategoryScreen(),
    CartScreen(),
    FarmerScreen(),
    ProfileScreen(),
  ];

  void changeTabIndex(int index) {
    if (index != currentIndex.value) {
      currentIndex.value = index;
    }
  }
}
