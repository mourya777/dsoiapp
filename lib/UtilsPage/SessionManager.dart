import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future setMemberData(Map<String, dynamic> data) async {
    await _prefs?.setString("member_data", jsonEncode(data));
  }

  static Map<String, dynamic>? getMemberData() {
    final jsonStr = _prefs?.getString("member_data");
    if (jsonStr != null) {
      return jsonDecode(jsonStr);
    }
    return null;
  }

  static Future clear() async {
    await _prefs?.clear();
  }
}

class GlobalStorage {
  static final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // Key for device token
  static const String _deviceTokenKey = "device_token";

  // Save token
  static Future<void> saveDeviceToken(String token) async {
    await _storage.write(key: _deviceTokenKey, value: token);
  }

  // Get token
  static Future<String?> getDeviceToken() async {
    return await _storage.read(key: _deviceTokenKey);
  }

  // Delete token (if needed)
  static Future<void> deleteDeviceToken() async {
    await _storage.delete(key: _deviceTokenKey);
  }
}
