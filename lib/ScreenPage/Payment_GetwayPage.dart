import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../ControllerPage/HomeController.dart';
import '../ControllerPage/ManuitemController.dart';
import '../ControllerPage/LiquorController.dart';
import '../UtilsPage/ColorsPage.dart';
import '../wedgetPage/AppBar.dart';

class AddToCartPage extends StatelessWidget {
  AddToCartPage({Key? key}) : super(key: key);

  final CartController controller = Get.put(CartController());
  final LiquorController liquorController = Get.put(LiquorController());
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AdvancedAppBar(),

    backgroundColor: AppColors.white,
      body: Obx(() {
        // combine both carts
        final combinedCart = [...controller.cartItems, ...liquorController.cartItems];

        if (combinedCart.isEmpty) {
          return Center(
            child: Text(
              "Your cart is empty",
              style: TextStyle(color: AppColors.primary, fontSize: 18),
            ),
          );
        }

        return Stack(
          children: [
            Container(
              color: AppColors.primary.withOpacity(0.2),
              child: ListView.builder(
                padding: EdgeInsets.only(bottom: 200),
                itemCount: combinedCart.length,
                itemBuilder: (context, index) {
                  var item = combinedCart[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(item['image'],
                                width: 80, height: 80, fit: BoxFit.cover),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['name'],
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 6),
                                item['type'] == 'liquor'
                                    ? Text(
                                  "Small: ${item['small']} | Large: ${item['large']}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColors.primary),
                                )
                                    : Text(
                                  "Qty: ${item['qty']}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColors.primary),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  "${item['price']}/-",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primary),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        shape: BoxShape.circle),
                                    child: IconButton(
                                      icon: Icon(Icons.remove, color: Colors.black),
                                      onPressed: () {
                                        if (item['type'] == 'liquor') {
                                          liquorController.removeItem(item['category']);
                                        } else {
                                          controller.updateQty(index, -1, '');
                                        }
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        shape: BoxShape.circle),
                                    child: IconButton(
                                      icon: Icon(Icons.add, color: Colors.black),
                                      onPressed: () {
                                        if (item['type'] == 'liquor') {
                                          liquorController.addItem(item['category']);
                                        } else {
                                          controller.updateQty(index, 1, '');
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  if (item['type'] == 'liquor') {
                                    liquorController.removeItem(item['category']);
                                  } else {
                                    controller.removeItem(index);
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 70,
              child: Obx(() {
                int total = controller.getTotalPrice() + liquorController.getTotalPrice();
                if (total == 0) return SizedBox.shrink();
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total: ₹$total/-",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.khakiLight,
                              AppColors.primary,
                              AppColors.secondary
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
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () async {
                            final balanceString = homeController.balance.value
                                .replaceAll(RegExp(r'[^0-9]'), '');
                            final balance = int.tryParse(balanceString) ?? 0;

                            if (total > balance) {




                              Get.snackbar(
                                "Error",
                                "You don't have sufficient balance.",
                                backgroundColor: AppColors.primary,
                                colorText: AppColors.white,
                                snackPosition: SnackPosition.BOTTOM,
                                borderColor: Colors.red,
                                borderWidth: 2,
                              );




                            } else {
                              await controller.saveCart();
                              await liquorController.saveCart();

                              final prefs = await SharedPreferences.getInstance();
                              await prefs.setString(
                                  "cart_items", jsonEncode(controller.cartItems));
                              await prefs.setString(
                                  "liquor_cart_items", jsonEncode(liquorController.cartItems));

                              Get.snackbar(
                                "Order",
                                "Your order ready in 5 minutes!",
                                backgroundColor: AppColors.primary,
                                colorText: AppColors.golden,
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            }
                          },
                          child: Text(
                            "RESET ODER",
                            style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        );
      }),
    );
  }
}
