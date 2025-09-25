import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../ModelsPage/RFIDModels.dart';

class UserPreferences {
  static Future<void> saveUserDetails(RfidResponse response) async {
    final prefs = await SharedPreferences.getInstance();

    if (response.status == 1) {
      final userData = {
        "name": "${response.records.memberFname} ${response.records.memberLname}",
        "membership_no": response.records.memberNo,
        "balance": response.records.memberBalance,
        "member_type": response.records.memberType,
        "image": response.records.memberImg,
      };

      await prefs.setString("user_details", jsonEncode(userData));
      print("User details saved: $userData");
    } else {
      print("Cannot save user details, invalid response");
    }
  }

  static Future<Map<String, dynamic>?> getUserDetails() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString("user_details");
    if (data != null) {
      return Map<String, dynamic>.from(jsonDecode(data));
    }
    return null;
  }

  /// Delete user details (logout)
  static Future<void> clearUserDetails() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("user_details");
    print("User details cleared (logout)");
  }

  /// Check if user is logged in
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey("user_details");
  }
}
