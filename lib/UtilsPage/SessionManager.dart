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

class GlobalPrefs {
  static SharedPreferences? _prefs;

  // Initialize (call only once in main.dart)
  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Save Member Data
  static Future setMemberData(Map<String, dynamic> data) async {
    await _prefs?.setString("member_data", jsonEncode(data));
  }

  // Get Member Data
  static Map<String, dynamic>? getMemberData() {
    final jsonStr = _prefs?.getString("member_data");
    if (jsonStr != null) {
      return jsonDecode(jsonStr);
    }
    return null;
  }

  // Clear Data (Logout)
  static Future clear() async {
    await _prefs?.clear();
  }
}
