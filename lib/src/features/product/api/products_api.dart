import 'dart:convert';
import 'package:constructo_user/src/constants/strings.dart';
import 'package:constructo_user/src/features/product/model/product_details_model.dart';
import 'package:http/http.dart' as http;
import '../model/product_card_model.dart';

class ProductsApiServices {
  static Future<List<ProductsModel>> fetchProducts() async {
    final url = '${AppString.baseUrl}products';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 201 || response.statusCode == 200) {
        final Map<String, dynamic> jsonMap = jsonDecode(response.body);
        final List<dynamic> jsonList = jsonMap['data'];
        final productList = jsonList
            .map((json) => ProductsModel.fromJson(json))
            .toList();
        print(productList);
        return productList;
      } else {
        throw Exception(
          'Failed to load data. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Something went wrong in fetching product list. $e ');
    }
  }

  static Future<ProductDetailsModel> fetchProductById(int productId) async {
    final url = '${AppString.baseUrl}products/$productId';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonMap = jsonDecode(response.body);
        return ProductDetailsModel.fromJson(jsonMap['data']);
      } else {
        throw Exception(
          'Failed to load data. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Something went wrong in fetching product details. $e');
    }
  }
}
