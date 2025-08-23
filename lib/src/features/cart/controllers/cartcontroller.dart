import 'package:constructo_user/src/features/cart/model/cart_item_model.dart';
import 'package:constructo_user/src/features/cart/model/cart_model.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../api/cart_api.dart';

class CartController extends GetxController {
  var cart = Rxn<CartModel>();
  var cartItem = Rxn<CartItem>();
  var isLoading = false.obs;
  var stock = 1.obs;

  // Fetch Cart
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

  // Add To cart
  Future<void> addToCart(productId, quantity) async {
    try {
      isLoading.value = true;
      final result = await CartApi.addToCart(productId, quantity);
      cart.value = result;
      // Update cart data
      await fetchCard();
      Get.snackbar(
        "Success",
        "Product added to cart ✅",
        backgroundColor: AppColors.green,
        colorText: AppColors.white,
      );
    } catch (e) {
      Get.snackbar("Error", "Failed to add product: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // Update Cart
  Future<void> updateCart(productId, quantity) async {
    try {
      isLoading.value = true;
      print("ye ho gaya 1");
      final result = await CartApi.updateCart(productId, quantity);
      print("ye ho gaya 2");
      cart.value = result;
      await fetchCard();
      Get.snackbar(
        'Success',
        "Cart Updated",
        backgroundColor: AppColors.green,
        colorText: AppColors.white,
      );
    } catch (e) {
      print("Try is not running ${e.toString()}");
      Get.snackbar("Error", 'Failed to Update cart: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Delete cart

  Future<void> deleteFromCart(productid) async {
    try {
      isLoading.value = true;
      print('Delete kr rhe hai..............');
      final result = await CartApi.deleteCart(productid);
      cart.value = result;
      await fetchCard();
      Get.snackbar(
        "Success",
        "Poduct is removed from cart",
        backgroundColor: AppColors.warning,
        colorText: AppColors.white,
      );
      print('Sb chal gaya');
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
