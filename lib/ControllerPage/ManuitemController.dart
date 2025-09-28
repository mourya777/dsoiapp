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
      print("User ID: ${user.records.memberId}");
      GlobalCart.cartData[0]["member_id"] = "${user.records.memberId}";
      print("member id this!${GlobalCart.cartData[0]["member_id"]}");

    } else {
      print("member id this!${GlobalCart.cartData[0]["member_id"]}");
    }
  }
  int getQtyForItem(Product item) {
    final existing = cartItems.firstWhereOrNull(
          (e) => e['id'] == item.prdId,
    );
    return existing?['qty'] ?? 0;
  }

  void updateItemQty(Product item, int qty) {
    final index = cartItems.indexWhere((e) => e['id'] == item.prdId);

    if (qty <= 0) {
      if (index != -1) cartItems.removeAt(index);
    } else {
      if (index != -1) {
        cartItems[index]['qty'] = qty;
      } else {
        cartItems.add({
          "id": item.prdId,
          "name": item.prdName,
          "price": item.prdPrice,
          "qty": qty,
          "type": item.prdType,
        });
      }
    }

    cartItems.refresh();

    // Update TempCart dynamically based on type
    final itemPrice = double.tryParse(item.prdPrice.toString()) ?? 0;

    if (item.prdType == "fastfood") {
      if (qty > 0) {
        TempCart.fastFoodItems.clear();
        TempCart.fastFoodItems.add({
          "id": item.prdId,
          "name": item.prdName,
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
          "name": item.prdName,
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




  void fetchProducts() async {
    try {
      isLoading.value = true;
      final result = await ProductService.fetchProducts(catId: catId);
      print("API response length: ${result.length}");
      products.value = result;
    } finally {
      isLoading.value = false;
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

  void addItem(Map<String, dynamic> item) {
    int index = cartItems.indexWhere(
          (e) => e['name'] == item['name'] && e['type'] == item['type'],
    );

    int addedQty = item['qty'] ?? 1;

    if (index >= 0) {
      if (item['type'] == 'liquor') {
        cartItems[index]['small'] =
            (cartItems[index]['small'] ?? 0) + (item['small'] ?? 0);
        cartItems[index]['large'] =
            (cartItems[index]['large'] ?? 0) + (item['large'] ?? 0);
      } else {
        cartItems[index]['qty'] = (cartItems[index]['qty'] ?? 1) + addedQty;
      }
    } else {
      if (item['type'] != 'liquor') item['qty'] = addedQty;
      else {
        item['small'] = item['small'] ?? 0;
        item['large'] = item['large'] ?? 0;
      }
      cartItems.add(item);
    }

    cartItems.refresh();
    saveCart();
  }

  void updateQty(int index, int delta, String key) {
    var item = cartItems[index];
    if (item['type'] == 'liquor') {
      int current = item[key] ?? 0;
      current += delta;
      if (current < 0) current = 0;
      item[key] = current;
    } else {
      int currentQty = item['qty'] ?? 1;
      currentQty += delta;
      if (currentQty <= 0) {
        cartItems.removeAt(index);
        saveCart();
        return;
      } else {
        item['qty'] = currentQty;
      }
    }
    cartItems.refresh();
    saveCart();
  }

  void removeItem(int index) {
    cartItems.removeAt(index);
    cartItems.refresh();
    saveCart();
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
