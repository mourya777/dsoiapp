import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ScreenPage/PinSetPage.dart';
import '../UtilsPage/ColorsPage.dart';

class LoginController extends GetxController {
  var mobileController = TextEditingController();
  var isLoading = false.obs;

  void sendOTP(BuildContext context) {
    String mobile = mobileController.text.trim();

    // ✅ Mobile number validation (only 10 digits allowed)
    if (mobile.isEmpty || mobile.length != 10 || !RegExp(r'^[0-9]{10}$').hasMatch(mobile)) {
      Get.snackbar(
        "Error",
        "Please enter a valid 10-digit mobile number",
        backgroundColor: AppColors.primary,
        colorText: AppColors.golden,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // simulate API call
    isLoading.value = true;
    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;

      // open OTP bottom sheet
      showModalBottomSheet(
        context: context,
        isScrollControlled: true, // keyboard ke sath adjust hoga
        backgroundColor: Colors.transparent,
        builder: (context) {
          final TextEditingController otpController = TextEditingController();
          final size = MediaQuery.of(context).size;

          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Verify OTP",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: AppColors.golden,
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: AppColors.khakiLight,
                          child: IconButton(
                            icon: const Icon(Icons.close, color: AppColors.primary),
                            onPressed: () => Get.back(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // OTP Field
                    TextField(
                      controller: otpController,
                      keyboardType: TextInputType.number,
                      maxLength: 6,
                      style: const TextStyle(color: AppColors.golden),
                      decoration: InputDecoration(
                        counterText: "",
                        labelText: "Enter OTP",
                        labelStyle: const TextStyle(color: AppColors.khakiLight),
                        prefixIcon: const Icon(Icons.lock, color: AppColors.khakiLight),
                        filled: true,
                        fillColor: AppColors.khaki,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // OTP Verify Button
                    Container(
                      width: size.width * 0.6,
                      height: 50,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [AppColors.khaki, AppColors.primary, AppColors.secondary],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Get.back();
                          Get.to(() => PinSetupPage());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Text(
                          "Verify OTP",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.golden,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    });
  }

  @override
  void onClose() {
    mobileController.dispose();
    super.onClose();
  }
}
