import 'package:constructo_user/api/products_api.dart';
import 'package:constructo_user/models/products_models.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var productsList = <ProductsModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      isLoading.value = true;
      final result = await ProductsApiServices.fetchProducts();
      productsList.value = result;
      print(result);
    } catch (e) {
      print(e.toString());
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
