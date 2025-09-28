import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../ModelsPage/RFIDModels.dart';

class SessionManager {
  static const String _userKey = "USER_DATA";

  static Future<void> saveUser(RfidResponse user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, jsonEncode(user.toJson()));
  }

  static Future<RfidResponse?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_userKey);

    if (data != null && data.isNotEmpty) {
      return RfidResponse.fromJson(jsonDecode(data));
    }
    return null;
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_userKey);
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }
}
///===============================================================================


class CartPrefs {
  static const String cartKey = "cart_items";

  /// Save cart items (List<Map<String, dynamic>>) as JSON string
  static Future<void> saveCart(List<Map<String, dynamic>> cartItems) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(cartItems);
    await prefs.setString(cartKey, jsonString);
  }

  /// Load cart items from SharedPreferences
  static Future<List<Map<String, dynamic>>> loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(cartKey);
    if (jsonString == null) return [];
    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((e) => Map<String, dynamic>.from(e)).toList();
  }

  /// Clear cart items from SharedPreferences
  static Future<void> clearCart() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(cartKey);
  }
}
