import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../UtilsPage/ColorsPage.dart';
import 'HomePage.dart';
import 'Payment_GetwayPage.dart';
import 'ProfilePage.dart';
import 'QRScannerPage.dart';
import 'TransactionPage.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int _currentIndex = 0;

  final items = <Widget>[
    Icon(Icons.home, size: 30, color: AppColors.golden),
    Icon(Icons.history, size: 30, color: AppColors.golden),
    Icon(Icons.qr_code_scanner, size: 30, color: AppColors.golden),
    Icon(Icons.credit_card, size: 30, color: AppColors.golden),
    Icon(Icons.person, size: 30, color: AppColors.golden),
  ];

  final List<Widget> _pages = [
    HomePage(),
    TransactionHistoryPage(),
    QrScannerPage(),
    AddToCartPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_currentIndex > 0) {
          setState(() {
            _currentIndex--; // 🔹 back दबाने पर index घटेगा
          });
          return false; // app close नहीं होगा
        }
        return true; // अगर index 0 है तो app close होगा
      },
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.primary.withOpacity(0.2),
        body: _pages[_currentIndex],
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          color: AppColors.secondary,
          buttonBackgroundColor: AppColors.primary,
          height: 60,
          index: _currentIndex,
          animationDuration: const Duration(milliseconds: 300),
          animationCurve: Curves.easeInOut,
          items: List.generate(items.length, (index) {
            final isActive = index == _currentIndex;
            return Container(
              decoration: isActive
                  ? BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.golden, // Golden circle
                  width: 3,
                ),
              )
                  : null,
              padding: const EdgeInsets.all(8),
              child: items[index],
            );
          }),
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
