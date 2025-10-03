import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ControllerPage/TransactionController.dart';
import '../UtilsPage/ColorsPage.dart';
import '../wedgetPage/AppBar.dart';
import '../wedgetPage/GlobleList.dart';
import '../wedgetPage/SnackBarMessage.dart';
import 'OrderBillPage.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ControllerPage/TransactionController.dart';
import '../UtilsPage/ColorsPage.dart';
import '../wedgetPage/AppBar.dart';
import '../wedgetPage/SnackBarMessage.dart';
import 'OrderBillPage.dart';
import 'Payment_GetwayPage.dart';

// class OrderHistoryPage extends StatelessWidget {
//   final OrderHistoryController controller =
//   Get.put(OrderHistoryController());
//
//   OrderHistoryPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AdvancedAppBar(),
//       body: Container(
//         color: AppColors.primary.withOpacity(0.2),
//         child: Column(
//           children: [
//             // ===== SEARCH FIELD =====
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: TextField(
//                 decoration: InputDecoration(
//                   labelText: "Search by Transaction ID or Date",
//                   filled: true,
//                   fillColor: Colors.white,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   prefixIcon: const Icon(Icons.search),
//                 ),
//                 onChanged: (value) {
//                   controller.searchDate.value = value;
//                 },
//               ),
//             ),
//
//             // ===== LIST VIEW =====
//             Expanded(
//               child: Obx(() {
//                 if (controller.filteredTransactions.isEmpty) {
//                   return const Center(
//                     child: Text(
//                       "No transactions available",
//                       style: TextStyle(fontSize: 18),
//                     ),
//                   );
//                 }
//
//                 return ListView.builder(
//                   padding: EdgeInsets.only(
//                     top: 6,
//                     bottom: MediaQuery.of(context).padding.bottom + 12,
//                   ),
//                   itemCount: controller.filteredTransactions.length,
//                   itemBuilder: (context, index) {
//                     final transaction = controller.filteredTransactions[index];
//                     final details = transaction["details"] as List<dynamic>? ?? [];
//                     final totalAmount = details.fold<double>(
//                       0,
//                           (sum, item) => sum + double.tryParse(item["price"]?.toString() ?? "0")!,
//                     );
//
//                     final statuses = ["Pending", "Delivered", "Cancelled", "In Progress"];
//                     final possibleCategories = ["Food", "Liquor", "FastFood", "Snack"];
//                     final outerCategory = possibleCategories[index % possibleCategories.length];
//                     final status = statuses[index % statuses.length];
//                     final date = transaction["tran_datetime"] as String? ?? "";
//
//                     return Container(
//                       margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
//                       padding: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(16),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.2),
//                             blurRadius: 6,
//                             offset: const Offset(2, 4),
//                           ),
//                         ],
//                       ),
//                       child: ExpansionTile(
//                         title: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "Transaction: ${transaction["tran_id"]}",
//                                   style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                                 ),
//                                 const SizedBox(height: 4),
//                                 Text(
//                                   "Category: $outerCategory",
//                                   style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
//                                 ),
//                                 const SizedBox(height: 4),
//                                 Text(
//                                   "Status: $status",
//                                   style: TextStyle(
//                                     color: status == "Pending"
//                                         ? Colors.orange
//                                         : status == "Delivered"
//                                         ? Colors.green
//                                         : status == "Cancelled"
//                                         ? Colors.red
//                                         : Colors.blue,
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 Text(
//                                   transaction["tran_date"] ?? '',
//                                   style: const TextStyle(
//                                       color: Colors.black54, fontSize: 12, fontWeight: FontWeight.w500),
//                                 ),
//                                 Text(
//                                   transaction["tran_datetime"] != null
//                                       ? transaction["tran_datetime"].toString().split(' ')[1]
//                                       : '',
//                                   style: const TextStyle(
//                                     color: Colors.black54,
//                                     fontSize: 12,
//                                   ),
//                                 ),
//                               ],
//                             ),
//
//                           ],
//                         ),
//                         trailing: const Icon(Icons.expand_more, color: Colors.blue),
//                         children: [
//                           const Divider(color: Colors.grey),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 // ===== TOTAL AMOUNT ROW =====
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                 "Amount",
//
//                                       style: const TextStyle(fontWeight: FontWeight.w500),
//                                     ),
//                                     Text(
//                                       "${transaction["tran_amount"]} /-",
//                                       style: const TextStyle(fontWeight: FontWeight.w500),
//                                     ),
//                                   ],
//                                 ),
//                                 const Divider(color: Colors.black54),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       "Total: ₹${transaction["tran_amount"]}/-",
//                                       style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//                                     ),
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.start,
//                                       children: [
//                                         // Cancel Button
//
//
//                                         // View Button
//                                         InkWell(
//                                           onTap: () {
//                                             final memberData = GlobalList.memberData;
//                                             Get.to(() => OrderReceiptPage(
//                                               transaction: transaction,
//                                               memberData: memberData,
//                                             ));
//                                           },
//                                           child: Container(
//                                             height: 34,
//                                             width: 120,
//                                             decoration: BoxDecoration(
//                                               gradient: const LinearGradient(
//                                                 colors: [AppColors.khaki, AppColors.primary, AppColors.secondary],
//                                                 begin: Alignment.topLeft,
//                                                 end: Alignment.bottomRight,
//                                               ),
//                                               borderRadius: BorderRadius.circular(6),
//                                             ),
//                                             child: Center(
//                                               child: Row(
//                                                 mainAxisAlignment: MainAxisAlignment.center,
//                                                 children: const [
//                                                   Icon(Icons.remove_red_eye, color: Colors.white, size: 16),
//                                                   Text(
//                                                     " VIEW",
//                                                     style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               }),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ControllerPage/TransactionController.dart';
import '../UtilsPage/ColorsPage.dart';
import '../wedgetPage/AppBar.dart';
import '../wedgetPage/GlobleList.dart';
import 'OrderBillPage.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ControllerPage/TransactionController.dart';
import '../UtilsPage/ColorsPage.dart';
import '../wedgetPage/AppBar.dart';
import '../wedgetPage/GlobleList.dart';
import 'OrderBillPage.dart';

class TransactionHistoryPage extends StatelessWidget {
  final TransactionHistoryController controller = Get.put(
    TransactionHistoryController(),
  );
  final TextEditingController searchController = TextEditingController();

  TransactionHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdvancedAppBar(),
      body: Container(
        color: AppColors.primary.withOpacity(0.2),
        child: Column(
          children: [
            // ===== SEARCH FIELD WITH CALENDAR =====
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  labelText: "Search by Date",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (searchController.text.isNotEmpty)
                        IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            searchController.clear();
                            controller.searchDate.value = "";
                          },
                        ),
                      IconButton(
                        icon: const Icon(Icons.calendar_today),
                        onPressed: () {
                          _selectDate(context);
                        },
                      ),
                    ],
                  ),
                ),
                onChanged: (value) {
                  controller.searchDate.value = value;
                },
              ),
            ),

            // ===== LIST VIEW =====
            Expanded(
              child: Obx(() {
                // ✅ Loading state check करें
                final isLoading = controller.isLoading.value;
                final transactions = controller.filteredTransactions;
                final hasData = transactions.isNotEmpty;

                if (isLoading) {
                  // ✅ Loading indicator
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  );
                }

                if (!hasData) {
                  return const Center(
                    child: Text(
                      "No transactions available",
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                }

                return ListView.builder(
                  padding: EdgeInsets.only(
                    top: 6,
                    bottom: MediaQuery.of(context).padding.bottom + 12,
                  ),
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    final transaction = transactions[index];
                    final details = (transaction["details"] as List<dynamic>?) ?? [];

                    final totalAmount = details.fold<double>(
                      0,
                          (sum, item) =>
                      sum +
                          double.tryParse(item["price"]?.toString() ?? "0")!,
                    );

                    // Parse date and time
                    final datetime = transaction["tran_datetime"]?.toString() ?? "";
                    final datePart = datetime.split(" ").isNotEmpty
                        ? datetime.split(" ").first
                        : "";
                    final timePart = datetime.split(" ").length > 1
                        ? datetime.split(" ").last
                        : "";

                    return Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 12,
                      ),
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
                                  "Transaction Id: ${transaction["tran_id"]}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "Status: Success",
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  datePart,
                                  style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  timePart,
                                  style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        trailing: const Icon(
                          Icons.expand_more,
                          color: Colors.blue,
                        ),
                        children: [
                          const Divider(color: Colors.grey),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // ITEMS LIST
                                ...details.map((item) {
                                  final map = item as Map<String, dynamic>;
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          map["item"] ?? "",
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                        Text(
                                          "₹${map["price"] ?? "0"}",
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),

                                // AMOUNT ROW
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Amount",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "₹${transaction["tran_amount"] ?? totalAmount.toStringAsFixed(2)}/-",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 16),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        final memberData = GlobalList.memberData;
                                        Get.to(
                                              () => OrderReceiptPage(
                                            transaction: transaction,
                                            memberData: memberData,
                                          ),
                                        );
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
                                        child: const Center(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      final formattedDate =
          "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";

      controller.searchDate.value = formattedDate;
      searchController.text = formattedDate;
    }
  }
}

// OrderReceiptPage code remains same...
class OrderReceiptPage extends StatelessWidget {
  final Map<String, dynamic> transaction;
  final Map<String, dynamic>? memberData;

  const OrderReceiptPage({Key? key, required this.transaction, this.memberData})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name =
        "${GlobalList.memberData["member_fname"] ?? ""} ${GlobalList.memberData["member_lname"] ?? ""}";
    final no = GlobalList.memberData["member_code"] ?? "N/A";

    final datetime = transaction["tran_datetime"]?.toString() ?? "";
    final datePart = datetime.split(" ").isNotEmpty
        ? datetime.split(" ").first
        : "";
    final timePart = datetime.split(" ").length > 1
        ? datetime.split(" ").last
        : "";

    final details = (transaction["details"] as List<dynamic>?) ?? [];

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ===== HEADER =====
                  Center(
                    child: Column(
                      children: [
                        const Text(
                          "DSOI JABALPUR",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "$datePart, $timePart",
                          style: const TextStyle(fontSize: 12),
                        ),
                        Text(
                          "Transaction No: ${transaction["tran_id"]}",
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text("Name: $name", style: const TextStyle(fontSize: 13)),
                  Text("No: $no", style: const TextStyle(fontSize: 13)),

                  const SizedBox(height: 12),

                  Row(
                    children: const [
                      Expanded(
                        child: Text(
                          "NAME",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "AMT.",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(width: 16),
                      Text(
                        "QTY.",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  const Divider(thickness: 1),

                  // ITEMS LIST
                  ...details.map<Widget>((item) {
                    final map = item as Map<String, dynamic>;
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                map["item"] ?? "",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 13),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "₹${map["price"] ?? "0"}",
                              style: const TextStyle(fontSize: 13),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              map["qty"]?.toString() ?? "1",
                              style: const TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                        const Divider(thickness: 1),
                      ],
                    );
                  }).toList(),

                  const SizedBox(height: 8),

                  // TOTAL
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "₹${transaction["tran_amount"] ?? "0"}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  const Center(
                    child: Text(
                      "Thank You!",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  Center(
                    child: Image.asset(
                      "Assets/Drink/QR_code.png",
                      width: 100,
                      height: 100,
                    ),
                  ),
                ],
              ),
            ),

            // CLOSE BUTTON
            Positioned(
              top: 10,
              right: 10,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(6),
                  child: const Icon(Icons.close, size: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
