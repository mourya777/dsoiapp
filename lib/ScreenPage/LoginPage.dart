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
      backgroundColor: AppColors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.khaki, AppColors.primary, AppColors.secondary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
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
                Image.asset(
                  "Assets/Images/appbar_logo-removebg-preview.png",
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
                const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 20),

                TextField(
                  controller: controller.mobileController,
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(color: AppColors.black),
                  decoration: InputDecoration(
                    labelText: "Mobile Number",
                    hint: Text(
                      'Mobile Number',
                      style: TextStyle(color: AppColors.grey),
                    ),
                    prefixIcon: const Icon(
                      Icons.phone,
                      color: AppColors.primary,
                    ),
                    filled: true,
                    fillColor: AppColors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                Obx(() {
                  return Container(
                    width: size.width * 1,
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          AppColors.khaki,
                          AppColors.primary,
                          AppColors.secondary,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),

                    child: ElevatedButton(
                      onPressed: controller.isLoading.value
                          ? null
                          : () {
                              // Hide the keyboard
                              FocusScope.of(context).unfocus();
                              // Call the login function
                              controller.sendOTP(context);
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: controller.isLoading.value
                          ? SizedBox(
                              height: 15,
                              width: 15,
                              child: const CircularProgressIndicator(
                                color: AppColors.golden,
                              ),
                            )
                          : const Text(
                              "SEND OTP",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.white,
                              ),
                            ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
