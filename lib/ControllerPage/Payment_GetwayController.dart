import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartController extends GetxController {
  RxList<Map<String, dynamic>> cartItems = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadCart();
  }

  Future<void> loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString("cart_items");
    if (data != null) {
      final List<Map<String, dynamic>> items = List<Map<String, dynamic>>.from(jsonDecode(data));
      for (var item in items) {
        if (item['type'] == 'liquor') {
          item['small'] = item['small'] ?? 0;
          item['large'] = item['large'] ?? 0;
        }
      }
      cartItems.assignAll(items);
    }
  }

  Future<void> saveCart() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("cart_items", jsonEncode(cartItems));
  }

  void removeItem(int index) {
    cartItems.removeAt(index);
    saveCart();
  }

  void updateQty(int index, int delta, String key) {
    final item = cartItems[index];
    if (item['type'] == 'item') {
      int currentQty = item['qty'] ?? 1;
      currentQty += delta;
      if (currentQty <= 0) {
        cartItems.removeAt(index);
      } else {
        cartItems[index]['qty'] = currentQty;
      }
    } else if (item['type'] == 'liquor') {
      int current = item[key] ?? 0;
      current += delta;
      if (current < 0) current = 0;
      cartItems[index][key] = current;
    }
    cartItems.refresh(); // notify UI
    saveCart();
  }

  int getTotalPrice() {
    int total = 0;
    for (var item in cartItems) {
      if (item['type'] == 'item') {
        int price = int.tryParse(item['price'].toString().replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
        int qty = item['qty'] ?? 1;
        total += price * qty;
      } else if (item['type'] == 'liquor') {
        int price = item['price'] ?? 0;
        int small = item['small'] ?? 0;
        int large = item['large'] ?? 0;
        total += (small * price) + (large * price * 2);
      }
    }
    return total;
  }
}
