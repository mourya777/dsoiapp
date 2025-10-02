import 'dart:convert';
import 'package:http/http.dart' as http;

import '../UtilsPage/UrlPage.dart';

class PinVerifyService {
  static Future<Map<String, dynamic>> verifyPin(body) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConfig.memberMpinSet),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      ).timeout(const Duration(seconds: 30));

      print("Pin Verify Status: ${response.statusCode}");
      print("Pin Verify Response: ${response.body}");

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return {"Status": 0, "Msg": "Failed to verify PIN"};
      }
    } catch (e) {
      print("Error in PIN Verify API: $e");
      return {"Status": 0, "Msg": "Error: $e"};
    }
  }
}
