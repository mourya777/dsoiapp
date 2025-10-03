import 'dart:convert';
import 'package:http/http.dart' as http;
import '../UtilsPage/UrlPage.dart'; // ApiConfig ka path

class TransactionApiService {
  static Future<List<Map<String, dynamic>>> fetchTransactions(body) async {
    try {

      final response = await http.post(
        Uri.parse(ApiConfig.memberTransactionDateWise),
        headers: ApiConfig.headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data is Map && data["order"] != null) {
          return List<Map<String, dynamic>>.from(data["order"]);
        } else {
          return [];
        }
      } else {
        print("API Error: ${response.statusCode}");
        return [];
      }
    } catch (e) {
      print("API Exception: $e");
      return [];
    }
  }
}
