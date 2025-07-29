import 'dart:convert';

import 'package:constructo_user/models/categories_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static const String baseUrl = 'http://jsmglobe.com:5000/api';

  static Future<List<Categories>> fetchCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/categories'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonMap = jsonDecode(response.body);

      // Extract the 'data' key, which holds the actual list
      final List<dynamic> jsonList = jsonMap['data'];

      final categoryList = jsonList
          .map((json) => Categories.fromJson(json))
          .toList();

      return categoryList;
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<List<dynamic>> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
