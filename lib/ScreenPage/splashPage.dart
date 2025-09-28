import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ControllerPage/SplashController.dart';
import '../UtilsPage/ColorsPage.dart';

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
            colors: [
              AppColors.primary,    // Dark Olive Green
              AppColors.secondary,  // Olive Green
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(
                image: AssetImage('Assets/Images/appbar_logo-removebg-preview.png'),
                width: 250,
                height: 250,
                fit: BoxFit.cover,
              ),

              Text(
<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream
                "DSOI JABALPUR",
=======
                "${AppStrings.locationJabalpur}",
>>>>>>> Stashed changes
=======
                "${AppStrings.locationJabalpur}",
>>>>>>> Stashed changes
=======
                "${AppStrings.locationJabalpur}",
>>>>>>> Stashed changes
                style: TextStyle(
                  fontSize: 33,
                  fontWeight: FontWeight.w900,
                  color: AppColors.white,
                  letterSpacing: 1.5,
                  shadows: [
                    Shadow(
                      offset: Offset(2, 2),
                      blurRadius: 4,
                      color: Colors.black26,
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
