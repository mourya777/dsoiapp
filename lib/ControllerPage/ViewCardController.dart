import 'package:get/get.dart';
import '../UtilsPage/UrlPage.dart';

class ViewCartController extends GetxController {
  RxList<Map<String, dynamic>> cartItems = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadCartItems();
  }

  void loadCartItems() {
    cartItems.value = [
      ...TempCart.menuItems.map((e) => {...e, 'type': 'menu'}),
      ...TempCart.liquorItems.map((e) => {...e, 'type': 'liquor'}),
      ...TempCart.fastFoodItems.map((e) => {...e, 'type': 'fastfood'}),
    ];
  }

  void _syncWithTempCart() {
    TempCart.menuItems =
        cartItems.where((e) => e['type'] == 'menu').toList();
    TempCart.liquorItems =
        cartItems.where((e) => e['type'] == 'liquor').toList();
    TempCart.fastFoodItems =
        cartItems.where((e) => e['type'] == 'fastfood').toList();
  }

  int getTotalPrice() {
    int total = 0;
    for (var item in cartItems) {
      double price = double.tryParse(item['price'].toString()) ?? 0;
      if (item['type'] == 'liquor') {
        int small = item['small'] ?? 0;
        int large = item['large'] ?? 0;
        total += (small * price + large * price * 2).round();
      } else {
        int qty = item['qty'] ?? 1;
        total += (price * qty).round();
      }
    }
    return total;
  }

  void incrementQty(int index) {
    var item = cartItems[index];
    if (item['type'] == 'liquor') {
      int totalML = (item['small'] ?? 0) * 30 + (item['large'] ?? 0) * 60;
      totalML += 30;
      item['large'] = totalML ~/ 60;
      item['small'] = (totalML % 60) ~/ 30;
    } else {
      item['qty'] = (item['qty'] ?? 1) + 1;
    }
    cartItems.refresh();
    _syncWithTempCart();
  }

  void decrementQty(int index) {
    var item = cartItems[index];
    if (item['type'] == 'liquor') {
      int totalML = (item['small'] ?? 0) * 30 + (item['large'] ?? 0) * 60;
      totalML -= 30;
      if (totalML <= 0) {
        cartItems.removeAt(index);
      } else {
        item['large'] = totalML ~/ 60;
        item['small'] = (totalML % 60) ~/ 30;
      }
    } else {
      if ((item['qty'] ?? 1) > 1) {
        item['qty'] -= 1;
      } else {
        cartItems.removeAt(index);
      }
    }
    cartItems.refresh();
    _syncWithTempCart();
  }

  void deleteItem(int index) {
    cartItems.removeAt(index);
    cartItems.refresh();
    _syncWithTempCart();
  }

  int getTotalItems() {
    int total = 0;
    for (var item in cartItems) {
      if (item['type'] == 'liquor') {
        int small = (item['small'] ?? 0) as int;
        int large = (item['large'] ?? 0) as int;
        total += small + large;
      } else {
        int qty = (item['qty'] ?? 1) as int;
        total += qty;
      }
    }
    return total;
  }



}
// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ViewCartController extends GetxController {
//   RxList<Map<String, dynamic>> cartItems = <Map<String, dynamic>>[].obs;
//   static const String cartKey = "cart_items";
//
//   @override
//   void onInit() {
//     super.onInit();
//     loadCartFromPrefs();
//   }
//
//   /// Load cart items from SharedPreferences
//   Future<void> loadCartFromPrefs() async {
//     final prefs = await SharedPreferences.getInstance();
//     final jsonString = prefs.getString(cartKey);
//     if (jsonString != null) {
//       final List<dynamic> jsonList = jsonDecode(jsonString);
//       cartItems.value = jsonList.map((e) => Map<String, dynamic>.from(e)).toList();
//     } else {
//       loadCartItems(); // fallback to TempCart
//     }
//     _syncWithTempCart();
//   }
//
//   /// Load cart from TempCart (menu, liquor, fastfood)
//   void loadCartItems() {
//     cartItems.value = [
//       ...TempCart.menuItems.map((e) => {...e, 'type': 'menu'}),
//       ...TempCart.liquorItems.map((e) => {...e, 'type': 'liquor'}),
//       ...TempCart.fastFoodItems.map((e) => {...e, 'type': 'fastfood'}),
//     ];
//     _syncWithTempCart();
//     saveCartToPrefs();
//   }
//
//   /// Sync with TempCart
//   void _syncWithTempCart() {
//     TempCart.menuItems = cartItems.where((e) => e['type'] == 'menu').toList();
//     TempCart.liquorItems = cartItems.where((e) => e['type'] == 'liquor').toList();
//     TempCart.fastFoodItems = cartItems.where((e) => e['type'] == 'fastfood').toList();
//     saveCartToPrefs();
//   }
//
//   /// Save current cart to SharedPreferences
//   Future<void> saveCartToPrefs() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString(cartKey, jsonEncode(cartItems));
//   }
//
//   /// Clear cart from memory and SharedPreferences
//   Future<void> clearCart() async {
//     cartItems.clear();
//     _syncWithTempCart();
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove(cartKey);
//   }
//
//   int getTotalPrice() {
//     int total = 0;
//     for (var item in cartItems) {
//       double price = double.tryParse(item['price'].toString()) ?? 0;
//       if (item['type'] == 'liquor') {
//         int small = item['small'] ?? 0;
//         int large = item['large'] ?? 0;
//         total += (small * price + large * price * 2).round();
//       } else {
//         int qty = item['qty'] ?? 1;
//         total += (price * qty).round();
//       }
//     }
//     return total;
//   }
//
//   void incrementQty(int index) {
//     var item = cartItems[index];
//     if (item['type'] == 'liquor') {
//       int totalML = (item['small'] ?? 0) * 30 + (item['large'] ?? 0) * 60;
//       totalML += 30;
//       item['large'] = totalML ~/ 60;
//       item['small'] = (totalML % 60) ~/ 30;
//     } else {
//       item['qty'] = (item['qty'] ?? 1) + 1;
//     }
//     cartItems.refresh();
//     _syncWithTempCart();
//   }
//
//   void decrementQty(int index) {
//     var item = cartItems[index];
//     if (item['type'] == 'liquor') {
//       int totalML = (item['small'] ?? 0) * 30 + (item['large'] ?? 0) * 60;
//       totalML -= 30;
//       if (totalML <= 0) {
//         cartItems.removeAt(index);
//       } else {
//         item['large'] = totalML ~/ 60;
//         item['small'] = (totalML % 60) ~/ 30;
//       }
//     } else {
//       if ((item['qty'] ?? 1) > 1) {
//         item['qty'] -= 1;
//       } else {
//         cartItems.removeAt(index);
//       }
//     }
//     cartItems.refresh();
//     _syncWithTempCart();
//   }
//
//   void deleteItem(int index) {
//     cartItems.removeAt(index);
//     cartItems.refresh();
//     _syncWithTempCart();
//   }
//
//   int getTotalItems() {
//     int total = 0;
//     for (var item in cartItems) {
//       if (item['type'] == 'liquor') {
//         int small = (item['small'] ?? 0) as int;
//         int large = (item['large'] ?? 0) as int;
//         total += small + large;
//       } else {
//         int qty = (item['qty'] ?? 1) as int;
//         total += qty;
//       }
//     }
//     return total;
//   }
// }
