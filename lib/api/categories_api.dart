import 'dart:convert';
import 'package:http/http.dart' as http;
import '../src/constants/strings.dart';
import '../models/categories_model.dart';

class CategoriesApiServices {
  static Future<List<CategoryModel>> fetchCategories() async {
    final url = '${AppString.baseUrl}/categories';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonMap = jsonDecode(response.body);
        // Extract the 'data' key, which holds the actual list
        final List<dynamic> jsonList = jsonMap['data'];
        final categoryList = jsonList
            .map((json) => CategoryModel.fromJson(json))
            .toList();
        print(response.body);
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
}
