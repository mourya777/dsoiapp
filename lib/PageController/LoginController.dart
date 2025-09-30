import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ApiController/LoginApi.dart';
import '../ScreenPage/MenuPage.dart';
import '../Utils/ColorsPage.dart';
import '../Widget/SnackBarMessage.dart';

class LoginController extends GetxController {
  var mobileController = TextEditingController();
  var passwordController = TextEditingController();
  var isLoading = false.obs;

  void login(BuildContext context) async {
    String user = mobileController.text.trim();
    String pass = passwordController.text.trim();

    if (user.isEmpty || pass.isEmpty) {
      CustomSnackBar.show(
        title: "Error",
        message: "Please enter username and password!",
        icon: Icons.close,
        backgroundColor: AppColors.red,
        textColor: AppColors.white,
        iconColor: AppColors.white,
      );
      return;
    }

    // 🔹 Start loading
    isLoading.value = true;

    try {
      var body = {"user": user, "pass": pass};
      print(body);

      // 🔹 Call API
      final Map<String, dynamic> result =
      await ApiServiceWeb.staffLogin(body) as Map<String, dynamic>;
      print("API Response: $result");
      print("Status: ${result["Status"]}");

      // 🔹 Stop loading
      isLoading.value = false;

      if (result["Status"] == 1) {
        // 🔹 Success snackbar
        CustomSnackBar.show(
          title: "Success",
          message: result["Msg"] ?? "Login Successful",
          icon: Icons.check_circle,
          backgroundColor: AppColors.primary,
          textColor: AppColors.white,
          iconColor: AppColors.white,
        );

        // 🔹 Navigate to MenuPage with lazy loading
        Future.delayed(const Duration(milliseconds: 300), () {
          Get.to(MenuPage());
        });

      } else {
        // 🔹 Error snackbar
        CustomSnackBar.show(
          title: "Error",
          message: result["Msg"] ?? "Login Failed",
          icon: Icons.close,
          backgroundColor: AppColors.red,
          textColor: AppColors.white,
          iconColor: AppColors.white,
        );
      }
    } catch (e) {
      isLoading.value = false;
      CustomSnackBar.show(
        title: "Error",
        message: e.toString(),
        icon: Icons.close,
        backgroundColor: AppColors.red,
        textColor: AppColors.white,
        iconColor: AppColors.white,
      );
    }
  }

  @override
  void onClose() {
    mobileController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
