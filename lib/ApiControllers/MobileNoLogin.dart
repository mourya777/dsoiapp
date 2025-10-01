import 'dart:convert';
import 'package:http/http.dart' as http;
import '../UtilsPage/UrlPage.dart';

class MobileNumberService {
  static Future<Map<String, dynamic>> verifyMobile(String mobileNumber) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConfig.mobileNumberCheck),
        headers: ApiConfig.headers,
        body: jsonEncode({"member_mobile": mobileNumber}),
      );

      print("Mobile Verification Status: ${response.statusCode}");
      print("Mobile Verification Response: ${response.body}");

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return {"Status": 0, "Msg": "Failed to verify mobile number"};
      }
    } catch (e) {
      print("Error in Mobile Verification API: $e");
      return {"Status": 0, "Msg": "API error: $e"};
    }
  }

  static Future<Map<String, dynamic>> verifyOtp({
    required String memberId,
    required String otp,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConfig.mobileNumberCheck),
        headers: ApiConfig.headers,
        body: jsonEncode({
          "member_id": memberId,
          "member_otp": otp,
        }),
      );

      print("OTP Verify Status: ${response.statusCode}");
      print("OTP Verify Response: ${response.body}");

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return {"Status": 0, "Msg": "OTP verification failed"};
      }
    } catch (e) {
      print("Error in OTP Verify API: $e");
      return {"Status": 0, "Msg": "API error: $e"};
    }
  }
}
