import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../ApiControllers/PinVerifyApi.dart';

class PinVerifyController extends GetxController {
  final TextEditingController pinController = TextEditingController();

  Future<Map<String, dynamic>> verifyPin() async {
    final prefs = await SharedPreferences.getInstance();

    String memberId = prefs.getString("member_id") ?? "1";
    String memberCode = prefs.getString("member_code") ?? "731960740895";
    String deviceToken = prefs.getString("device_token") ?? "12121313131311212";
    var body = {
      "member_id": memberId,
      "member_code": memberCode,
      "member_mpin": pinController.text,
      "device_token": deviceToken,
    };

    return await PinVerifyService.verifyPin(body);
  }
}
