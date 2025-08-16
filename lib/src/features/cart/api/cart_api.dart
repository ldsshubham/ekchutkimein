import 'dart:convert';
import 'package:constructo_user/src/constants/strings.dart';
import 'package:constructo_user/src/features/cart/model/cart_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class CartApi {
  static Future<CartModel?> fetchCart() async {
    final storage = GetStorage();
    final token = storage.read('accessToken');
    final url = "${AppString.baseUrl}cart";

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
        if (jsonMap['status'] == 'success') {
          print('Ye chal rha hai');
          print(response.body);
          return CartModel.fromJson(jsonMap['data']);
        }
        throw Exception(
          'Failed to load cart data. Status: ${jsonMap['message']}',
        );
      } else {
        throw Exception(
          'Failed to load cart data. Status code: ${response.statusCode}',
        );
      }
    } catch (e, stackTrace) {
      print('Error type: ${e.runtimeType}');
      print('Error message: $e');
      print('Stack trace: $stackTrace');
      throw Exception('Something went wrong in fetching cart details. $e');
    }
  }

  static Future<CartModel?> deleteCart(int productId) async {
    final storage = GetStorage();
    final token = storage.read('accessToken');
    final url = "${AppString.baseUrl}cart/remove";

    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: {
          'Authorization': "Bearer $token",
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'productId': productId}),
      );
      if (response.statusCode == 200) {}
    } catch (e) {
      print('Error deleting cart item: $e');
      throw Exception('Failed to delete cart item');
    }
    return null;
  }
}
