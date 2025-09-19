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
                image: AssetImage('Assets/Images/dsoi_logo.png'),
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Text(
                "DSOI JABALPUR",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.golden, // Aap chahe to AppColors.golden bhi use kar sakte ho
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
