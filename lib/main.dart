import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:resturent/ScreenPage/HomePage.dart';


import 'ScreenPage/LoginPage.dart';
import 'ScreenPage/ManuItemPage.dart';
import 'ScreenPage/ManuPage.dart';
import 'ScreenPage/OrderBillPage.dart';
import 'ScreenPage/PinSetPage.dart';
import 'ScreenPage/PinverifyPage.dart';
import 'ScreenPage/ProfilePage.dart';
import 'ScreenPage/TransactionPage.dart';
import 'ScreenPage/buttombarPage.dart';
import 'ScreenPage/splashPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'DSOI',
debugShowCheckedModeBanner: false,
     home:SplashScreen(),
    );
  }
}

