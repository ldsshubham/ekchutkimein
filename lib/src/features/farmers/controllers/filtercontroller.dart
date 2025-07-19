import 'package:get/get.dart';

class FilterController extends GetxController {
  var selectedAvailability = ''.obs;
  var selectedPrice = ''.obs;
  var selectedDate = Rxn<DateTime>();

  void clearFilters() {
    selectedAvailability.value = '';
    selectedPrice.value = '';
    selectedDate.value = null;
  }
}
