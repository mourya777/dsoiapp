
import 'package:http/http.dart' as http;

import '../ModelsPage/MenuModels.dart';
import '../UtilsPage/UrlPage.dart';

class ApiService {
   Future<MenuModel?> fetchMenu() async {
    try {
      final response = await http.post(
        Uri.parse(ApiConfig.allCatSubcat),
        headers: ApiConfig.headers,
      );
      print("API Response Body: ${response.body}");
      print("Status Code: ${response.statusCode}");
      if (response.statusCode == 200) {
        return MenuModel.fromJson(response.body);
      } else {
        print("Error ${response.statusCode}: ${response.body}");
        return null;
      }
    } catch (e) {
      print("Exception: $e");
      return null;
    }
  }
}

