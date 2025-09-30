import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Utils/UrlPage.dart';

class ApiServiceWeb {
  static Future<Map<String, dynamic>> staffLogin(Map<String, String> body) async {
    try {
      final response = await http
          .post(
        Uri.parse(ApiConfig.staffLogin),
        body: jsonEncode(body),
        headers: ApiConfig.headers,
      )
          .timeout(const Duration(seconds: 15)); // Timeout

      if (response.statusCode == 200) {
        // ✅ Parse JSON correctly
        final Map<String, dynamic> data = jsonDecode(response.body);

        // Ensure all keys exist
        return {
          "Status": data["Status"] ?? 0,
          "Msg": data["Msg"] ?? "No message",
          "event_id": data["event_id"] ?? 0,
          "cat_id": data["cat_id"] ?? "",
          "Key": data["Key"] ?? "",
        };
      } else {
        return {"Status": 0, "Msg": "Server Error: ${response.statusCode}"};
      }
    } catch (e) {
      return {"Status": 0, "Msg": e.toString()};
    }
  }
}
