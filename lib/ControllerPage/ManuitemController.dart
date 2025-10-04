import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../ApiControllers/ProductApiController.dart';
import '../ModelsPage/ManuitemModels.dart';
import '../UtilsPage/SessionManager.dart';
import '../UtilsPage/UrlPage.dart';
import '../wedgetPage/GlobleList.dart';


class CartController extends GetxController {
  RxList<Map<String, dynamic>> cartItems = <Map<String, dynamic>>[].obs;

  late final String catId;
  CartController({required this.catId});

  var products = <Product>[].obs;
  var isLoading = false.obs;
  var userBalance = "0".obs;

  @override
  void onInit() {
    loadCart();
    super.onInit();
    getUserId();
    fetchProducts();
  }

  Future<void> getUserId() async {
    final user = await SessionManager.getUser();
    if (user != null) {
      GlobalCart.cartData[0]["member_id"] = "${user.records.memberId}";
    }
  }

  int getQtyForItem(Product item) {
    final existing = cartItems.firstWhereOrNull((e) => e['id'] == item.prdId);
    return existing?['qty'] ?? 0;
  }

  void updateItemQty(Product item, int qty) {
    final index = cartItems.indexWhere((e) => e['id'] == item.prdId);

    if (qty <= 0) {
      if (index != -1) {
        cartItems.removeAt(index);
        removeItemFromGlobalCart(item);
      }
    } else {
      if (index != -1) {
        cartItems[index]['qty'] = qty;
        updateGlobalCartItem(item, qty);
      } else {
        cartItems.add({
          "id": item.prdId,
          "name": item.prdName ?? "Unnamed Item",
          "price": item.prdPrice,
          "qty": qty,
          "type": item.prdType,
        });
        addItemToGlobalCart(item, qty);
      }
    }

    cartItems.refresh();

    final itemPrice = double.tryParse(item.prdPrice.toString()) ?? 0;

    // Update TempCart dynamically
    if (item.prdType == "fastfood") {
      if (qty > 0) {
        TempCart.fastFoodItems.removeWhere((e) => e['id'] == item.prdId);
        TempCart.fastFoodItems.add({
          "id": item.prdId,
          "name": item.prdName ?? "Unnamed Item",
          "price": itemPrice,
          "qty": qty,
          "total": itemPrice * qty,
          "type": item.prdType,
        });
      } else {
        TempCart.fastFoodItems.removeWhere((e) => e['id'] == item.prdId);
      }
    } else {
      int tempIndex = TempCart.menuItems.indexWhere((e) => e['id'] == item.prdId);
      if (qty <= 0) {
        if (tempIndex != -1) TempCart.menuItems.removeAt(tempIndex);
      } else {
        final tempItem = {
          "id": item.prdId,
          "name": item.prdName ?? "Unnamed Item",
          "price": itemPrice,
          "qty": qty,
          "total": itemPrice * qty,
          "type": item.prdType,
        };
        if (tempIndex != -1) {
          TempCart.menuItems[tempIndex] = tempItem;
        } else {
          TempCart.menuItems.add(tempItem);
        }
      }
    }
  }

