import 'dart:convert';
import 'package:http/http.dart' as http;
import '../ModelsPage/ManuitemModels.dart';
import '../UtilsPage/UrlPage.dart';

class ProductService {
  static Future<List<Product>> fetchProducts({
    required String catId,

  }) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConfig.productCat),
        headers: ApiConfig.headers,
        body: jsonEncode({
          "cid": catId,

        }),
      );

      print("API Response Status: ${response.statusCode}");
      print("API Response Body: ${response.body}"); // 🔍 debug print

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['Status'] == 1 && data['Record'] != null) {
          List products = data['Record'] as List;
          print("Number of products fetched: ${products}"); // 🔍 debug print
          return products.map((e) => Product.fromJson(e)).toList();
        } else {
          print("No products found or Status != 1"); // 🔍 debug print
          return [];
        }
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      print("Error fetching products: $e"); // 🔍 debug print
      throw Exception('Error fetching products: $e');
    }
  }
}
