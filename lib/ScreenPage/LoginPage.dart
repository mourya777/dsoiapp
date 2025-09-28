import 'package:dsoi_web/Utils/StringsPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../PageController/LoginController.dart';
import '../Utils/ColorsPage.dart';
import '../Utils/SizePage.dart';
import '../Widget/CustomButton.dart';
import '../Widget/CustomImageCard.dart';
import '../Widget/CustomText.dart';
import '../Widget/CustomTextFeild.dart';

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
            width: size.width * 0.25,
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: AppColors.white,
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
                CustomImageCard(
                  imagePath: AppImages.logo,
                  width: CustomSize.defaulImageSize,
                  height: CustomSize.defaulImageSize,
                  fit: BoxFit.cover,
                  bgColor: AppColors.transparent,
                ),

                CustomText(
                  text: AppStrings.login,
                  fontSize: CustomSize.defaulTextSize,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),

                CustomSizedBox.vertical20,
                CustomTextField(
                  label: AppStrings.mobileNo,
                  hint: AppStrings.mobileNo,
                  icon: Icons.phone,
                  controller: controller.mobileController,
                  keyboardType: TextInputType.phone,
                  obscureText: AppStrings.inactive,
                ),

                CustomSizedBox.vertical20,

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

                    child: CustomButton(
                      text: AppStrings.login,
                      onPressed: () => controller.isLoading.value
                          ? null
                          : () {
                              FocusScope.of(context).unfocus();
                              controller.sendOTP(context);
                            },
                    ),

                    // child: ElevatedButton(
                    //   onPressed: controller.isLoading.value
                    //       ? null
                    //       : () {
                    //           FocusScope.of(context).unfocus();
                    //           controller.sendOTP(context);
                    //         },
                    //   style: ElevatedButton.styleFrom(
                    //     backgroundColor: Colors.transparent,
                    //     shadowColor: Colors.transparent,
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(15),
                    //     ),
                    //   ),
                    //   child: controller.isLoading.value
                    //       ? SizedBox(
                    //           height: 15,
                    //           width: 15,
                    //           child: const CircularProgressIndicator(
                    //             color: AppColors.golden,
                    //           ),
                    //         )
                    //       : const Text(
                    //           "SEND OTP",
                    //           style: TextStyle(
                    //             fontSize: 18,
                    //             fontWeight: FontWeight.bold,
                    //             color: AppColors.white,
                    //           ),
                    //         ),
                    // ),
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
