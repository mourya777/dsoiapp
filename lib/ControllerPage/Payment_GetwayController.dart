import 'package:get/get.dart';

class AddToCardController extends GetxController {
  var balance = 25000.obs; // Default wallet balance
  var amountToAdd = 0.obs;

  void addAmount(int amount) {
    if (amount > 0) {
      balance.value += amount;
      amountToAdd.value = 0; // reset input
    }
  }
}
