import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturent/ScreenPage/BillingPage.dart';
import 'package:resturent/UtilsPage/ColorsPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../ControllerPage/HomeController.dart';
import '../ControllerPage/ManuController.dart';
import '../wedgetPage/AppBar.dart';
import '../wedgetPage/SnackBarMessage.dart';

<<<<<<< Updated upstream
class MenuItemsView extends StatelessWidget {
  final int categoryIndex;
  final String categoryName;
=======
// class MenuItemsPage extends StatelessWidget {
//   final String catId;
//   final CartController cartController;
//   final RxString searchQuery = "".obs;
//
//   MenuItemsPage({Key? key, required this.catId})
//       : cartController = Get.put(
//     CartController(catId: catId),
//   ),
//         super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//
//     cartController.cartItems.clear();
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: AppColors.primary,
//         title: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Image.asset(
//               'Assets/Images/appbar_logo-removebg-preview.png',
//               height: 50,
//               width: 50,
//             ),
//             const SizedBox(width: 10),
//             Text(
//               "${AppStrings.locationJabalpur}",
//               style: TextStyle(
//                 fontSize: 15,
//                 fontWeight: FontWeight.w900,
//                 color: AppColors.white,
//                 letterSpacing: 1.5,
//                 shadows: [
//                   Shadow(
//                     offset: Offset(2, 2),
//                     blurRadius: 4,
//                     color: Colors.black26,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         actions: [
//           Row(
//             children: [
//               IconButton(
//                 onPressed: () {
//                   Get.offAll(MenuView());
//                 },
//                 icon: Icon(Icons.menu, color: AppColors.white),
//               ),
//               SizedBox(width: 20),
//             ],
//           ),
//         ],
//       ),
//       body: Container(
//         color: AppColors.primary.withOpacity(0.2),
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: TextField(
//                   onChanged: (val) => searchQuery.value = val.toLowerCase(),
//                   decoration: const InputDecoration(
//                     hintText: "Search items...",
//                     prefixIcon: Icon(Icons.search),
//                     border: InputBorder.none,
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Obx(() {
//                 if (cartController.isLoading.value) {
//                   return const Center(child: CircularProgressIndicator());
//                 }
//
//                 final filtered = cartController.products
//                     .where(
//                       (p) => p.prdName.toLowerCase().contains(searchQuery.value),
//                 )
//                     .toList();
//
//                 if (filtered.isEmpty)
//                   return const Center(child: Text("No items found"));
//
//                 return ListView.builder(
//                   itemCount: filtered.length,
//                   itemBuilder: (context, index) {
//                     final item = filtered[index];
//                     return Card(
//                       color: AppColors.white,
//                       margin: const EdgeInsets.all(8),
//                       child: Container(
//                         height: 120,
//                         padding: const EdgeInsets.all(8),
//                         child: Row(
//                           children: [
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(8),
//                               child: Container(
//                                 width: 100,
//                                 height: 100,
//                                 color: Colors.grey[200],
//                                 child: Image.asset(
//                                   'Assets/Non-Veg/Egg Curry.jpeg',
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(width: 12),
//                             Expanded(
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     item.prdName.toUpperCase(),
//                                     maxLines: 1,
//                                     style: const TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 18,
//                                     ),
//                                   ),
//                                   Obx(() {
//                                     final qty =
//                                     cartController.getQtyForItem(item);
//                                     return Row(
//                                       mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Text(
//                                           "Qty:$qty",
//                                           style: const TextStyle(
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.bold,
//                                             color: AppColors.black,
//                                           ),
//                                         ),
//                                         Row(
//                                           children: [
//                                             IconButton(
//                                               onPressed: () {
//                                                 if (qty > 0) {
//                                                   cartController.updateItemQty(item, qty - 1);
//
//                                                   int index = GlobalCart.cartData[0]["order"]
//                                                       .indexWhere((e) => e["prd_id"] == item.prdId);
//
//                                                   if (index != -1) {
//                                                     int currentQty =
//                                                     int.parse(GlobalCart.cartData[0]["order"][index]["qty"]);
//                                                     currentQty -= 1;
//
//                                                     if (currentQty <= 0) {
//                                                       GlobalCart.cartData[0]["order"].removeAt(index); // ❌ qty 0 → remove
//                                                     } else {
//                                                       GlobalCart.cartData[0]["order"][index]["qty"] = "$currentQty"; // 🔄 update qty
//                                                     }
//                                                   }
//                                                 }
//                                               },
//                                               icon: const Icon(
//                                                 Icons.remove_circle,
//                                                 color: AppColors.primary,
//                                               ),
//                                             ),
//                                             IconButton(
//                                               onPressed: () {
//                                                 cartController.updateItemQty(item, qty + 1);
//
//                                                 // 🔺 GlobalCart में add / update
//                                                 int index = GlobalCart.cartData[0]["order"]
//                                                     .indexWhere((e) => e["prd_id"] == item.prdId);
//
//                                                 if (index != -1) {
//                                                   int currentQty =
//                                                   int.parse(GlobalCart.cartData[0]["order"][index]["qty"]);
//                                                   GlobalCart.cartData[0]["order"][index]["qty"] = "${currentQty + 1}";
//                                                 } else {
//                                                   GlobalCart.cartData[0]["order"].add({
//                                                     "prd_id": item.prdId,
//                                                     "qty": "1",
//                                                     "price": item.prdPrice,
//                                                   });
//                                                 }
//                                               },
//                                               icon: const Icon(
//                                                 Icons.add_circle,
//                                                 color: AppColors.primary,
//                                               ),
//                                             ),
//                                           ],
//                                         )
//
//
//                                       ],
//                                     );
//                                   }),
//                                   Text(
//                                     "₹${item.prdPrice}/-",
//                                     style: const TextStyle(
//                                       color: AppColors.primary,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 15,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               }),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Obx(() {
//         if (cartController.cartItems.isEmpty) return const SizedBox.shrink();
//
//         final total = TempCart.menuItems.fold<double>(
//           0,
//               (sum, item) {
//             final price = double.tryParse(item['price'].toString()) ?? 0;
//             final qty = int.tryParse(item['qty'].toString()) ?? 0;
//             return sum + (price * qty);
//           },
//         );
//
//         return Container(
//           padding: const EdgeInsets.all(12),
//           color: AppColors.white,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Total: ₹${total}/-",
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: AppColors.primary,
//                   fontSize: 18,
//                 ),
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   gradient: const LinearGradient(
//                     colors: [
//                       AppColors.khaki,
//                       AppColors.primary,
//                       AppColors.secondary,
//                     ],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                 ),
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: AppColors.transparent,
//                     foregroundColor: AppColors.transparent,
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 20,
//                       vertical: 12,
//                     ),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     elevation: 3,
//                   ),
//                   onPressed: () async {
//                     if (TempCart.menuItems.isEmpty) {
//                       CustomSnackBar.show(
//                         title: "Empty",
//                         message: "No items in cart!",
//                         icon: Icons.info,
//                         backgroundColor: AppColors.primary,
//                         textColor: AppColors.white,
//                         iconColor: AppColors.white,
//                       );
//                       return;
//                     }
//
//                     Get.to(() => ViewCartPage());
//                   },
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
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../ControllerPage/ManuitemController.dart';
import '../ModelsPage/ManuitemModels.dart';
import '../UtilsPage/ColorsPage.dart';
import '../UtilsPage/StringsPage.dart';
import '../UtilsPage/UrlPage.dart';
import '../wedgetPage/DetailsWidget.dart';
import '../wedgetPage/GlobleList.dart';
import '../wedgetPage/SnackBarMessage.dart';
import 'ViewCardPage.dart';
import 'ManuPage.dart';

// class MenuItemsPage extends StatelessWidget {
//   final String catId;
//   final CartController cartController;
//   final RxString searchQuery = "".obs;
//
//   MenuItemsPage({Key? key, required this.catId})
//       : cartController = Get.put(
//     CartController(catId: catId),
//   ),
//         super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//
//     cartController.cartItems.clear();
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: AppColors.primary,
//         title: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Image.asset(
//               'Assets/Images/appbar_logo-removebg-preview.png',
//               height: 50,
//               width: 50,
//             ),
//             const SizedBox(width: 10),
//             Text(
//               "${AppStrings.locationJabalpur}",
//               style: TextStyle(
//                 fontSize: 15,
//                 fontWeight: FontWeight.w900,
//                 color: AppColors.white,
//                 letterSpacing: 1.5,
//                 shadows: [
//                   Shadow(
//                     offset: Offset(2, 2),
//                     blurRadius: 4,
//                     color: Colors.black26,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         actions: [
//           Row(
//             children: [
//               IconButton(
//                 onPressed: () {
//                   Get.offAll(MenuView());
//                 },
//                 icon: Icon(Icons.menu, color: AppColors.white),
//               ),
//               SizedBox(width: 20),
//             ],
//           ),
//         ],
//       ),
//       body: Container(
//         color: AppColors.primary.withOpacity(0.2),
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: TextField(
//                   onChanged: (val) => searchQuery.value = val.toLowerCase(),
//                   decoration: const InputDecoration(
//                     hintText: "Search items...",
//                     prefixIcon: Icon(Icons.search),
//                     border: InputBorder.none,
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Obx(() {
//                 if (cartController.isLoading.value) {
//                   return const Center(child: CircularProgressIndicator());
//                 }
//
//                 final filtered = cartController.products
//                     .where(
//                       (p) => p.prdName.toLowerCase().contains(searchQuery.value),
//                 )
//                     .toList();
//
//                 if (filtered.isEmpty)
//                   return const Center(child: Text("No items found"));
//
//                 return ListView.builder(
//                   itemCount: filtered.length,
//                   itemBuilder: (context, index) {
//                     final item = filtered[index];
//                     return Card(
//                       color: AppColors.white,
//                       margin: const EdgeInsets.all(8),
//                       child: Container(
//                         height: 120,
//                         padding: const EdgeInsets.all(8),
//                         child: Row(
//                           children: [
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(8),
//                               child: Container(
//                                 width: 100,
//                                 height: 100,
//                                 color: Colors.grey[200],
//                                 child: Image.asset(
//                                   'Assets/Non-Veg/Egg Curry.jpeg',
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(width: 12),
//                             Expanded(
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     item.prdName.toUpperCase(),
//                                     maxLines: 1,
//                                     style: const TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 18,
//                                     ),
//                                   ),
//                                   Obx(() {
//                                     final qty =
//                                     cartController.getQtyForItem(item);
//                                     return Row(
//                                       mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Text(
//                                           "Qty:$qty",
//                                           style: const TextStyle(
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.bold,
//                                             color: AppColors.black,
//                                           ),
//                                         ),
//                                         Row(
//                                           children: [
//                                             IconButton(
//                                               onPressed: () {
//                                                 if (qty > 0) {
//                                                   cartController.updateItemQty(item, qty - 1);
//
//                                                   int index = GlobalCart.cartData[0]["order"]
//                                                       .indexWhere((e) => e["prd_id"] == item.prdId);
//
//                                                   if (index != -1) {
//                                                     int currentQty =
//                                                     int.parse(GlobalCart.cartData[0]["order"][index]["qty"]);
//                                                     currentQty -= 1;
//
//                                                     if (currentQty <= 0) {
//                                                       GlobalCart.cartData[0]["order"].removeAt(index); // ❌ qty 0 → remove
//                                                     } else {
//                                                       GlobalCart.cartData[0]["order"][index]["qty"] = "$currentQty"; // 🔄 update qty
//                                                     }
//                                                   }
//                                                 }
//                                               },
//                                               icon: const Icon(
//                                                 Icons.remove_circle,
//                                                 color: AppColors.primary,
//                                               ),
//                                             ),
//                                             IconButton(
//                                               onPressed: () {
//                                                 cartController.updateItemQty(item, qty + 1);
//
//                                                 // 🔺 GlobalCart में add / update
//                                                 int index = GlobalCart.cartData[0]["order"]
//                                                     .indexWhere((e) => e["prd_id"] == item.prdId);
//
//                                                 if (index != -1) {
//                                                   int currentQty =
//                                                   int.parse(GlobalCart.cartData[0]["order"][index]["qty"]);
//                                                   GlobalCart.cartData[0]["order"][index]["qty"] = "${currentQty + 1}";
//                                                 } else {
//                                                   GlobalCart.cartData[0]["order"].add({
//                                                     "prd_id": item.prdId,
//                                                     "qty": "1",
//                                                     "price": item.prdPrice,
//                                                   });
//                                                 }
//                                               },
//                                               icon: const Icon(
//                                                 Icons.add_circle,
//                                                 color: AppColors.primary,
//                                               ),
//                                             ),
//                                           ],
//                                         )
//
//
//                                       ],
//                                     );
//                                   }),
//                                   Text(
//                                     "₹${item.prdPrice}/-",
//                                     style: const TextStyle(
//                                       color: AppColors.primary,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 15,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               }),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Obx(() {
//         if (cartController.cartItems.isEmpty) return const SizedBox.shrink();
//
//         final total = TempCart.menuItems.fold<double>(
//           0,
//               (sum, item) {
//             final price = double.tryParse(item['price'].toString()) ?? 0;
//             final qty = int.tryParse(item['qty'].toString()) ?? 0;
//             return sum + (price * qty);
//           },
//         );
//
//         return Container(
//           padding: const EdgeInsets.all(12),
//           color: AppColors.white,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Total: ₹${total}/-",
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: AppColors.primary,
//                   fontSize: 18,
//                 ),
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   gradient: const LinearGradient(
//                     colors: [
//                       AppColors.khaki,
//                       AppColors.primary,
//                       AppColors.secondary,
//                     ],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                 ),
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: AppColors.transparent,
//                     foregroundColor: AppColors.transparent,
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 20,
//                       vertical: 12,
//                     ),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     elevation: 3,
//                   ),
//                   onPressed: () async {
//                     if (TempCart.menuItems.isEmpty) {
//                       CustomSnackBar.show(
//                         title: "Empty",
//                         message: "No items in cart!",
//                         icon: Icons.info,
//                         backgroundColor: AppColors.primary,
//                         textColor: AppColors.white,
//                         iconColor: AppColors.white,
//                       );
//                       return;
//                     }
//
//                     Get.to(() => ViewCartPage());
//                   },
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
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../ControllerPage/ManuitemController.dart';
import '../ModelsPage/ManuitemModels.dart';
import '../UtilsPage/ColorsPage.dart';
import '../UtilsPage/StringsPage.dart';
import '../UtilsPage/UrlPage.dart';
import '../wedgetPage/DetailsWidget.dart';
import '../wedgetPage/GlobleList.dart';
import '../wedgetPage/SnackBarMessage.dart';
import 'ViewCardPage.dart';
import 'ManuPage.dart';

// class MenuItemsPage extends StatelessWidget {
//   final String catId;
//   final CartController cartController;
//   final RxString searchQuery = "".obs;
//
//   MenuItemsPage({Key? key, required this.catId})
//       : cartController = Get.put(
//     CartController(catId: catId),
//   ),
//         super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//
//     cartController.cartItems.clear();
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: AppColors.primary,
//         title: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Image.asset(
//               'Assets/Images/appbar_logo-removebg-preview.png',
//               height: 50,
//               width: 50,
//             ),
//             const SizedBox(width: 10),
//             Text(
//               "${AppStrings.locationJabalpur}",
//               style: TextStyle(
//                 fontSize: 15,
//                 fontWeight: FontWeight.w900,
//                 color: AppColors.white,
//                 letterSpacing: 1.5,
//                 shadows: [
//                   Shadow(
//                     offset: Offset(2, 2),
//                     blurRadius: 4,
//                     color: Colors.black26,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         actions: [
//           Row(
//             children: [
//               IconButton(
//                 onPressed: () {
//                   Get.offAll(MenuView());
//                 },
//                 icon: Icon(Icons.menu, color: AppColors.white),
//               ),
//               SizedBox(width: 20),
//             ],
//           ),
//         ],
//       ),
//       body: Container(
//         color: AppColors.primary.withOpacity(0.2),
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: TextField(
//                   onChanged: (val) => searchQuery.value = val.toLowerCase(),
//                   decoration: const InputDecoration(
//                     hintText: "Search items...",
//                     prefixIcon: Icon(Icons.search),
//                     border: InputBorder.none,
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Obx(() {
//                 if (cartController.isLoading.value) {
//                   return const Center(child: CircularProgressIndicator());
//                 }
//
//                 final filtered = cartController.products
//                     .where(
//                       (p) => p.prdName.toLowerCase().contains(searchQuery.value),
//                 )
//                     .toList();
//
//                 if (filtered.isEmpty)
//                   return const Center(child: Text("No items found"));
//
//                 return ListView.builder(
//                   itemCount: filtered.length,
//                   itemBuilder: (context, index) {
//                     final item = filtered[index];
//                     return Card(
//                       color: AppColors.white,
//                       margin: const EdgeInsets.all(8),
//                       child: Container(
//                         height: 120,
//                         padding: const EdgeInsets.all(8),
//                         child: Row(
//                           children: [
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(8),
//                               child: Container(
//                                 width: 100,
//                                 height: 100,
//                                 color: Colors.grey[200],
//                                 child: Image.asset(
//                                   'Assets/Non-Veg/Egg Curry.jpeg',
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(width: 12),
//                             Expanded(
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     item.prdName.toUpperCase(),
//                                     maxLines: 1,
//                                     style: const TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 18,
//                                     ),
//                                   ),
//                                   Obx(() {
//                                     final qty =
//                                     cartController.getQtyForItem(item);
//                                     return Row(
//                                       mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Text(
//                                           "Qty:$qty",
//                                           style: const TextStyle(
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.bold,
//                                             color: AppColors.black,
//                                           ),
//                                         ),
//                                         Row(
//                                           children: [
//                                             IconButton(
//                                               onPressed: () {
//                                                 if (qty > 0) {
//                                                   cartController.updateItemQty(item, qty - 1);
//
//                                                   int index = GlobalCart.cartData[0]["order"]
//                                                       .indexWhere((e) => e["prd_id"] == item.prdId);
//
//                                                   if (index != -1) {
//                                                     int currentQty =
//                                                     int.parse(GlobalCart.cartData[0]["order"][index]["qty"]);
//                                                     currentQty -= 1;
//
//                                                     if (currentQty <= 0) {
//                                                       GlobalCart.cartData[0]["order"].removeAt(index); // ❌ qty 0 → remove
//                                                     } else {
//                                                       GlobalCart.cartData[0]["order"][index]["qty"] = "$currentQty"; // 🔄 update qty
//                                                     }
//                                                   }
//                                                 }
//                                               },
//                                               icon: const Icon(
//                                                 Icons.remove_circle,
//                                                 color: AppColors.primary,
//                                               ),
//                                             ),
//                                             IconButton(
//                                               onPressed: () {
//                                                 cartController.updateItemQty(item, qty + 1);
//
//                                                 // 🔺 GlobalCart में add / update
//                                                 int index = GlobalCart.cartData[0]["order"]
//                                                     .indexWhere((e) => e["prd_id"] == item.prdId);
//
//                                                 if (index != -1) {
//                                                   int currentQty =
//                                                   int.parse(GlobalCart.cartData[0]["order"][index]["qty"]);
//                                                   GlobalCart.cartData[0]["order"][index]["qty"] = "${currentQty + 1}";
//                                                 } else {
//                                                   GlobalCart.cartData[0]["order"].add({
//                                                     "prd_id": item.prdId,
//                                                     "qty": "1",
//                                                     "price": item.prdPrice,
//                                                   });
//                                                 }
//                                               },
//                                               icon: const Icon(
//                                                 Icons.add_circle,
//                                                 color: AppColors.primary,
//                                               ),
//                                             ),
//                                           ],
//                                         )
//
//
//                                       ],
//                                     );
//                                   }),
//                                   Text(
//                                     "₹${item.prdPrice}/-",
//                                     style: const TextStyle(
//                                       color: AppColors.primary,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 15,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               }),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Obx(() {
//         if (cartController.cartItems.isEmpty) return const SizedBox.shrink();
//
//         final total = TempCart.menuItems.fold<double>(
//           0,
//               (sum, item) {
//             final price = double.tryParse(item['price'].toString()) ?? 0;
//             final qty = int.tryParse(item['qty'].toString()) ?? 0;
//             return sum + (price * qty);
//           },
//         );
//
//         return Container(
//           padding: const EdgeInsets.all(12),
//           color: AppColors.white,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Total: ₹${total}/-",
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: AppColors.primary,
//                   fontSize: 18,
//                 ),
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   gradient: const LinearGradient(
//                     colors: [
//                       AppColors.khaki,
//                       AppColors.primary,
//                       AppColors.secondary,
//                     ],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                 ),
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: AppColors.transparent,
//                     foregroundColor: AppColors.transparent,
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 20,
//                       vertical: 12,
//                     ),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     elevation: 3,
//                   ),
//                   onPressed: () async {
//                     if (TempCart.menuItems.isEmpty) {
//                       CustomSnackBar.show(
//                         title: "Empty",
//                         message: "No items in cart!",
//                         icon: Icons.info,
//                         backgroundColor: AppColors.primary,
//                         textColor: AppColors.white,
//                         iconColor: AppColors.white,
//                       );
//                       return;
//                     }
//
//                     Get.to(() => ViewCartPage());
//                   },
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
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../ControllerPage/ManuitemController.dart';
import '../ModelsPage/ManuitemModels.dart';
import '../UtilsPage/ColorsPage.dart';
import '../UtilsPage/StringsPage.dart';
import '../UtilsPage/UrlPage.dart';
import '../wedgetPage/DetailsWidget.dart';
import '../wedgetPage/GlobleList.dart';
import '../wedgetPage/SnackBarMessage.dart';
import 'ViewCardPage.dart';
import 'ManuPage.dart';

class MenuItemsPage extends StatelessWidget {
  final String catId;
  final CartController cartController;
  final RxString searchQuery = "".obs;
>>>>>>> Stashed changes

  MenuItemsView({Key? key, required this.categoryIndex, required this.categoryName}) : super(key: key);

  final MenuCardController controller = Get.find();
  final homeController = Get.put(HomeController());

  RxList items = RxList();
  final RxString searchQuery = "".obs; // search text reactive
  final TextEditingController searchController = TextEditingController();

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
<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream
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
            .where((item) => item.name.toString().toLowerCase().contains(searchQuery.value))
            .toList();

        return Container(
          color: AppColors.primary.withOpacity(0.5),
          child: Column(
=======
=======
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
    cartController.cartItems.clear();
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
>>>>>>> Stashed changes
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

<<<<<<< Updated upstream
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: filteredItems.length,
=======
                final filtered = cartController.products
                    .where(
                      (p) => p.prdName.toLowerCase().contains(searchQuery.value),
                )
                    .toList();

                if (filtered.isEmpty) {
                  return const Center(child: Text("No items found"));
                }

                return ListView.builder(
                  itemCount: filtered.length,
>>>>>>> Stashed changes
                  itemBuilder: (context, index) {
                    final item = filteredItems[index];
                    final actualIndex = items.indexOf(item);

                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(item.image, width: 80, height: 80, fit: BoxFit.cover),
=======
=======
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
                            // ⬇️ IMAGE + STOCK INDICATOR
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    color: Colors.grey[200],
                                    child: Image.asset(
                                      'Assets/Non-Veg/Egg Curry.jpeg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 4,
                                  right: 4,
                                  child: _buildStockIndicator(item.prdStock),
                                ),
                              ],
<<<<<<< Updated upstream
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name,
                                    style: const TextStyle(
                                      fontSize: 18,
<<<<<<< Updated upstream
                                      color: AppColors.black,
=======
                                    ),
                                  ),
                                  Obx(() {
                                    final qty =
                                    cartController.getQtyForItem(item);
                                    return Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Qty:$qty",
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.black,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                if (qty > 0) {
                                                  cartController.updateItemQty(
                                                      item, qty - 1);

                                                  int index = GlobalCart
                                                      .cartData[0]["order"]
                                                      .indexWhere((e) =>
                                                  e["prd_id"] ==
                                                      item.prdId);

                                                  if (index != -1) {
                                                    int currentQty = int.parse(
                                                        GlobalCart.cartData[0]
                                                        ["order"][index]
                                                        ["qty"]);
                                                    currentQty -= 1;

                                                    if (currentQty <= 0) {
                                                      GlobalCart.cartData[0]
                                                      ["order"]
                                                          .removeAt(index);
                                                    } else {
                                                      GlobalCart.cartData[0]
                                                      ["order"][index]
                                                      ["qty"] =
                                                      "$currentQty";
                                                    }
                                                  }
                                                }
                                              },
                                              icon: const Icon(
                                                Icons.remove_circle,
                                                color: AppColors.primary,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                int stock = int.tryParse(
                                                    item.prdStock) ??
                                                    0;

                                                if (stock < 10) {
                                                  CustomSnackBar.show(
                                                    title: "Low Stock",
                                                    message:
                                                    "Sorry, stock is too low to order this item!",
                                                    icon: Icons.error,
                                                    backgroundColor: Colors.red,
                                                    textColor: Colors.white,
                                                    iconColor: Colors.white,
                                                  );
                                                  return;
                                                }

                                                cartController.updateItemQty(
                                                    item, qty + 1);

                                                int index = GlobalCart
                                                    .cartData[0]["order"]
                                                    .indexWhere((e) =>
                                                e["prd_id"] ==
                                                    item.prdId);

                                                if (index != -1) {
                                                  int currentQty = int.parse(
                                                      GlobalCart.cartData[0]
                                                      ["order"][index]
                                                      ["qty"]);
                                                  GlobalCart.cartData[0]
                                                  ["order"][index]
                                                  ["qty"] =
                                                  "${currentQty + 1}";
                                                } else {
                                                  GlobalCart.cartData[0]
                                                  ["order"]
                                                      .add({
                                                    "prd_id": item.prdId,
                                                    "qty": "1",
                                                    "price": item.prdPrice,
                                                  });
                                                }
                                              },
                                              icon: const Icon(
                                                Icons.add_circle,
                                                color: AppColors.primary,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    );
                                  }),
                                  Text(
                                    "₹${item.prdPrice}/-",
                                    style: const TextStyle(
                                      color: AppColors.primary,
>>>>>>> Stashed changes
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Obx(() => Row(
                                    children: [
                                      Text(
                                        "${item.price}/-",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: AppColors.primary,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(width: 60),

                                      Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey.shade200,
                                        ),
                                        child: IconButton(
                                          onPressed: () {
                                            if (qtyMap[actualIndex]! > 0) {
                                              qtyMap[actualIndex] = qtyMap[actualIndex]! - 1;
                                            }
                                          },
                                          icon: const Icon(Icons.remove, color: Colors.black),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8),
                                        child: Text(
                                          "${qtyMap[actualIndex]}",
                                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey.shade200,
                                        ),
                                        child: IconButton(
                                          onPressed: () {
                                            qtyMap[actualIndex] = qtyMap[actualIndex]! + 1;
                                          },
                                          icon: const Icon(Icons.add, color: Colors.black),
                                        ),
                                      ),

                                    ],
                                  ))
                                ],
                              ),
                            ),
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

      bottomNavigationBar: Obx(() {
        final selectedItems = <Map<String, dynamic>>[];
        for (int i = 0; i < items.length; i++) {
          if (qtyMap[i]! > 0) {
            selectedItems.add({"item": items[i], "qty": qtyMap[i]!});
          }
        }

        if (selectedItems.isEmpty) return SizedBox.shrink();

        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
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
                })}/-",
                style: const TextStyle(color: AppColors.primary, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.khakiLight, AppColors.primary, AppColors.secondary],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                      CustomSnackBar.show(
                        title: "Error",
                        message: "You don't have sufficient balance!",
                        icon: Icons.close,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        iconColor: Colors.white,
                      );


                    } else {
                      final prefs = await SharedPreferences.getInstance();
                      List<dynamic> existingCart = [];
                      final savedCart = prefs.getString("cart_items");
                      if (savedCart != null) existingCart = jsonDecode(savedCart);

                      for (var selected in selectedItems) {
                        final name = selected['item'].name;
                        final qty = selected['qty'];

                        // Check if item already exists in the cart
                        int index = existingCart.indexWhere((e) => e['name'] == name);
                        if (index != -1) {
                          // Item exists, increase its qty
                          existingCart[index]['qty'] = (existingCart[index]['qty'] ?? 0) + qty;
                        } else {
                          // Item does not exist, add it
                          existingCart.add({
                            "name": name,
                            "price": selected['item'].price,
                            "image": selected['item'].image,
                            "qty": qty,
                          });
                        }
                      }

                      await prefs.setString("cart_items", jsonEncode(existingCart));

                      CustomSnackBar.show(
                        title: "Success",
                        message: "Items added to cart successfully!",
                        icon: Icons.check_circle,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        iconColor: Colors.white,
                      );


                    }

<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream
                    // ✅ Correct navigation
                    Get.to(() => BillingPage());
=======
                    Get.to(() => ViewCartPage());
>>>>>>> Stashed changes
=======
                    Get.to(() => ViewCartPage());
>>>>>>> Stashed changes
=======
                    Get.to(() => ViewCartPage());
>>>>>>> Stashed changes
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    child: Text(
                      "Checkout",
                      style: TextStyle(color: AppColors.white, fontSize: 16, fontWeight: FontWeight.bold),
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

  // 🔹 STOCK INDICATOR FUNCTION
  Widget _buildStockIndicator(String stockStr) {
    int stock = int.tryParse(stockStr) ?? 0;
    Color color;

    if (stock > 100) {
      color = Colors.green;
    } else if (stock >= 10 && stock <= 100) {
      color = Colors.orange;
    } else {
      color = Colors.red;
    }

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.check,
        color: Colors.white,
        size: 16,
      ),
    );
  }
}
