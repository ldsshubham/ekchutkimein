import 'package:constructo_user/src/features/farmers/api/services_api.dart';
import 'package:constructo_user/src/features/farmers/models/servicelist_model.dart';
import 'package:get/get.dart';

class ServiceController extends GetxController {
  var services = Rxn<ServicelistModel>();
  var servicesitem = Rxn<Service>();
  var isloading = false.obs;

  // Fetch Services lisrt

  Future<void> fetchServiceList() async {
    isloading.value = true;
    try {
      services.value = await ServicesApi.fetchServicesList();

      if (services.value == null) {
        throw Exception("no services is available is empty");
      }
    } catch (e) {
      print('Error fetching cart: $e');
    } finally {
      isloading.value = false;
    }
  }

  // Fetch specific services
  Future<void> fetchService(int id) async {
    try {
      isloading.value = true;
      servicesitem.value = await ServicesApi.fetchServiceDetails(id);
    } catch (e) {
      print("Error fetching service details: $e");
    } finally {
      isloading.value = false;
    }
  }
}
