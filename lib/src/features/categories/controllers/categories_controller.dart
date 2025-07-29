import 'package:constructo_user/config/api_services.dart';
import 'package:constructo_user/models/categories_model.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  var categories = <Categories>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  void fetchCategories() async {
    try {
      isLoading.value = true;
      final result = await ApiServices.fetchCategories();
      categories.value = result;
      print(result);
    } catch (e) {
      print(e.toString());
      Get.snackbar('Error 11', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
