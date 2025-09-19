import 'package:get/get.dart';

class CheckoutController extends GetxController {
  var total = 0.0.obs;
  var walletBalance = 500.0.obs;

  @override
  void onInit() {
    super.onInit();
    total.value = Get.arguments["total"] ?? 0;
  }

  void placeOrder() {
    if (walletBalance.value >= total.value) {
      walletBalance.value -= total.value;
      Get.snackbar("Order Successful", "Your order is placed!");
      Get.offAllNamed('/login');
    } else {
      Get.snackbar("Insufficient Balance", "Please add more balance.");
    }
  }
}