  Future<void> loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString("cart_items");
    if (data != null) {
      cartItems.value = List<Map<String, dynamic>>.from(jsonDecode(data));
    }
  }

  Future<void> saveCart() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("cart_items", jsonEncode(cartItems));
  }

  void fetchProducts() async {
    try {
      isLoading.value = true;
      final result = await ProductService.fetchProducts(catId: catId);
      products.value = result;
    } finally {
      isLoading.value = false;
    }
  }

  // ======= GlobalCart helper functions =======
  int getCartIndex() {
    switch (catId) {
      case "1":
        return 0; // Food
      case "2":
        return 1; // Liquor
      case "90":
        return 2; // Fastfood
      default:
        return 0;
    }
  }

  void addItemToGlobalCart(Product item, int qty) {
    int cartIndex = getCartIndex();
    int index = GlobalCart.cartData[cartIndex]["order"]
        .indexWhere((e) => e["prd_id"] == item.prdId);

    if (index != -1) {
      int currentQty = int.parse(GlobalCart.cartData[cartIndex]["order"][index]["qty"]);
      GlobalCart.cartData[cartIndex]["order"][index]["qty"] = "${currentQty + qty}";
    } else {
      GlobalCart.cartData[cartIndex]["order"].add({
        "prd_id": item.prdId,
        "name": item.prdName ?? "Unnamed Item", // ✅ ADD THIS LINE - FIXED
        "qty": "$qty",
        "price": item.prdPrice,
      });
    }
  }

  void updateGlobalCartItem(Product item, int qty) {
    int cartIndex = getCartIndex();
    int index = GlobalCart.cartData[cartIndex]["order"]
        .indexWhere((e) => e["prd_id"] == item.prdId);

    if (index != -1) {
      GlobalCart.cartData[cartIndex]["order"][index]["qty"] = "$qty";
    }
  }

  void removeItemFromGlobalCart(Product item) {
    int cartIndex = getCartIndex();
    GlobalCart.cartData[cartIndex]["order"]
        .removeWhere((e) => e["prd_id"] == item.prdId);
  }

  int getTotalPrice() {
    int total = 0;
    for (var item in cartItems) {
      double price = double.tryParse(item['price'].toString()) ?? 0;

      if (item['type'] == 'liquor') {
        int small = item['small'] ?? 0;
        int large = item['large'] ?? 0;
        total += ((small * price) + (large * price * 2)).round();
      } else {
        int qty = item['qty'] ?? 1;
        total += (price * qty).round();
      }
    }
    return total;
  }
}
// class CartController extends GetxController {
//   RxList<Map<String, dynamic>> cartItems = <Map<String, dynamic>>[].obs;
//
//   late final String catId;
//   CartController({required this.catId});
//
//   var products = <Product>[].obs;
//   var isLoading = false.obs;
//   var userBalance = "0".obs;
//
//   @override
//   void onInit() {
//     loadCart();
//     super.onInit();
//     getUserId();
//     fetchProducts();
//   }
//
//   Future<void> getUserId() async {
//     final user = await SessionManager.getUser();
//     if (user != null) {
//       GlobalCart.cartData[0]["member_id"] = "${user.records.memberId}";
//     }
//   }
//
//   int getQtyForItem(Product item) {
//     final existing = cartItems.firstWhereOrNull((e) => e['id'] == item.prdId);
//     return existing?['qty'] ?? 0;
//   }
//
//   void updateItemQty(Product item, int qty) {
//     final index = cartItems.indexWhere((e) => e['id'] == item.prdId);
//
//     if (qty <= 0) {
//       if (index != -1) {
//         cartItems.removeAt(index);
//         removeItemFromGlobalCart(item);
//       }
//     } else {
//       if (index != -1) {
//         cartItems[index]['qty'] = qty;
//         updateGlobalCartItem(item, qty);
//       } else {
//         cartItems.add({
//           "id": item.prdId,
//           "name": item.prdName,
//           "price": item.prdPrice,
//           "qty": qty,
//           "type": item.prdType,
//         });
//         addItemToGlobalCart(item, qty);
//       }
//     }
//
//     cartItems.refresh();
//
//     final itemPrice = double.tryParse(item.prdPrice.toString()) ?? 0;
//
//     // Update TempCart dynamically
//     if (item.prdType == "fastfood") {
//       if (qty > 0) {
//         TempCart.fastFoodItems.removeWhere((e) => e['id'] == item.prdId);
//         TempCart.fastFoodItems.add({
//           "id": item.prdId,
//           "name": item.prdName,
//           "price": itemPrice,
//           "qty": qty,
//           "total": itemPrice * qty,
//           "type": item.prdType,
//         });
//       } else {
//         TempCart.fastFoodItems.removeWhere((e) => e['id'] == item.prdId);
//       }
//     } else {
//       int tempIndex = TempCart.menuItems.indexWhere((e) => e['id'] == item.prdId);
//       if (qty <= 0) {
//         if (tempIndex != -1) TempCart.menuItems.removeAt(tempIndex);
//       } else {
//         final tempItem = {
//           "id": item.prdId,
//           "name": item.prdName,
//           "price": itemPrice,
//           "qty": qty,
//           "total": itemPrice * qty,
//           "type": item.prdType,
//         };
//         if (tempIndex != -1) {
//           TempCart.menuItems[tempIndex] = tempItem;
//         } else {
//           TempCart.menuItems.add(tempItem);
//         }
//       }
//     }
//   }
//
//   Future<void> loadCart() async {
//     final prefs = await SharedPreferences.getInstance();
//     final data = prefs.getString("cart_items");
//     if (data != null) {
//       cartItems.value = List<Map<String, dynamic>>.from(jsonDecode(data));
//     }
//   }
//
//   Future<void> saveCart() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString("cart_items", jsonEncode(cartItems));
//   }
//
//   void fetchProducts() async {
//     try {
//       isLoading.value = true;
//       final result = await ProductService.fetchProducts(catId: catId);
//       products.value = result;
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   // ======= GlobalCart helper functions =======
//   int getCartIndex() {
//     switch (catId) {
//       case "1":
//         return 0; // Food
//       case "2":
//         return 1; // Liquor
//       case "90":
//         return 2; // Fastfood
//       default:
//         return 0;
//     }
//   }
//
//   void addItemToGlobalCart(Product item, int qty) {
//     int cartIndex = getCartIndex();
//     int index = GlobalCart.cartData[cartIndex]["order"]
//         .indexWhere((e) => e["prd_id"] == item.prdId);
//
//     if (index != -1) {
//       int currentQty = int.parse(GlobalCart.cartData[cartIndex]["order"][index]["qty"]);
//       GlobalCart.cartData[cartIndex]["order"][index]["qty"] = "${currentQty + qty}";
//     } else {
//       GlobalCart.cartData[cartIndex]["order"].add({
//         "prd_id": item.prdId,
//         "qty": "$qty",
//         "price": item.prdPrice,
//       });
//     }
//   }
//
//   void updateGlobalCartItem(Product item, int qty) {
//     int cartIndex = getCartIndex();
//     int index = GlobalCart.cartData[cartIndex]["order"]
//         .indexWhere((e) => e["prd_id"] == item.prdId);
//
//     if (index != -1) {
//       GlobalCart.cartData[cartIndex]["order"][index]["qty"] = "$qty";
//     }
//   }
//
//   void removeItemFromGlobalCart(Product item) {
//     int cartIndex = getCartIndex();
//     GlobalCart.cartData[cartIndex]["order"]
//         .removeWhere((e) => e["prd_id"] == item.prdId);
//   }
//
//   int getTotalPrice() {
//     int total = 0;
//     for (var item in cartItems) {
//       double price = double.tryParse(item['price'].toString()) ?? 0;
//
//       if (item['type'] == 'liquor') {
//         int small = item['small'] ?? 0;
//         int large = item['large'] ?? 0;
//         total += ((small * price) + (large * price * 2)).round();
//       } else {
//         int qty = item['qty'] ?? 1;
//         total += (price * qty).round();
//       }
//     }
//     return total;
//   }
//
// }
