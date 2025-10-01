import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../ApiControllers/PinSetApi.dart';
import '../ScreenPage/PinverifyPage.dart';
import '../UtilsPage/ColorsPage.dart';
import '../UtilsPage/SessionManager.dart';
import '../wedgetPage/SnackBarMessage.dart';

class PinController extends GetxController {
  final pinController = TextEditingController();
  final confirmPinController = TextEditingController();
  var isLoading = false.obs;

  String memberId;
  String deviceToken;

  PinController({required this.memberId, required this.deviceToken});

  void setPin() async {
    String pin = pinController.text.trim();
    String confirmPin = confirmPinController.text.trim();

    if (pin.isEmpty || confirmPin.isEmpty) {
      CustomSnackBar.show(
        title: "Error",
        message: "PIN fields cannot be empty",
        icon: Icons.close,
        backgroundColor: AppColors.red,
        textColor: AppColors.white,
        iconColor: AppColors.white,
      );
      return;
    }

    if (pin.length != 6 || confirmPin.length != 6 || pin != confirmPin) {
      CustomSnackBar.show(
        title: "Error",
        message: "PIN must be 6 digits and match",
        icon: Icons.close,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        iconColor: Colors.white,
      );
      return;
    }

    isLoading.value = true;

    final body = {
      "member_id": memberId,
      "member_mpin": pin,
      "device_token": deviceToken,
    };

    final result = await PinService.setPin(body: jsonEncode(body));

    isLoading.value = false;

    if (result["Status"] == 1) {
      await GlobalPrefs.setMemberData(result["result"]);


      CustomSnackBar.show(
        title: "Success",
        message: result["Msg"] ?? "PIN set successfully",
        icon: Icons.check_circle,
        backgroundColor: AppColors.primary,
        textColor: AppColors.white,
        iconColor: AppColors.white,
      );

      Get.to(() => PinVerifyPage());
    } else {
      CustomSnackBar.show(
        title: "Error",
        message: result["Msg"] ?? "Failed to set PIN",
        icon: Icons.close,
        backgroundColor: Colors.red,
        textColor: AppColors.white,
        iconColor: AppColors.white,
      );
    }
  }

  @override
  void onClose() {
    pinController.dispose();
    confirmPinController.dispose();
    super.onClose();
  }
}
