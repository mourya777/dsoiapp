import 'dart:convert';
import 'package:http/http.dart' as http;
import '../UtilsPage/UrlPage.dart';

class PinService {
  static Future<Map<String, dynamic>> setPin({
    required String body,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConfig.memberMpinSet),
        headers: ApiConfig.headers,
        body: body,
      ).timeout(const Duration(seconds: 30));

      print("PIN Set Status: ${response.statusCode}");
      print("PIN Set Response: ${response.body}");

      if (response.statusCode == 200) {

        return jsonDecode(response.body);
      } else {
        return {"Status": 0, "Msg": "Failed to set PIN"};
      }
    } catch (e) {
      print("Error in PIN Set API: $e");
      return {"Status": 0, "Msg": "Error: $e"};
    }
  }
}
