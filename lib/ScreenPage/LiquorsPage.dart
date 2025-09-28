import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../ControllerPage/LiquorController.dart';
import '../UtilsPage/ColorsPage.dart';
import '../ControllerPage/HomeController.dart';
import 'package:flutter/material.dart';

import '../UtilsPage/StringsPage.dart';
import '../UtilsPage/UrlPage.dart';
import '../wedgetPage/AppBar.dart';
import '../wedgetPage/GlobleList.dart';
import '../wedgetPage/SnackBarMessage.dart';
import 'ManuPage.dart';
import 'ViewCardPage.dart';

// class LiquorPage extends StatelessWidget {
//   final String catId; // ✅ Declare catId
//   final LiquorController controller;
//   final HomeController homeController = Get.put(HomeController());
//   final RxString searchQuery = "".obs;
//
//   LiquorPage({Key? key, required this.catId})
//     : controller = Get.put(
//         LiquorController(catId: catId),
//       ), // ✅ Initialize controller with catId
//       super(key: key);
//
//   Color getTickColor(int stock) {
//     if (stock > 100) return Colors.green;
//     if (stock >= 10) return Colors.orange;
//     return Colors.red;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           backgroundColor: AppColors.primary,
//           title: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Image.asset(
//                 'Assets/Images/appbar_logo-removebg-preview.png',
//                 height: 50,
//                 width: 50,
//               ),
//               const SizedBox(width: 10),
//               Text(
//                 "${AppStrings.locationJabalpur}",
//                 style: TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w900, // aur bold
//                   color: AppColors.white, // AppColors.golden bhi use kar sakte ho
//                   letterSpacing: 1.5, // thoda space letters ke beech
//                   shadows: [
//                     Shadow(
//                       offset: Offset(2, 2),
//                       blurRadius: 4,
//                       color: Colors.black26,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           actions: [
//             Row(
//               children: [
//                 IconButton(
//                   onPressed: () {
//                     Get.offAll(MenuView());
//                   },
//                   icon: Icon(Icons.menu, color: AppColors.white),
//                 ),
//                 SizedBox(width: 20),
//               ],
//             ),
//           ],
//         ),
//       backgroundColor: AppColors.white,
//       body: Obx(() {
//         return Column(
//           children: [
//             // ✅ Search Bar
//             Container(
//               color: AppColors.primary.withOpacity(0.2),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 16,
//                   vertical: 12,
//                 ),
//                 child: TextField(
//                   onChanged: (value) => searchQuery.value = value.toLowerCase(),
//                   decoration: InputDecoration(
//                     hintText: "Search categories",
//                     prefixIcon: const Icon(
//                       Icons.search,
//                       color: AppColors.black,
//                     ),
//                     filled: true,
//                     fillColor: Colors.white,
//                     contentPadding: const EdgeInsets.symmetric(
//                       horizontal: 16,
//                       vertical: 12,
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide: BorderSide(
//                         color: AppColors.black.withOpacity(0.3),
//                         width: 1,
//                       ),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide: BorderSide(
//                         color: AppColors.black.withOpacity(0.3),
//                         width: 1,
//                       ),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide: BorderSide(
//                         color: AppColors.primary,
//                         width: 2,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//
//             // ✅ Scrollable list of categories
//             Expanded(
//               child: Container(
//                 color: AppColors.primary.withOpacity(0.2),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: controller.categories.map((cat) {
//                       var item = controller.getCurrentItem(cat);
//                       int stock = controller.stockLevels[cat] ?? 0;
//
//                       if (searchQuery.isNotEmpty &&
//                           !item['name'].toLowerCase().contains(
//                             searchQuery.value,
//                           )) {
//                         return const SizedBox.shrink();
//                       }
//
//                       return Obx(() {
//                         var item = controller.getCurrentItem(cat);
//                         bool hasOffer =
//                             controller.bogoOffers[cat]?.contains(
//                               controller.selectedTypeIndex[cat],
//                             ) ??
//                             false;
//
//                         return Card(
//                           margin: const EdgeInsets.all(12),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(12),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Expanded(
//                                       child: DropdownButton<int>(
//                                         value:
//                                             controller.selectedTypeIndex[cat],
//                                         items: List.generate(
//                                           controller.liquorData[cat]!.length,
//                                           (index) => DropdownMenuItem(
//                                             value: index,
//                                             child: Text(
//                                               controller
//                                                       .liquorData[cat]![index]['name']
//                                                   as String,
//                                               style: const TextStyle(
//                                                 color: AppColors.black,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         onChanged: (val) {
//                                           if (stock < 10) {
//                                             CustomSnackBar.show(
//                                               title: "Error",
//                                               message:
//                                                   "This brand not available!",
//                                               icon: Icons.close,
//                                               backgroundColor: Colors.red,
//                                               textColor: Colors.white,
//                                               iconColor: Colors.white,
//                                             );
//                                           } else {
//                                             controller.selectedTypeIndex[cat] =
//                                                 val ?? 0;
//                                           }
//                                         },
//                                       ),
//                                     ),
//                                     Icon(
//                                       Icons.check_circle,
//                                       color: getTickColor(stock),
//                                     ),
//                                   ],
//                                 ),
//                                 if (hasOffer)
//                                   const Padding(
//                                     padding: EdgeInsets.symmetric(
//                                       vertical: 4.0,
//                                     ),
//                                     child: Text(
//                                       "Buy 1 Get 1 Free!",
//                                       style: TextStyle(
//                                         color: Colors.red,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                 const SizedBox(height: 8),
//                                 Row(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     ClipRRect(
//                                       borderRadius: BorderRadius.circular(12),
//                                       child: Image.asset(
//                                         item['image'],
//                                         width: 90,
//                                         height: 90,
//                                         fit: BoxFit.cover,
//                                       ),
//                                     ),
//                                     const SizedBox(width: 12),
//                                     Expanded(
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             item['name'],
//                                             style: const TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 16,
//                                               color: AppColors.black,
//                                             ),
//                                           ),
//                                           const SizedBox(height: 6),
//                                           Row(
//                                             mainAxisAlignment: MainAxisAlignment
//                                                 .spaceBetween, // ✅ Added alignment
//                                             children: [
//                                               Text(
//                                                 "₹${item['price']}/-",
//                                                 style: const TextStyle(
//                                                   fontWeight: FontWeight.bold,
//                                                   color: AppColors.primary,
//                                                 ),
//                                               ),
//                                               Row(
//                                                 children: [
//                                                   // - ICON
//                                                   Container(
//                                                     decoration: BoxDecoration(
//                                                       color: Colors.grey.shade200,
//                                                       shape: BoxShape.circle,
//                                                     ),
//                                                     child: IconButton(
//                                                       onPressed: () {
//                                                         controller.removeItem(cat);
//
//                                                         // 🟢 GlobalCart से हटाना
//                                                         GlobalCart.cartData[0]["order"].removeWhere(
//                                                               (orderItem) => orderItem["prd_id"] == "${item['prd_id']}",
//                                                         );
//
//                                                         print("Removed product: ${item['prd_id']}");
//                                                       },
//                                                       icon: const Icon(
//                                                         Icons.remove,
//                                                         color: Colors.black,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   const SizedBox(width: 6),
//
//                                                   // + ICON
//                                                   Container(
//                                                     decoration: BoxDecoration(
//                                                       color: Colors.grey.shade200,
//                                                       shape: BoxShape.circle,
//                                                     ),
//                                                     child: IconButton(
//                                                       onPressed: () {
//                                                         controller.addItem(cat);
//
//                                                         int smallQty = controller.getSmall(cat);
//                                                         int largeQty = controller.getLarge(cat);
//
//                                                         GlobalCart.cartData[0]["order"].add({
//                                                           "prd_id": "${item['id']}",   // ✅ अब सही key use होगी
//                                                           "qty": (smallQty + largeQty).toString(),
//                                                           "type": "liquor",
//                                                           "small": smallQty.toString(),
//                                                           "large": largeQty.toString(),
//                                                           "price": "${item['price']}",
//                                                         });
//
//                                                         print("Added product: ${item['prd_id']} small:$smallQty large:$largeQty");
//                                                       },
//                                                       icon: const Icon(
//                                                         Icons.add,
//                                                         color: Colors.black,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               )
//
//                                             ],
//                                           ),
//
//                                           const SizedBox(height: 6),
//                                           Text(
//                                             "Small: ${controller.getSmall(cat)}   Large: ${controller.getLarge(cat)}",
//                                             style: const TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               color: AppColors.primary,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       });
//                     }).toList(),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         );
//       }),
//
//       bottomNavigationBar: Obx(() {
//         int total = controller.getTotalPrice();
//         if (total == 0) return SizedBox.shrink();
//         return Container(
//           height: 70,
//           padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//           decoration: BoxDecoration(
//             color: AppColors.white,
//             boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Total: ₹$total/-",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18,
//                   color: AppColors.primary,
//                 ),
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [
//                       AppColors.khakiLight,
//                       AppColors.primary,
//                       AppColors.secondary,
//                     ],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.transparent,
//                     shadowColor: Colors.transparent,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   onPressed: () async {
//                     final balanceString = homeController.balance.value
//                         .replaceAll(RegExp(r'[^0-9]'), '');
//                     final balance = int.tryParse(balanceString) ?? 0;
//                     final total = controller.getTotalPrice();
//
//                     if (total > balance) {
//                       CustomSnackBar.show(
//                         title: "Error",
//                         message: "You don't have sufficient balance!",
//                         icon: Icons.close,
//                         backgroundColor: Colors.red,
//                         textColor: Colors.white,
//                         iconColor: Colors.white,
//                       );
//                     } else {
//                       TempCart.liquorItems.clear(); // ✅ Clear old cart
//
//                       for (var cat in controller.categories) {
//                         final item = controller.getCurrentItem(cat);
//                         final smallQty = controller.getSmall(cat);
//                         final largeQty = controller.getLarge(cat);
//
//                         if (smallQty > 0 || largeQty > 0) {
//                           TempCart.liquorItems.add({
//                             "name": item['name'],
//                             "price": item['price'].toString(),
//                             "image": item['image'],
//                             "small": smallQty,
//                             "large": largeQty,
//                             "item_id": item['item_id'],
//                             "type": "liquor",
//                           });
//                         }
//                       }
//
//                       CustomSnackBar.show(
//                         title: "Success",
//                         message: "Liquor items added to cart successfully!",
//                         icon: Icons.check_circle,
//                         backgroundColor: Colors.green,
//                         textColor: Colors.white,
//                         iconColor: Colors.white,
//                       );
//
//                       Get.off(() => ViewCartPage());
//                     }
//                   },
//
//                   child: Row(
//                     children: [
//                       Icon(
//                         Icons.card_membership,
//                         size: 20,
//                         color: AppColors.white,
//                       ),
//                       SizedBox(width: 6),
//                       const Text(
//                         "VIEWCARD",
//                         style: TextStyle(
//                           color: AppColors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../ControllerPage/LiquorController.dart';
import '../UtilsPage/ColorsPage.dart';
import '../ControllerPage/HomeController.dart';
import 'package:flutter/material.dart';

import '../UtilsPage/StringsPage.dart';
import '../UtilsPage/UrlPage.dart';
import '../wedgetPage/AppBar.dart';
import '../wedgetPage/GlobleList.dart';
import '../wedgetPage/SnackBarMessage.dart';
import 'ManuPage.dart';
import 'ViewCardPage.dart';

class LiquorPage extends StatelessWidget {
  final String catId; // ✅ Declare catId
  final LiquorController controller;
  final HomeController homeController = Get.put(HomeController());
  final RxString searchQuery = "".obs;

  LiquorPage({Key? key, required this.catId})
      : controller = Get.put(
    LiquorController(catId: catId),
  ), // ✅ Initialize controller with catId
        super(key: key);

  Color getTickColor(int stock) {
    if (stock > 100) return Colors.green;
    if (stock >= 10) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primary,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'Assets/Images/appbar_logo-removebg-preview.png',
              height: 50,
              width: 50,
            ),
            const SizedBox(width: 10),
            Text(
              "${AppStrings.locationJabalpur}",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w900,
                color: AppColors.white,
                letterSpacing: 1.5,
                shadows: [
                  Shadow(
                    offset: Offset(2, 2),
                    blurRadius: 4,
                    color: Colors.black26,
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Get.offAll(MenuView());
                },
                icon: Icon(Icons.menu, color: AppColors.white),
              ),
              SizedBox(width: 20),
            ],
          ),
        ],
      ),
      backgroundColor: AppColors.white,
      body: Obx(() {
        // 🟢 Loading indicator while data is fetching
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Column(
          children: [
            // ✅ Search Bar
            Container(
              color: AppColors.primary.withOpacity(0.2),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: TextField(
                  onChanged: (value) => searchQuery.value = value.toLowerCase(),
                  decoration: InputDecoration(
                    hintText: "Search categories",
                    prefixIcon: const Icon(
                      Icons.search,
                      color: AppColors.black,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
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
                          !item['name'].toLowerCase().contains(
                            searchQuery.value,
                          )) {
                        return const SizedBox.shrink();
                      }

                      return Obx(() {
                        var item = controller.getCurrentItem(cat);
                        bool hasOffer =
                            controller.bogoOffers[cat]?.contains(
                              controller.selectedTypeIndex[cat],
                            ) ??
                                false;

                        return Card(
                          margin: const EdgeInsets.all(12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: DropdownButton<int>(
                                        value:
                                        controller.selectedTypeIndex[cat],
                                        items: List.generate(
                                          controller.liquorData[cat]!.length,
                                              (index) => DropdownMenuItem(
                                            value: index,
                                            child: Text(
                                              controller
                                                  .liquorData[cat]![index]
                                              ['name']
                                              as String,
                                              style: const TextStyle(
                                                color: AppColors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                        onChanged: (val) {
                                          if (stock < 10) {
                                            CustomSnackBar.show(
                                              title: "Error",
                                              message:
                                              "This brand not available!",
                                              icon: Icons.close,
                                              backgroundColor: Colors.red,
                                              textColor: Colors.white,
                                              iconColor: Colors.white,
                                            );
                                          } else {
                                            controller.selectedTypeIndex[cat] =
                                                val ?? 0;
                                          }
                                        },
                                      ),
                                    ),
                                    Icon(
                                      Icons.check_circle,
                                      color: getTickColor(stock),
                                    ),
                                  ],
                                ),
                                if (hasOffer)
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 4.0,
                                    ),
                                    child: Text(
                                      "Buy 1 Get 1 Free!",
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                const SizedBox(height: 8),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(
                                        item['image'],
                                        width: 90,
                                        height: 90,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item['name'],
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: AppColors.black,
                                            ),
                                          ),
                                          const SizedBox(height: 6),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                                  // - ICON
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey.shade200,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: IconButton(
                                                      onPressed: () {
                                                        controller.removeItem(cat);
                                                        GlobalCart.cartData[0]
                                                        ["order"]
                                                            .removeWhere(
                                                              (orderItem) =>
                                                          orderItem["prd_id"] ==
                                                              "${item['prd_id']}",
                                                        );
                                                      },
                                                      icon: const Icon(
                                                        Icons.remove,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 6),

                                                  // + ICON
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey.shade200,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: IconButton(
                                                      onPressed: () {
                                                        controller.addItem(cat);

                                                        int smallQty =
                                                        controller.getSmall(cat);
                                                        int largeQty =
                                                        controller.getLarge(cat);

                                                        GlobalCart.cartData[0]["order"]
                                                            .add({
                                                          "prd_id": "${item['id']}",
                                                          "qty":
                                                          (smallQty + largeQty)
                                                              .toString(),
                                                          "type": "liquor",
                                                          "small": smallQty.toString(),
                                                          "large": largeQty.toString(),
                                                          "price": "${item['price']}",
                                                        });
                                                      },
                                                      icon: const Icon(
                                                        Icons.add,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 6),
                                          Text(
                                            "Small: ${controller.getSmall(cat)}   Large: ${controller.getLarge(cat)}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.primary,
                                            ),
                                          ),
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
          decoration: BoxDecoration(
            color: AppColors.white,
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total: ₹$total/-",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: AppColors.primary,
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
                    final balanceString = homeController.balance.value
                        .replaceAll(RegExp(r'[^0-9]'), '');
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
                      TempCart.liquorItems.clear();

                      for (var cat in controller.categories) {
                        final item = controller.getCurrentItem(cat);
                        final smallQty = controller.getSmall(cat);
                        final largeQty = controller.getLarge(cat);

                        if (smallQty > 0 || largeQty > 0) {
                          TempCart.liquorItems.add({
                            "name": item['name'],
                            "price": item['price'].toString(),
                            "image": item['image'],
                            "small": smallQty,
                            "large": largeQty,
                            "item_id": item['item_id'],
                            "type": "liquor",
                          });
                        }
                      }

                      CustomSnackBar.show(
                        title: "Success",
                        message: "Liquor items added to cart successfully!",
                        icon: Icons.check_circle,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        iconColor: Colors.white,
                      );

                      Get.off(() => ViewCartPage());
                    }
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.card_membership,
                        size: 20,
                        color: AppColors.white,
                      ),
                      SizedBox(width: 6),
                      const Text(
                        "VIEWCARD",
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ],
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
