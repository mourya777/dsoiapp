import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturent/UtilsPage/ColorsPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../ControllerPage/HomeController.dart';
import '../ControllerPage/ManuController.dart';
import 'Payment_GetwayPage.dart';

class MenuItemsView extends StatelessWidget {
  final int categoryIndex;
  final String categoryName;

  MenuItemsView({Key? key, required this.categoryIndex, required this.categoryName}) : super(key: key);

  final MenuCardController controller = Get.find();
  final homeController = Get.put(HomeController());

  RxList items = RxList();

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
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.golden),
        title: Text(
          categoryName,
          style: TextStyle(color: AppColors.golden, fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: AppColors.white,
      body: Obx(() {
        return ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(item.image, width: 80, height: 80, fit: BoxFit.cover),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.name,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: AppColors.golden,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 6),
                          Text("${item.price}/-",
                              style: TextStyle(
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
                              if (qtyMap[index]! > 0) {
                                qtyMap[index] = qtyMap[index]! - 1;
                              }
                            },
                            icon: Icon(Icons.remove, color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            "${qtyMap[index]}",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade200,
                          ),
                          child: IconButton(
                            onPressed: () {
                              qtyMap[index] = qtyMap[index]! + 1;
                            },
                            icon: Icon(Icons.add, color: Colors.black),
                          ),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            );
          },
        );
      }),

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
                      // ✅ Delete old cart and save new data
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.remove("cart_items"); // delete old data
                      final encoded = selectedItems.map((e) {
                        return {
                          "name": e['item'].name,
                          "price": e['item'].price,
                          "image": e['item'].image,
                          "qty": e['qty'],
                        };
                      }).toList();
                      await prefs.setString("cart_items", jsonEncode(encoded));

                      Get.snackbar(
                        "Success",
                        "Order placed successfully!",
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
