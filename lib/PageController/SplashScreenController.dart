import 'package:get/get.dart';
import 'dart:async';

import '../ScreenPage/LoginPage.dart';



class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 3), () {
      Get.off(() =>  LoginView());
    });
  }
}