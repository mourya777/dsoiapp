import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturent/wedgetPage/AppBar.dart';

import '../ControllerPage/Payment_GetwayController.dart';
import '../ControllerPage/TransactionController.dart';
import '../UtilsPage/ColorsPage.dart';
import '../wedgetPage/SnackBarMessage.dart';
import 'OrderBillPage.dart';




// class TransactionHistoryPage extends StatelessWidget {
//   final TransactionHistoryController controller =
//   Get.put(TransactionHistoryController());
//
//   TransactionHistoryPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AdvancedAppBar(),
//       body: Obx(() {
//         if (controller.transactions.isEmpty) {
//           return const Center(
//             child: Text(
//               "No transactions available",
//               style: TextStyle(fontSize: 18),
//             ),
//           );
//         }
//
//         return ListView.builder(
//           itemCount: controller.transactions.length,
//           itemBuilder: (context, index) {
//             var txn = controller.transactions[index];
//             var details = txn["details"];
//
//             return Card(
//               margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12)),
//               elevation: 3,
//               child: ExpansionTile(
//                 leading: Icon(
//                   _getIcon(txn["title"]),
//                   color: AppColors.primary,
//                 ),
//                 title: Text(
//                   "${txn["title"]} (${txn["amount"]})",
//                   style: const TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 subtitle: Text(txn["date"]),
//                 children: [
//                   Padding(
//                     padding:
//                     const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         buildRow("Order ID:", details["orderId"]),
//                         buildRow("Category:", details["category"]),
//                         buildRow("Price:", details["price"]),
//                         buildRow(
//                           "Status:",
//                           details["status"],
//                           color: details["status"] == "Delivered"
//                               ? Colors.green
//                               : details["status"] == "Pending"
//                               ? Colors.orange
//                               : Colors.red,
//                         ),
//                         const SizedBox(height: 12),
//
//                         // Action Buttons
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             // Cancel Button with gradient
//                             Container(
//                               decoration: BoxDecoration(
//                                 gradient: const LinearGradient(
//                                   colors: [
//                                     AppColors.white, AppColors.white],
//                                   begin: Alignment.topLeft,
//                                   end: Alignment.bottomRight,
//                                 ),
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               child: ElevatedButton.icon(
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: Colors.transparent,
//                                   shadowColor: Colors.transparent,
//                                   foregroundColor: Colors.white,
//                                 ),
//                                 onPressed: () {
//                                   CustomSnackBar.show(
//                                     title: "Cancelled",
//                                     message: "Order ${details["orderId"]} cancelled",
//                                     icon: Icons.close,
//                                     backgroundColor: Colors.red,
//                                     textColor: Colors.white,
//                                     iconColor: Colors.white,
//                                   );
//                                 },
//                                 icon: const Icon(Icons.cancel, color: Colors.white),
//                                 label: const Text(
//                                   "Cancel",
//                                   style: TextStyle(color: AppColors.red),
//                                 ),
//                               ),
//                             ),
//
//                             const SizedBox(width: 8),
//
//                             // View Button with gradient
//                             Container(
//                               decoration: BoxDecoration(
//                                 gradient: const LinearGradient(
//                                   colors: [
//                                     AppColors.khaki,
//                                     AppColors.primary,
//                                     AppColors.secondary],
//                                   begin: Alignment.topLeft,
//                                   end: Alignment.bottomRight,
//                                 ),
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               child: ElevatedButton.icon(
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: Colors.transparent,
//                                   shadowColor: Colors.transparent,
//                                   foregroundColor: Colors.white,
//                                 ),
//                                 onPressed: () {
//                                   Get.to(() => OrderReceiptPage());
//                                 },
//                                 icon: const Icon(Icons.remove_red_eye, color: Colors.white),
//                                 label: const Text(
//                                   "View",
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             );
//           },
//         );
//       }),
//     );
//   }
//
//   /// Helper widget to build rows
//   Widget buildRow(String label, String value, {Color? color}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 3),
//       child: Row(
//         children: [
//           Text(
//             label,
//             style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//           ),
//           const SizedBox(width: 6),
//           Text(
//             value,
//             style: TextStyle(
//                 fontSize: 15, fontWeight: FontWeight.w500, color: color),
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// Return an icon based on the category
//   IconData _getIcon(String category) {
//     switch (category) {
//       case "Food":
//         return Icons.fastfood;
//       case "Liquor":
//         return Icons.local_drink;
//       case "Snack":
//         return Icons.local_pizza;
//       case "Fast Food":
//         return Icons.lunch_dining;
//       default:
//         return Icons.shopping_bag;
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../UtilsPage/ColorsPage.dart';
import '../wedgetPage/SnackBarMessage.dart';
import '../wedgetPage/AppBar.dart';
import '../ControllerPage/TransactionController.dart';
import 'OrderBillPage.dart';

class TransactionHistoryPage extends StatelessWidget {
  final TransactionHistoryController controller =
  Get.put(TransactionHistoryController());

  TransactionHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdvancedAppBar(),
      body: Container(
        color: AppColors.primary.withOpacity(0.2),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Search by date",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.search),
                ),
                onChanged: (value) {
                  controller.searchDate.value = value;
                },
              ),
            ),
            Expanded(
              child: Obx(
                    () => SingleChildScrollView(
                  child: Column(
                    children: controller.filteredTransactions.map((transaction) {
                      final details = transaction["details"] as List<dynamic>;
                      final date = transaction["date"] as String? ?? "";
                      final status = transaction["status"] as String? ?? "";

                      return Container(
                        margin:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 6,
                              offset: const Offset(2, 4),
                            ),
                          ],
                        ),
                        child: ExpansionTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Order ID: ${controller.transactions.indexOf(transaction) + 1000}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 16),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "Category: ${transaction["title"]}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500, fontSize: 14),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "Status: $status",
                                    style: TextStyle(
                                      color: status == "Pending"
                                          ? Colors.orange
                                          : status == "Delivered"
                                          ? Colors.green
                                          : Colors.red,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                date,
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          trailing: const Icon(Icons.expand_more, color: Colors.blue),
                          children: [
                            const Divider(color: Colors.grey),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ...details.map((itemObj) {
                                    final item = itemObj as Map<String, dynamic>;
                                    final itemName = item["item"] as String? ?? "";
                                    final itemPrice = item["price"] as String? ?? "";
                                    return Padding(
                                      padding:
                                      const EdgeInsets.symmetric(vertical: 3),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            itemName,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            "$itemPrice/-",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                  const SizedBox(height: 8),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        // Cancel Button
                                        InkWell(
                                          onTap: () {
                                            CustomSnackBar.show(
                                              title: "Cancelled",
                                              message:
                                              "Order ${controller.transactions.indexOf(transaction) + 1000} cancelled",
                                              icon: Icons.cancel,
                                              backgroundColor: Colors.red,
                                              textColor: Colors.white,
                                              iconColor: Colors.white,
                                            );
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                            decoration: BoxDecoration(
                                              color: Colors.red.withOpacity(0.1),
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            child: const Text(
                                              "Cancel",
                                              style: TextStyle(
                                                  color: Colors.red, fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 8),

                                        // View Button
                                        InkWell(
                                          onTap: () {
                                            Get.to(OrderReceiptPage());
                                          },
                                          child: Container(
                                            height: 34,
                                            width: 120,
                                            decoration: BoxDecoration(
                                              gradient: const LinearGradient(
                                                colors: [
                                                  AppColors.khaki,
                                                  AppColors.primary,
                                                  AppColors.secondary,
                                                ],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ),
                                              borderRadius: BorderRadius.circular(6),
                                            ),
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: const [
                                                  Icon(
                                                    Icons.remove_red_eye,
                                                    color: Colors.white,
                                                    size: 16,
                                                  ),
                                                  Text(
                                                    " VIEW",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

