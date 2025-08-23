import 'dart:convert';
import 'package:constructo_user/src/constants/strings.dart';
import 'package:constructo_user/src/features/farmers/models/servicelist_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ServicesApi {
  // Fetch Services list
  static Future<ServicelistModel> fetchServicesList() async {
    final storage = GetStorage();
    final token = storage.read('accessToken');
    final url = "${AppString.baseUrl}customer/list_services";

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': "Bearer $token",
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonMap = jsonDecode(response.body);
        if (jsonMap["status"] == "success") {
          print("ye chal rha hai ");
          print(response.body);
          return ServicelistModel.fromJson(jsonMap);
        }
        throw Exception('Failed to get the list ${response.body}');
      } else {
        throw Exception(
          'Failed to load cart data. Status code: ${response.body}',
        );
      }
    } catch (e) {
      print('Ye na hone paaye');
      print(e.toString());
      throw Exception('Something went wrong in fetching cart details. $e');
    }
  }

  // Fetch specific service details

  static Future<Service> fetchServiceDetails(int id) async {
    final storage = GetStorage();
    final token = storage.read('accessToken');
    final url = "${AppString.baseUrl}customer/service_details/$id";

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': "Bearer $token",
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonMap = jsonDecode(response.body);
        if (jsonMap['status'] == "success") {
          print('yaha tk to ho gaya hai ');
          print(response.body);
          return Service.fromJson(jsonMap['data']);
        }
        throw Exception('Failed to get the list ${response.body}');
      } else {
        throw Exception('Failed to get the list ${response.body}');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Something went wrong in fetching cart details. $e');
    }
  }
}
