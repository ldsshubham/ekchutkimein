import 'dart:convert';

import 'package:constructo_user/models/categories_model.dart';
import 'package:constructo_user/models/products_models.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static const String baseUrl = 'http://jsmglobe.com:5000/api';

  // Fetching category
  static Future<List<CategoryModel>> fetchCategories() async {
    final url = '${baseUrl}/categories';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonMap = jsonDecode(response.body);
        // Extract the 'data' key, which holds the actual list
        final List<dynamic> jsonList = jsonMap['data'];
        final categoryList = jsonList
            .map((json) => CategoryModel.fromJson(json))
            .toList();
        return categoryList;
      } else {
        throw Exception(
          'Failed to load data. Status code : ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Error handling fetching categories');
    }
  }

  // Fetching product
  static Future<List<dynamic>> fetchProducts() async {
    final url = '$baseUrl/products';
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
