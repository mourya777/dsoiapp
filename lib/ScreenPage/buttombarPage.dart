import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:get/get.dart';

import '../ControllerPage/BottomNavController.dart';
import '../UtilsPage/ColorsPage.dart';
import 'HomePage.dart';
import 'Payment_GetwayPage.dart';
import 'ProfilePage.dart';
import 'QRScannerPage.dart';
import 'TransactionPage.dart';




class BottomNavPage extends StatelessWidget {
  BottomNavPage({super.key});

  final BottomNavController navController = Get.put(BottomNavController());

  final List<Widget> _pages = [
    HomePage(),
    TransactionHistoryPage(),
    QrScannerPage(),
    OrderHistoryPage(),
    const ProfilePage(),
  ];

  final List<IconData> icons = [
    Icons.home,
    Icons.history,
    Icons.qr_code_scanner,
    Icons.credit_card,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => WillPopScope(
        onWillPop: () async {
          if (navController.currentIndex.value > 0) {
            navController.currentIndex.value--;
            return false; // app exit na ho
          }
          return true; // agar index 0 hai to exit allow kare
        },
        child: Scaffold(
          extendBody: true,
          backgroundColor: AppColors.primary.withOpacity(0.2),
          body: Stack(
            children: [
              _pages[navController.currentIndex.value],
            ],
          ),
          bottomNavigationBar: CurvedNavigationBar(
            index: navController.currentIndex.value,
            backgroundColor: Colors.transparent,
            color: AppColors.secondary,
            buttonBackgroundColor: AppColors.primary,
            height: 60,
            items: List.generate(icons.length, (index) {
              bool isSelected = navController.currentIndex.value == index;
              return Icon(
                icons[index],
                size: 30,
                color: isSelected ? AppColors.white : AppColors.golden,
              );
            }),
            onTap: navController.changeIndex,
            letIndexChange: (index) => true,
          ),
        ),
      ),
    );
  }
}
