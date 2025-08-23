import 'package:constructo_user/src/features/order/model/address_model.dart';
import 'package:get/get.dart';
import '../api/address_api.dart';

class AddressController extends GetxController {
  final AddressApi api;

  AddressController({required this.api});

  var addresses = <Address>[].obs;
  var isLoading = false.obs;
  var errorMessage = "".obs;

  Future<void> loadAddresses() async {
    try {
      isLoading.value = true;
      errorMessage.value = "";
      final result = await api.fetchAddresses();
      addresses.assignAll(result);
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
