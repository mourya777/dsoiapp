import 'dart:convert';
import 'package:http/http.dart' as http;
import '../UtilsPage/UrlPage.dart';
import '../wedgetPage/GlobleList.dart';

class OrderApiService {
  static Future<Map<String, dynamic>> orderNow() async {
    print('/////////////////////////////////${GlobalCart.cartData}');
    try {
      final response = await http.post(
        Uri.parse(ApiConfig.orderNow),
        headers: ApiConfig.headers,
        body: jsonEncode(GlobalCart.cartData),
      ).timeout(const Duration(seconds: 30));

      print("Order_Now Response Status: ${response.statusCode}");
      print("Order_Now Response Body: ${response.body}");

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to place order');
      }
    } catch (e) {
      print("Error in Order_Now API: $e");
      throw Exception('API error: $e');
    }
  }
}
