import 'package:constructo_user/src/features/cart/model/cart_model.dart';
import 'package:get/get.dart';

import '../api/cart_api.dart';

class CartController extends GetxController {
  var cart = Rxn<CartModel>();
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCard();
  }

  Future<void> fetchCard() async {
    isLoading.value = true;
    try {
      cart.value = await CartApi.fetchCart();
      if (cart.value == null) {
        throw Exception('Cart is empty or not found');
      }
    } catch (e) {
      print('Error fetching cart: $e');
      // Handle error, e.g., show a message to the user
    } finally {
      isLoading.value = false;
    }
  }
}
