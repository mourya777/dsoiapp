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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Enter PIN",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.golden,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.golden,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.edit, color: AppColors.primary),
                      onPressed: () {
                        Get.off(() => PinSetupPage());
                      },
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
                style: const TextStyle(color: AppColors.golden),
                decoration: InputDecoration(
                  labelText: "Enter PIN",
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
                    if (verifyPinController.text == pin) {
                      Get.offAll(() => BottomNavPage());
                    } else {
                      Get.snackbar(
                        "Error",
                        "Incorrect PIN",
                        backgroundColor: AppColors.primary,
                        colorText: AppColors.golden,
                        snackPosition: SnackPosition.BOTTOM,
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
                    "Verify PIN",
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
  }
}
