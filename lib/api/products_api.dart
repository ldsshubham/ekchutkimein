import 'dart:convert';

import 'package:constructo_user/src/constants/strings.dart';
import 'package:http/http.dart' as http;

import '../models/products_models.dart';

class ProductsApiServices {
  static Future<List<dynamic>> fetchProducts() async {
    final url = '${AppString.baseUrl}/products';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonMap = jsonDecode(response.body);
        final List<dynamic> jsonList = jsonMap['data'];
        final productList = jsonList
            .map((json) => ProductsModel.fromJson(json))
            .toList();
        return productList;
      } else {
        throw Exception(
          'Failed to load data. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Something went wrong in fetching product details. ');
    }
  }
}
