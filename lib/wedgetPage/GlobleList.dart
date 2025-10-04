// class GlobalCart {
//   static List<Map<String, dynamic>> cartData = [
//     {
//       "cat_id": "90",
//       "member_id": "1",
//       "event_id": 1,
//       "checkout": "1",
//       "order": <List<Map<String, dynamic>>>[
//
//       ]
//     }
//   ];
// }
//GlobalCart.cartData[0]["cat_id"] = "90";

// GlobalCart.cartData[0]["order"].add([
// {
// "item_id": "123",
// "qty": 2,
// "price": "150.00"
// },
// {
// "item_id": "124",
// "qty": 1,
// "price": "200.00"
// }
// ]);
import 'package:get/get_rx/src/rx_types/rx_types.dart';
class GlobalCart {
  static List<Map<String, dynamic>> cartData = [
    {
      "cat_id": "1",
      "member_id": "1",
      "event_id": 1,
      "checkout": "1",
      "order": <Map<String, dynamic>>[]
    }, {
      "cat_id": "2",
      "member_id": "1",
      "event_id": 1,
      "checkout": "1",
      "order": <Map<String, dynamic>>[]
    }, {
      "cat_id": "90",
      "member_id": "1",
      "event_id": 1,
      "checkout": "1",
      "order": <Map<String, dynamic>>[]
    }
  ];
  /// Debug method to print cart status
  static void debugCartStatus() {
    print("=== GLOBAL CART STATUS ===");
    for (int i = 0; i < cartData.length; i++) {
      var category = cartData[i];
      print("Index $i (cat_id: ${category["cat_id"]}): ${category["order"].length} items");
      for (var order in category["order"]) {
        if (order['type'] == 'liquor') {
          print("   - LIQUOR: ${order['name']} (prd_id: ${order['prd_id']}, price: ${order['price']}, qty: ${order['qty']}, small: ${order['small']}, large: ${order['large']})");
        } else {
          print("   - ${order['name']} (prd_id: ${order['prd_id']}, price: ${order['price']}, qty: ${order['qty']})");
        }
      }
    }
    print("==========================");
  }
  /// Debug method to print cart status
  // static void debugCartStatus() {
  //   print("=== GLOBAL CART STATUS ===");
  //   for (int i = 0; i < cartData.length; i++) {
  //     var category = cartData[i];
  //     print("Index $i (cat_id: ${category["cat_id"]}): ${category["order"].length} items");
  //     for (var order in category["order"]) {
  //       print("   - ${order['name'] ?? order['prd_id']} (qty: ${order['qty']})");
  //     }
  //   }
  //   print("==========================");
  // }

  /// Clear all cart data
  static void clearAll() {
    for (int i = 0; i < cartData.length; i++) {
      cartData[i]["order"].clear();
    }
  }
}
// class GlobalCart {
//   static List<Map<String, dynamic>> cartData = [
//     {
//       "cat_id": "1",
//       "member_id": "1",
//       "event_id": 1,
//       "checkout": "1",
//       "order": <Map<String, dynamic>>[]
//     },{
//       "cat_id": "2",
//       "member_id": "1",
//       "event_id": 1,
//       "checkout": "1",
//       "order": <Map<String, dynamic>>[]
//     }, {
//       "cat_id": "90",
//       "member_id": "1",
//       "event_id": 1,
//       "checkout": "1",
//       "order": <Map<String, dynamic>>[]
//     }
//   ];
//
//   /// Add or update item in cart
//   static void addItemToCart(Map<String, dynamic> item) {
//     int index = cartData[0]["order"]
//         .indexWhere((e) => e["item_id"] == item["item_id"]);
//     if (index >= 0) {
//       cartData[0]["order"][index] = item; // Update existing
//     } else {
//       cartData[0]["order"].add(item); // Add new
//     }
//   }
//
//   /// Remove item from cart by item_id
//   static void removeItemFromCart(String itemId) {
//     cartData[0]["order"].removeWhere((e) => e["item_id"] == itemId);
//   }
// }
// "item_id": "123",
// "qty": 2,
// "type": "liquor",
// "small": 1,
// "large": 1,
// "price": "150.00"


// GlobalCart.cartData[0]["order"].add([
// {
// "item_id": "123",
// "qty": 2,
// "type": "liquor",
// "small": 1,
// "large": 1,
// "price": "150.00"
// }
// ]);



class GlobalList {
  static RxMap<String, dynamic> memberData = <String, dynamic>{}.obs;

  static RxList<Map<String, dynamic>> orders = <Map<String, dynamic>>[].obs;
}