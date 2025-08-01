import 'dart:convert';
import 'package:constructo_user/src/constants/strings.dart';
import 'package:http/http.dart' as http;

class OtpApiServices {
  static Future<String> requestOTP(String mobileNumber) async {
    final uri = Uri.parse("${AppString.baseUrl}/request-otp");
    try {
      final response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"phone": mobileNumber}),
      );
      print(response.body);
      final Map<String, dynamic> res = jsonDecode(response.body);
      if (res['status'] == "success" && response.statusCode == 200) {
        return res['data']['otp'];
      } else {
        final errorMessge = res['message'] ?? 'Unknown Error';
        throw Exception(errorMessge);
      }
    } catch (e) {
      throw Exception('Error sending OTP: $e');
    }
  }
}
