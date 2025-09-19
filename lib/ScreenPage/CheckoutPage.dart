// //
// //
// // import 'package:flutter/material.dart';
// //
// // class CheckoutView extends StatelessWidget {
// //   final List<MenuItem> items;    // Selected items
// //   final double totalAmount;      // Total price
// //
// //   const CheckoutView({Key? key, required this.items, required this.totalAmount})
// //       : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("Checkout"),
// //         backgroundColor: Colors.deepPurple,
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           children: [
// //             Text(
// //               "Total Amount: ₹$totalAmount",
// //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// //             ),
// //             SizedBox(height: 16),
// //             Expanded(
// //               child: ListView.builder(
// //                 itemCount: items.length,
// //                 itemBuilder: (_, index) {
// //                   final item = items[index];
// //                   return ListTile(
// //                     leading: Image.network(item.image, width: 50, height: 50),
// //                     title: Text(item.name),
// //                     trailing: Text("${item.qty} x ₹${item.price}"),
// //                   );
// //                 },
// //               ),
// //             ),
// //             ElevatedButton(
// //               onPressed: () {
// //                 Get.snackbar("Payment", "Payment Successful",
// //                     snackPosition: SnackPosition.BOTTOM);
// //                 Get.offAll(MenuView());
// //               },
// //               style: ElevatedButton.styleFrom(
// //                   backgroundColor: Colors.deepPurple,
// //                   padding: EdgeInsets.symmetric(vertical: 14, horizontal: 30),
// //                   shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(15))),
// //               child: Text("Pay Now",
// //                   style: TextStyle(
// //                       color: Colors.white,
// //                       fontWeight: FontWeight.bold,
// //                       fontSize: 16)),
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../ControllerPage/HomeController.dart';
// import 'ManuPage.dart';
// import 'Payment_GetwayPage.dart';
//
// class CheckoutView extends StatelessWidget {
//   final List<MenuItem> items;
//   final double totalAmount;
//
//   const CheckoutView({Key? key, required this.items, required this.totalAmount})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final HomeController homeController = Get.find<HomeController>();
//
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: Colors.white),
//         title: Text("Checkout",
//             style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 22)),
//         backgroundColor: Colors.deepPurple,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           children: [
//             Text("Total Amount: ₹$totalAmount",
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
//             SizedBox(height: 16),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: items.length,
//                 itemBuilder: (_, index) {
//                   final item = items[index];
//                   return Card(
//                     margin: EdgeInsets.symmetric(vertical: 10),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(16)),
//                     elevation: 4,
//                     child: Padding(
//                       padding: const EdgeInsets.all(12),
//                       child: Row(
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(16),
//                             child: Image.network(
//                               item.image,
//                               width: 100,
//                               height: 100,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           SizedBox(width: 16),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(item.name,
//                                     style: TextStyle(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.black87)),
//                                 SizedBox(height: 6),
//                                 Text("Price: ₹${item.price.toStringAsFixed(2)}",
//                                     style: TextStyle(
//                                         fontSize: 16,
//                                         color: Colors.grey[700])),
//                               ],
//                             ),
//                           ),
//                           Text("${item.qty} x ₹${item.price}",
//                               style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w600,
//                                   color: Colors.deepPurple)),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 if (homeController.walletBalance.value >= totalAmount) {
//                   homeController.walletBalance.value -= totalAmount;
//                   Get.snackbar("Payment", "Payment Successful",
//                       snackPosition: SnackPosition.BOTTOM,
//                       backgroundColor: Colors.green.shade100,
//                       colorText: Colors.black);
//                   Get.offAll(MenuView());
//                 } else {
//                   Get.to(() => AddBalancePage());
//                 }
//               },
//               style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.deepPurple,
//                   padding: EdgeInsets.symmetric(vertical: 14, horizontal: 30),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15))),
//               child: Text("Pay Now",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18)),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
