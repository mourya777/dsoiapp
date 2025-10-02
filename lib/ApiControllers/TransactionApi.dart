import 'dart:convert';
import 'package:http/http.dart' as http;
import '../UtilsPage/UrlPage.dart';

class TransactionApiService {
  static Future<List<Map<String, dynamic>>> getTransactions(
    Map<String, dynamic> body,
  ) async {
    print("Request Body: $body");

    try {
      final response = await http.post(
        Uri.parse(ApiConfig.memberOrderDateWise),
        headers: {
          "Content-Type": "application/json",
          ...ApiConfig.headers, // agar aur headers required hain
        },
        body: jsonEncode(body),
      );

      print("Response Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data["Status"] == 1 && data["order"] != null) {
          List<Map<String, dynamic>> list = [];
          for (var item in data["order"]) {
            list.add({
              "title": "Category ${item["tran_catid"]}",
              "amount": item["tran_amount"] ?? "",
              "date": item["tran_date"] ?? "",
              "time": item["tran_datetime"]?.split(" ").last ?? "",
              "details": [
                {
                  "item": item["tran_desc"] ?? "",
                  "price": item["tran_amount"] ?? "",
                },
              ],
              "status": item["tran_status"] == "1" ? "Delivered" : "Pending",
              "tran_id": item["tran_id"] ?? "",
            });
          }
          print("Parsed List: $list");
          return list;
        } else {
          print("No orders found or Status != 1");
        }
      } else {
        print("HTTP error: ${response.statusCode}");
      }
      return [];
    } catch (e) {
      print("Error fetching transactions: $e");
      return [];
    }
  }
}
