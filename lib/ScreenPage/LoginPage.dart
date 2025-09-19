import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ControllerPage/LoginController.dart';
import '../UtilsPage/ColorsPage.dart';

class LoginView extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.khakiLight,
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Login",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.golden,
                ),
              ),
              const SizedBox(height: 20),

              TextField(
                controller: controller.mobileController,
                keyboardType: TextInputType.phone,
                style: const TextStyle(color: AppColors.golden),
                decoration: InputDecoration(
                  labelText: "Mobile Number",
                  labelStyle: const TextStyle(color: AppColors.khakiLight),
                  prefixIcon: const Icon(Icons.phone, color: AppColors.khakiLight),
                  filled: true,
                  fillColor: AppColors.khaki,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Obx(() {
                return Container(
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
                    onPressed: controller.isLoading.value
                        ? null
                        : () => controller.sendOTP(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: controller.isLoading.value
                        ? const CircularProgressIndicator(color: AppColors.golden)
                        : const Text(
                      "Send OTP",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.golden,
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
