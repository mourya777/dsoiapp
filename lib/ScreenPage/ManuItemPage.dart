import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturent/UtilsPage/ColorsPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../ControllerPage/HomeController.dart';
import '../ControllerPage/ManuController.dart';
import '../wedgetPage/AppBar.dart';

class MenuItemsView extends StatelessWidget {
  final int categoryIndex;
  final String categoryName;

  MenuItemsView({Key? key, required this.categoryIndex, required this.categoryName}) : super(key: key);

  final MenuCardController controller = Get.find();
  final homeController = Get.put(HomeController());

  RxList items = RxList();
  final RxString searchQuery = "".obs; // ✅ search text reactive
  final TextEditingController searchController = TextEditingController();

  // ✅ Save items to local storage
  Future<void> saveSelectedItems(List<Map<String, dynamic>> selectedItems) async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = selectedItems.map((e) {
      return {
        "name": e['item'].name,
        "price": e['item'].price,
        "image": e['item'].image,
        "qty": e['qty'],
      };
    }).toList();
    await prefs.setString("cart_items", jsonEncode(encoded));
  }

  @override
  Widget build(BuildContext context) {
    switch (categoryIndex) {
      case 0:
        items = controller.vegItems;
        break;
      case 1:
        items = controller.nonVegItems;
        break;
      case 2:
        items = controller.snacks;
        break;
      case 3:
        items = controller.drinks;
        break;
      default:
        items = RxList();
    }

    final RxMap<int, int> qtyMap = <int, int>{}.obs;
    for (int i = 0; i < items.length; i++) {
      qtyMap[i] = 0;
    }

    return Scaffold(
      appBar: AdvancedAppBar(),

      backgroundColor: AppColors.white,
      body: Obx(() {
        final filteredItems = items
            .where((item) =>
            item.name.toString().toLowerCase().contains(searchQuery.value))
            .toList();

        return Container(
          color: AppColors.primary.withOpacity(0.5),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: TextField(
                  onChanged: (value) => searchQuery.value = value.toLowerCase(),
                  decoration: InputDecoration(
                    hintText: "Search items",
                    prefixIcon: const Icon(Icons.search, color: AppColors.black),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: AppColors.black.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: AppColors.black.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: AppColors.primary,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),

              // ✅ Expanded ListView
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) {
                    final item = filteredItems[index];
                    final actualIndex = items.indexOf(item); // map qty correctly

                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(item.image,
                                  width: 80, height: 80, fit: BoxFit.cover),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item.name, maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: AppColors.black,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 6),
                                  Text("${item.price}/-",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            Obx(() => Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.shade200,
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      if (qtyMap[actualIndex]! > 0) {
                                        qtyMap[actualIndex] =
                                            qtyMap[actualIndex]! - 1;
                                      }
                                    },
                                    icon: const Icon(Icons.remove,
                                        color: Colors.black),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8),
                                  child: Text(
                                    "${qtyMap[actualIndex]}",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.shade200,
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      qtyMap[actualIndex] =
                                          qtyMap[actualIndex]! + 1;
                                    },
                                    icon: const Icon(Icons.add,
                                        color: Colors.black),
                                  ),
                                ),
                              ],
                            ))
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

            ],
          ),
        );
      }),


      // ✅ Bottom nav remains same
      bottomNavigationBar: Obx(() {
        final selectedItems = <Map<String, dynamic>>[];
        for (int i = 0; i < items.length; i++) {
          if (qtyMap[i]! > 0) {
            selectedItems.add({
              "item": items[i],
              "qty": qtyMap[i]!,
            });
          }
        }

        if (selectedItems.isEmpty) return SizedBox.shrink();

        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total: ₹${selectedItems.fold<int>(0, (sum, item) {
                  final priceString = item['item'].price.toString().replaceAll(RegExp(r'[^0-9]'), '');
                  final price = int.tryParse(priceString) ?? 0;
                  final qty = item['qty'] as int;
                  return sum + (price * qty);
                })}",
                style: TextStyle(
                  color: AppColors.golden,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.khakiLight,
                      AppColors.primary,
                      AppColors.secondary,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async {
                    final balanceString = homeController.balance.value.replaceAll(RegExp(r'[^0-9]'), '');
                    final balance = int.tryParse(balanceString) ?? 0;

                    final total = selectedItems.fold<int>(0, (sum, item) {
                      final priceString = item['item'].price.toString().replaceAll(RegExp(r'[^0-9]'), '');
                      final price = int.tryParse(priceString) ?? 0;
                      final qty = item['qty'] as int;
                      return sum + (price * qty);
                    });

                    if (total > balance) {
                      Get.snackbar(
                        "Error",
                        "You don't have sufficient balance.",
                        backgroundColor: AppColors.primary,
                        colorText: AppColors.golden,
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    } else {
                      final prefs = await SharedPreferences.getInstance();

                      List<dynamic> existingCart = [];
                      final savedCart = prefs.getString("cart_items");
                      if (savedCart != null) {
                        existingCart = jsonDecode(savedCart);
                      }

                      final newItems = selectedItems.map((e) {
                        return {
                          "name": e['item'].name,
                          "price": e['item'].price,
                          "image": e['item'].image,
                          "qty": e['qty'],
                        };
                      }).toList();

                      existingCart.addAll(newItems);

                      await prefs.setString("cart_items", jsonEncode(existingCart));

                      Get.snackbar(
                        "Success",
                        "Items added to cart successfully!",
                        backgroundColor: AppColors.primary,
                        colorText: AppColors.golden,
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    }
                  },


                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    child: Text(
                      "Checkout",
                      style: TextStyle(
                        color: AppColors.golden,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
