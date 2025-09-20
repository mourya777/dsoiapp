import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ControllerPage/HomeController.dart';
import '../UtilsPage/ColorsPage.dart';

class AdvancedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final HomeController controller = Get.put(HomeController());

  AdvancedAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.2,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary,
            AppColors.primary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child:Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'Assets/Images/appbar_logo-removebg-preview.png',
                height: 60,
                width: 60,
              ),
              SizedBox(width: 6,),
              Text(
                "DSOI JABALPUR",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
                overflow: TextOverflow.ellipsis, // Prevent overflow
              ),
            ],
          )
          ,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80); // Adjust height
}
