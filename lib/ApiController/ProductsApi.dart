// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
//
// import '../Utils/UrlPage.dart';
//
// Future<Map<String, dynamic>> getAllCategories(Map<String, dynamic> body) async {
//   try {
//     final response = await http.post(
//       Uri.parse(
//         ApiConfig.allCatSubcat,
//       ),
//       headers: ApiConfig.headers,
//       body: jsonEncode(body),
//     );
//
//     if (response.statusCode == 200) {
//       return jsonDecode(response.body);
//     } else {
//       return {"Status": 0, "Msg": "Server Error: ${response.statusCode}"};
//     }
//   } catch (e) {
//     return {"Status": 0, "Msg": e.toString()};
//   }
// }
