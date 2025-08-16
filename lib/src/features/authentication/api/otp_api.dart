import 'dart:convert';
import 'package:constructo_user/src/constants/strings.dart';
import 'package:http/http.dart' as http;

class OtpApiServices {
  static Future<String> requestOTP(String mobileNumber) async {
    final uri = Uri.parse("${AppString.baseUrl}auth/request-otp");
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

  static Future<String> verifyOtp(String number, String otp) async {
    final uri = Uri.parse('${AppString.baseUrl}auth/verify-otp');

    try {
      final response = await http.post(
        uri,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"phone": number, "otp": otp}),
      );
      print(response.body);
      final Map<String, dynamic> res = jsonDecode(response.body);
      if (response.statusCode == 200 && res['status'] == "success") {
        print("This is access Token ${res['data']['accessToken']}");
        return res['data']['accessToken'];
      } else {
        final errorMessge = res['message'] ?? 'Unknown Error';
        throw Exception(errorMessge);
      }
    } catch (err) {
      print(err.toString());
      throw Exception("Error verifying otp: $err");
    }
  }
}
