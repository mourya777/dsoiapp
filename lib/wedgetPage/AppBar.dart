import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ControllerPage/HomeController.dart';
import '../UtilsPage/ColorsPage.dart';
import '../UtilsPage/StringsPage.dart';

class AdvancedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final HomeController controller = Get.put(HomeController());

  AdvancedAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12, // पहले 0.2 था, अब कम किया
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary,
            AppColors.primary
          ],
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'Assets/Images/appbar_logo-removebg-preview.png',
                height: 60,
                width: 60,
              ),
              const SizedBox(width: 10),

              Text(
                "${AppStrings.locationJabalpur}",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w900, // aur bold
                  color: AppColors.white, // AppColors.golden bhi use kar sakte ho
                  letterSpacing: 1.5, // thoda space letters ke beech
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

  @override
  Size get preferredSize => const Size.fromHeight(80); // Adjust height
}
