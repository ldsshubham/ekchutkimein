import 'package:constructo_user/src/features/product/api/products_api.dart';
import 'package:constructo_user/src/features/product/model/product_details_model.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  var productDetails = Rxn<ProductDetailsModel>();
  var isLoading = true.obs;
  final int productId;
  ProductDetailsController(this.productId);

  @override
  void onInit() {
    super.onInit();
    fetchProductById();
  }

  void fetchProductById() async {
    try {
      isLoading.value = true;
      final result = await ProductsApiServices.fetchProductById(productId);
      productDetails.value = result;
    } catch (e) {
      print(e.toString());
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
