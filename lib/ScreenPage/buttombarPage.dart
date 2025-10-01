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
    OrderHistoryPage(),
    QrScannerPage(),
    TransactionHistoryPage(),
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
          () => Scaffold(
            extendBody: true,
        backgroundColor: AppColors.primary.withOpacity(0.2),
        body: Stack(
          children: [
            _pages[navController.currentIndex.value],
            // optional: background overlay for curved bar if needed
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          index: navController.currentIndex.value,
          backgroundColor: Colors.transparent, // transparent to show body behind
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
    );
  }
}
