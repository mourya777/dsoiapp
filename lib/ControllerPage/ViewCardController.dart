import 'package:get/get.dart';
import '../UtilsPage/UrlPage.dart';
import '../wedgetPage/GlobleList.dart';
class ViewCartController extends GetxController {
  RxList<Map<String, dynamic>> cartItems = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadCartItems();
  }

  void loadCartItems() {
    cartItems.value = [];

    print("🛒 LOADING FROM GLOBALCART...");

    // ✅ FIXED: Load from GlobalCart for ALL categories
    for (int i = 0; i < GlobalCart.cartData.length; i++) {
      final category = GlobalCart.cartData[i];
      final catId = category["cat_id"].toString();
      final orders = category["order"];

      print("📦 Category $i (cat_id: $catId): ${orders.length} items");

      for (var orderItem in orders) {
        // Determine item type based on cat_id
        String type = "menu"; // default
        if (catId == "2") {
          type = "liquor";
        } else if (catId == "90") {
          type = "fastfood";
        }

        // Add item to cart with proper structure
        Map<String, dynamic> cartItem = {
          ...orderItem,
          'type': type,
          'cat_id': catId,
          'image': _getImageForType(type),
        };

        // Handle different quantity types
        if (type == "liquor") {
          cartItem['small'] = int.tryParse(orderItem['small']?.toString() ?? "0") ?? 0;
          cartItem['large'] = int.tryParse(orderItem['large']?.toString() ?? "0") ?? 0;
        } else {
          cartItem['qty'] = int.tryParse(orderItem['qty']?.toString() ?? "1") ?? 1;
        }

        cartItems.add(cartItem);
        print("   ✅ LOADED: ${orderItem['name']} (type: $type)");
      }
    }

    print("🛒 TOTAL LOADED: ${cartItems.length} items");
  }

  String _getImageForType(String type) {
    switch (type) {
      case "liquor":
        return "Assets/Liquor/liquors.jpeg";
      case "fastfood":
        return "Assets/Liquor/fast_food.jpeg";
      default:
        return "Assets/Non-Veg/Egg Curry.jpeg";
    }
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
      _updateGlobalCart();
    } else {
      item['qty'] = (item['qty'] ?? 1) + 1;
      _updateGlobalCart();
    }
    cartItems.refresh();
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
      _updateGlobalCart();
    } else {
      if ((item['qty'] ?? 1) > 1) {
        item['qty'] -= 1;
        _updateGlobalCart();
      } else {
        cartItems.removeAt(index);
        _updateGlobalCart();
      }
    }
    cartItems.refresh();
  }

  void deleteItem(int index) {
    cartItems.removeAt(index);
    cartItems.refresh();
    _updateGlobalCart();
  }

  void _updateGlobalCart() {
    // Clear all GlobalCart orders first
    for (int i = 0; i < GlobalCart.cartData.length; i++) {
      GlobalCart.cartData[i]["order"].clear();
    }

    // Add current items back to GlobalCart
    for (var item in cartItems) {
      String catId = item['cat_id'] ?? "1";
      int cartIndex = _getCartIndex(catId);

      Map<String, dynamic> orderItem = {
        "prd_id": item['prd_id'],
        "name": item['name'],
        "price": item['price'].toString(),
      };

      if (item['type'] == 'liquor') {
        orderItem["small"] = item['small'].toString();
        orderItem["large"] = item['large'].toString();
        orderItem["type"] = "liquor";
      } else {
        orderItem["qty"] = item['qty'].toString();
      }

      GlobalCart.cartData[cartIndex]["order"].add(orderItem);
    }

    print("🔄 UPDATED GLOBALCART");
    GlobalCart.debugCartStatus();
  }

  int _getCartIndex(String catId) {
    switch (catId) {
      case "1": return 0;
      case "2": return 1;
      case "90": return 2;
      default: return 0;
    }
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
// class ViewCartController extends GetxController {
//   RxList<Map<String, dynamic>> cartItems = <Map<String, dynamic>>[].obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     loadCartItems();
//   }
//
//   void loadCartItems() {
//     cartItems.value = [];
//
//     // ✅ FIXED: Load from GlobalCart instead of TempCart
//     for (int i = 0; i < GlobalCart.cartData.length; i++) {
//       final category = GlobalCart.cartData[i];
//       final catId = category["cat_id"].toString();
//
//       for (var orderItem in category["order"]) {
//         // Determine item type based on cat_id
//         String type = "menu"; // default
//         if (catId == "2") {
//           type = "liquor";
//         } else if (catId == "90") {
//           type = "fastfood";
//         }
//
//         // Add item to cart with proper type
//         cartItems.add({
//           ...orderItem,
//           'type': type,
//           'cat_id': catId,
//         });
//       }
//     }
//
//     print("🛒 Loaded ${cartItems.length} items from GlobalCart");
//     _syncWithTempCart(); // Keep TempCart in sync if needed
//   }
//
//   void _syncWithTempCart() {
//     // Clear TempCart first
//     TempCart.menuItems.clear();
//     TempCart.liquorItems.clear();
//     TempCart.fastFoodItems.clear();
//
//     // Sync from GlobalCart to TempCart
//     for (var item in cartItems) {
//       switch (item['type']) {
//         case 'menu':
//           TempCart.menuItems.add(item);
//           break;
//         case 'liquor':
//           TempCart.liquorItems.add(item);
//           break;
//         case 'fastfood':
//           TempCart.fastFoodItems.add(item);
//           break;
//       }
//     }
//   }
//
//   // ... rest of your methods remain the same
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
//     _updateGlobalCart();
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
//     _updateGlobalCart();
//   }
//
//   void deleteItem(int index) {
//     cartItems.removeAt(index);
//     cartItems.refresh();
//     _updateGlobalCart();
//   }
//
//   // ✅ NEW: Update GlobalCart when cart changes
//   void _updateGlobalCart() {
//     // Clear all GlobalCart orders first
//     for (int i = 0; i < GlobalCart.cartData.length; i++) {
//       GlobalCart.cartData[i]["order"].clear();
//     }
//
//     // Add current items back to GlobalCart
//     for (var item in cartItems) {
//       String catId = item['cat_id'] ?? "1"; // Default to food
//       int cartIndex = _getCartIndex(catId);
//
//       GlobalCart.cartData[cartIndex]["order"].add({
//         "prd_id": item['prd_id'],
//         "qty": item['qty']?.toString() ?? "1",
//         "price": item['price'],
//         "name": item['name'],
//         // Add liquor specific fields if needed
//         if (item['type'] == 'liquor') ...{
//           "small": item['small'],
//           "large": item['large'],
//         }
//       });
//     }
//   }
//
//   int _getCartIndex(String catId) {
//     switch (catId) {
//       case "1": return 0;
//       case "2": return 1;
//       case "90": return 2;
//       default: return 0;
//     }
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
// class ViewCartController extends GetxController {
//   RxList<Map<String, dynamic>> cartItems = <Map<String, dynamic>>[].obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     loadCartItems();
//   }
//
//   void loadCartItems() {
//     cartItems.value = [
//       ...TempCart.menuItems.map((e) => {...e, 'type': 'menu'}),
//       ...TempCart.liquorItems.map((e) => {...e, 'type': 'liquor'}),
//       ...TempCart.fastFoodItems.map((e) => {...e, 'type': 'fastfood'}),
//     ];
//   }
//
//   void _syncWithTempCart() {
//     TempCart.menuItems =
//         cartItems.where((e) => e['type'] == 'menu').toList();
//     TempCart.liquorItems =
//         cartItems.where((e) => e['type'] == 'liquor').toList();
//     TempCart.fastFoodItems =
//         cartItems.where((e) => e['type'] == 'fastfood').toList();
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
//
//
//
// }
