import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../PageController/SplashScreenController.dart';
import '../Utils/ColorsPage.dart';
import '../Utils/SizePage.dart';
import '../Utils/StringsPage.dart';
import '../Widget/CustomImageCard.dart';
import '../Widget/CustomText.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primary, AppColors.secondary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomImageCard(
                width: CustomSize.defaultWidthSize,
                height: CustomSize.defaultHeightSize,
                bgColor: AppColors.transparent,
                imagePath: AppImages.logo,
              ),

              CustomText(
                text: AppStrings.locationJabalpur,
                color: AppColors.white,
                fontSize: CustomSize.fontSize,
                shadows: [
                  Shadow(
                    offset: Offset(2, 2),
                    blurRadius: 4,
                    color: Colors.black26,
                  ),
                ],
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
