import 'dart:async';
import 'package:get/get.dart';
import 'package:resturent/ScreenPage/LoginPage.dart';

import '../ScreenPage/PinverifyPage.dart';
import '../UtilsPage/SessionManager.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _checkAuth();
  }

  void _checkAuth() async {
    await Future.delayed(const Duration(seconds: 3));

    final memberData = await GlobalPrefs.getMemberData();

    String? memberAuth = memberData?["member_auth"];
    print('Authontication$memberAuth');

    if (memberAuth == null || memberAuth.isEmpty || memberAuth == "0") {
      Get.off(() => LoginView());
    } else {
      Get.off(() => PinVerifyPage());
    }
  }
}
