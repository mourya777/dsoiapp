import 'package:get/get.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:resturent/ScreenPage/LoginPage.dart';

import '../ScreenPage/buttombarPage.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 3), () {
      Get.off(() =>  LoginView());
    });
  }
}
