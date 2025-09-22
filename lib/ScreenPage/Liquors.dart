import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../ControllerPage/LiquorController.dart';
import '../UtilsPage/ColorsPage.dart';
import '../ControllerPage/HomeController.dart';
import 'package:flutter/material.dart';

import '../wedgetPage/AppBar.dart';
import '../wedgetPage/SnackBarMessage.dart';
import 'BillingPage.dart';

class LiquorPage extends StatelessWidget {




  final LiquorController controller = Get.put(LiquorController());
  final HomeController homeController = Get.put(HomeController());

  final RxString searchQuery = "".obs;

  Color getTickColor(int stock) {
    if (stock > 100) return Colors.green;
    if (stock >= 10) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdvancedAppBar(),
      backgroundColor: AppColors.white,
      body:Obx(() {
        return Column(
          children: [
            // ✅ Search Bar
            Container(
              color: AppColors.primary.withOpacity(0.2),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: TextField(
                  onChanged: (value) => searchQuery.value = value.toLowerCase(),
                  decoration: InputDecoration(
                    hintText: "Search categories",
                    prefixIcon: const Icon(Icons.search, color: AppColors.black),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColors.black.withOpacity(0.3), width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColors.black.withOpacity(0.3), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColors.primary, width: 2),
                    ),
                  ),
                ),
              ),
            ),

            // ✅ Scrollable list of categories
            Expanded(
              child: Container(
                color: AppColors.primary.withOpacity(0.2),
                child: SingleChildScrollView(
                  child: Column(
                    children: controller.categories.map((cat) {
                      var item = controller.getCurrentItem(cat);
                      int stock = controller.stockLevels[cat] ?? 0;

                      if (searchQuery.isNotEmpty &&
                          !item['name'].toLowerCase().contains(searchQuery.value)) {
                        return const SizedBox.shrink();
                      }

                      return Obx(() {
                        var item = controller.getCurrentItem(cat);
                        bool hasOffer = controller.bogoOffers[cat]?.contains(controller.selectedTypeIndex[cat]) ?? false;

                        return Card(
                          margin: const EdgeInsets.all(12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: DropdownButton<int>(
                                        value: controller.selectedTypeIndex[cat],
                                        items: List.generate(
                                          controller.liquorData[cat]!.length,
                                              (index) => DropdownMenuItem(
                                            value: index,
                                            child: Text(
                                              controller.liquorData[cat]![index]['name'] as String,
                                              style: const TextStyle(color: AppColors.black),
                                            ),
                                          ),
                                        ),
                                        onChanged: (val) {
                                          if (stock < 10) {
                                            CustomSnackBar.show(
                                              title: "Error",
                                              message: "This brand not available!",
                                              icon: Icons.close,
                                              backgroundColor: Colors.red,
                                              textColor: Colors.white,
                                              iconColor: Colors.white,
                                            );




                                          } else {
                                            controller.selectedTypeIndex[cat] = val ?? 0;
                                          }
                                        },
                                      ),
                                    ),
                                    Icon(Icons.check_circle, color: getTickColor(stock)),
                                  ],
                                ),
                                if (hasOffer)
                                  const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 4.0),
                                    child: Text(
                                      "Buy 1 Get 1 Free!",
                                      style: TextStyle(
                                          color: Colors.red, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                const SizedBox(height: 8),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(item['image'],
                                          width: 90, height: 90, fit: BoxFit.cover),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(item['name'],
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                  color: AppColors.black)),
                                          const SizedBox(height: 6),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween, // ✅ Added alignment
                                            children: [
                                              Text(
                                                "₹${item['price']}/-",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.primary,
                                                ),
                                              ),
                                              Row(
                                                children: [

                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey.shade200,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: IconButton(
                                                      onPressed: () {
                                                        controller.removeItem(cat);
                                                      },
                                                      icon: const Icon(Icons.remove, color: Colors.black),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 6),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey.shade200,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: IconButton(
                                                      onPressed: () {
                                                        if (stock < 10) {

                                                          CustomSnackBar.show(
                                                            title: "Error",
                                                            message: "This brand not available!",
                                                            icon: Icons.close,
                                                            backgroundColor: Colors.red,
                                                            textColor: Colors.white,
                                                            iconColor: Colors.white,
                                                          );


                                                        } else {
                                                          controller.addItem(cat);
                                                        }
                                                      },
                                                      icon: const Icon(Icons.add, color: Colors.black),
                                                    ),
                                                  ),

                                                ],
                                              ),
                                            ],
                                          ),

                                          const SizedBox(height: 6),
                                          Text(
                                              "Small: ${controller.getSmall(cat)}   Large: ${controller.getLarge(cat)}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.primary)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        );
      }),

      bottomNavigationBar: Obx(() {
        int total = controller.getTotalPrice();
        if (total == 0) return SizedBox.shrink();
        return Container(
          height: 70,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(color: AppColors.white, boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total: ₹$total/-", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: AppColors.primary)),
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

                child:ElevatedButton(
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
                    final total = controller.getTotalPrice();

                    if (total > balance) {

                      CustomSnackBar.show(
                        title: "Error",
                        message: "You don't have sufficient balance!",
                        icon: Icons.close,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        iconColor: Colors.white,
                      );






                    } else {
                      // Save liquor cart separately
                      await controller.saveCart();

                      CustomSnackBar.show(
                        title: "Success",
                        message: "Liquor items added to cart successfully!",
                        icon: Icons.check_circle,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        iconColor: Colors.white,
                        // durationSeconds: 4, // optional
                      );






                      Get.to(BillingPage());
                    }
                  },
                  child: Text("Checkout", style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold)),
                )

              ),
            ],
          ),
        );
      }),
    );
  }
}

