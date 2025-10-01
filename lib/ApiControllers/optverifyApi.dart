import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../UtilsPage/ColorsPage.dart';
import '../UtilsPage/UrlPage.dart';
import '../wedgetPage/SnackBarMessage.dart';

class OtpNumberService {

  static Future<Map<String, dynamic>> verifyOtp({
    required String memberId,
    String otp = "583496", // static OTP
    String deviceToken = "12121313131311212", // auto generated / static
  }) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConfig.mobileOTPVerify),
        headers: ApiConfig.headers,
        body: jsonEncode({
          "member_id": memberId,
          "member_otp": otp,
          "device_token": deviceToken,
        }),
      ).timeout(const Duration(seconds: 30));

      print("OTP Verification Status: ${response.statusCode}");
      print("OTP Verification Response: ${response.body.toString()}");

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        CustomSnackBar.show(
          title: "Success",
          message:
          responseData["Msg"] ??
              "OTP verified successfully!",
          icon: Icons.check_circle,
          backgroundColor: AppColors.primary,
          textColor: AppColors.white,
          iconColor: AppColors.white,
        );
        return jsonDecode(response.body);
      } else {
        return {"Status": 0, "Msg": "Mobile OTP Not verify, Please Enter again."};
      }
    } catch (e) {
      print("Error in OTP Verification API: $e");
      return {"Status": 0, "Msg": "Mobile OTP Not verify, Please Enter again."};
    }
  }
}
