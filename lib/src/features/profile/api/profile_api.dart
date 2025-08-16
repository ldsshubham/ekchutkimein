import 'package:constructo_user/src/constants/strings.dart';
import 'package:constructo_user/src/features/profile/models/profile_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfileApi {
  static Future<UserProfile> fetchProfile(token) async {
    final url = '${AppString.baseUrl}customer/profile';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': ' Bearer $token',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonMap = jsonDecode(response.body);
        final Map<String, dynamic> jsonList = jsonMap['data']['user'];
        print(response.body);
        return UserProfile.fromJson(jsonList);
      } else if (response.statusCode == 401) {
        throw Exception('Unauthorized access. Please check your token.');
      } else {
        throw Exception(
          'Failed to load profile. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Error handling fetching profile: $e');
    }
  }
}
