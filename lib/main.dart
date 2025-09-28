import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';


import 'ScreenPage/LoginPage.dart';
import 'ScreenPage/ManuPage.dart';
import 'ScreenPage/PinSetPage.dart';
import 'ScreenPage/PinverifyPage.dart';
import 'ScreenPage/buttombarPage.dart';
import 'ScreenPage/splashPage.dart';
import 'UtilsPage/StringsPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
<<<<<<< Updated upstream
<<<<<<< Updated upstream
      title: 'DSOI',
=======
      title:AppStrings.dsoi,
>>>>>>> Stashed changes
=======
      title:AppStrings.dsoi,
>>>>>>> Stashed changes
debugShowCheckedModeBanner: false,
     home:MenuView(),
    );
  }
}

