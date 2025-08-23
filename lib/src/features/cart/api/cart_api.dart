import 'dart:convert';
import 'package:constructo_user/src/constants/strings.dart';
import 'package:constructo_user/src/features/cart/model/cart_item_model.dart';
import 'package:constructo_user/src/features/cart/model/cart_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class CartApi {
  // Fetch Cart
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

  // Delete Cart
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
      if (response.statusCode == 200) {
        print('chal rha hai sahi sahi ');
        final data = jsonDecode(response.body);

        if (data['status'] == "success") {
          return CartModel.fromJson(data);
        } else {
          print("Kuchh to fata hai ...........");
          throw Exception(data['message'] ?? response.statusCode);
        }
      }
    } catch (e) {
      print('Error deleting cart item: $e');
      throw Exception('Failed to delete cart item');
    }
    return null;
  }

  // Add To Cart
  static Future<CartModel> addToCart(productId, quantity) async {
    final storage = GetStorage();
    final token = storage.read('accessToken');
    final url = "${AppString.baseUrl}cart/add";

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': "Bearer $token",
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'product_id': productId, 'quantity': quantity}),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);

        if (data['cart'] != null) {
          return CartModel.fromJson(data);
        } else {
          throw Exception(data['message'] ?? 'Unknown response');
        }
      } else {
        throw Exception(
          "Failed to add to cart. Status code: ${response.statusCode}",
        );
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  // Update cart
  static Future<CartModel> updateCart(productId, quantity) async {
    final storage = GetStorage();
    final token = storage.read('accessToken');
    final url = "${AppString.baseUrl}cart/update";

    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {
          "Authorization": 'Bearer $token',
          "Content-Type": 'application/json',
        },
        body: jsonEncode({'product_id': productId, 'quantity': quantity}),
      );
      print('ye to chal rha hai0');
      if (response.statusCode == 200) {
        print('ye to chal rha hai1');
        final data = jsonDecode(response.body);

        if (data['status'] == "success") {
          return CartModel.fromJson(data);
        } else {
          throw Exception(data['message'] ?? 'Unknown response ');
        }
      } else {
        print('ab ye kyo chalne laga ${response.body}');
        throw Exception(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
