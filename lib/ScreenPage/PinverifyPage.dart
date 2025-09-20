import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../UtilsPage/ColorsPage.dart';
import 'buttombarPage.dart';
import 'PinSetPage.dart';

class PinVerifyPage extends StatelessWidget {
  final String pin;
  final verifyPinController = TextEditingController();

  PinVerifyPage({super.key, required this.pin});

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
                SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "ENTER PIN",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                TextField(
                  controller: verifyPinController,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  obscureText: true,
                  style: const TextStyle(color: AppColors.black),
                  decoration: InputDecoration(
                    labelText: "Enter PIN",
                    hint: Text(
                      "Enter PIN",
                      style: TextStyle(color: AppColors.grey),
                    ),
                    labelStyle: const TextStyle(color: AppColors.black),
                    prefixIcon: const Icon(
                      Icons.lock,
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

                Container(
                  width: size.width * 0.4,
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
                    onPressed: () {
                      if (verifyPinController.text == pin) {
                        Get.offAll(() => BottomNavPage());
                      } else {
                        Get.snackbar(
                          "Error",
                          "Incorrect PIN",
                          backgroundColor: AppColors.primary,
                          colorText: AppColors.white,
                          snackPosition: SnackPosition.BOTTOM,
                          borderColor: Colors.red,
                          borderWidth: 2,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      "VERIFY PIN",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
