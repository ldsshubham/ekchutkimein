import 'dart:convert';
import 'package:constructo_user/src/features/order/model/address_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../../constants/strings.dart';

class AddressApi {
  Future<List<Address>> fetchAddresses() async {
    final storage = GetStorage();
    final token = storage.read('accessToken');
    final url = "${AppString.baseUrl}customer/list_services";

    final response = await http.get(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      final addressResponse = AddressResponse.fromJson(jsonBody);
      return addressResponse.data;
    } else {
      throw Exception("Failed to fetch addresses: ${response.body}");
    }
  }
}
