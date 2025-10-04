import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ControllerPage/Payment_GetwayController.dart';
import '../UtilsPage/ColorsPage.dart';
import '../UtilsPage/SessionManager.dart';
import '../wedgetPage/AppBar.dart';
import '../wedgetPage/GlobleList.dart';
import '../wedgetPage/SnackBarMessage.dart';

// class OrderHistoryPage extends StatelessWidget {
//   final OrderHistoryController controller = Get.put(
//     OrderHistoryController(),
//   );
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
//
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
//                   controller.searchText.value = value;
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
//                  return ListView.builder(
//                   padding: EdgeInsets.only(
//                     top: 6,
//                     bottom: MediaQuery.of(context).padding.bottom + 12, // extra bottom padding
//                   ),
//                   itemCount: controller.filteredTransactions.length,
//                   itemBuilder: (context, index) {
//                     final transaction = controller.filteredTransactions[index];
//                     final details = transaction["details"] as List<dynamic>;
//                     final totalAmount = details.fold<double>(
//                       0,
//                           (sum, item) => sum + double.tryParse(item["price"] ?? "0")!,
//                     );
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
//                             // LEFT SIDE
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "Orders Id: ${transaction["tran_id"]}",
//                                   style: const TextStyle(
//                                       fontWeight: FontWeight.bold, fontSize: 16),
//                                 ),
//                                 const SizedBox(height: 4),
//                                 Text(
//                                   "Category ID: ${transaction["title"]}",
//                                   style: const TextStyle(
//                                       fontWeight: FontWeight.w500, fontSize: 14),
//                                 ),
//                                 const SizedBox(height: 4),
//                                 Text(
//                                   "Status: ${transaction["status"]}",
//                                   style: TextStyle(
//                                     color: transaction["status"] == "Pending"
//                                         ? Colors.orange
//                                         : transaction["status"] == "Delivered"
//                                         ? Colors.green
//                                         : Colors.red,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             // RIGHT SIDE
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 Text(
//                                   transaction["date"] ?? "",
//                                   style: const TextStyle(
//                                       color: Colors.black54,
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                                 Text(
//                                   transaction["time"] ?? "",
//                                   style: const TextStyle(
//                                       color: Colors.black54,
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         trailing: const Icon(Icons.expand_more, color: Colors.blue),
//                         children: [
//                           const Divider(color: Colors.grey),
//                           ...details.map((item) {
//                             final map = item as Map<String, dynamic>;
//                             return Padding(
//                               padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 16),
//                               child: Column(
//                                 children: [
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text(
//                                         map["item"] ?? "",
//                                         style: const TextStyle(fontWeight: FontWeight.w500),
//                                       ),
//                                       Text(
//                                         "${map["price"]} /-",
//                                         style: const TextStyle(fontWeight: FontWeight.w500),
//                                       ),
//                                     ],
//                                   ),
//
//                                 ],
//                               ),
//                             );
//                           }).toList(),
//
//                           Padding(
//                             padding: const EdgeInsets.symmetric(
//                               vertical: 6,horizontal: 16
//                             ),
//                             child: Row(
//                               mainAxisAlignment:
//                               MainAxisAlignment
//                                   .spaceBetween,
//                               children: [
//                                 const Text(
//                                   "Total:",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 Text(
//                                   "₹${totalAmount.toStringAsFixed(2)}/-",
//                                   style: const TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//
//
//                           Align(
//                             alignment: Alignment.centerRight,
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   if ((transaction["status"] ??
//                                       "")
//                                       .toString()
//                                       .toLowerCase() ==
//                                       "pending")
//                                     InkWell(
//                                       onTap: () {
//                                         CustomSnackBar.show(
//                                           title: "Cancelled",
//                                           message:
//                                           "Order ${transaction["tran_id"]} cancelled",
//                                           icon: Icons.cancel,
//                                           backgroundColor:
//                                           Colors.red,
//                                           textColor: Colors.white,
//                                           iconColor: Colors.white,
//                                         );
//                                       },
//                                       child: Container(
//                                         padding:
//                                         const EdgeInsets.symmetric(
//                                           horizontal: 12,
//                                           vertical: 6,
//                                         ),
//                                         decoration: BoxDecoration(
//                                           color: Colors.red
//                                               .withOpacity(0.1),
//                                           borderRadius:
//                                           BorderRadius.circular(
//                                             8,
//                                           ),
//                                         ),
//                                         child: const Text(
//                                           "Cancel",
//                                           style: TextStyle(
//                                             color: Colors.red,
//                                             fontWeight:
//                                             FontWeight.bold,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   if ((transaction["status"] ??
//                                       "")
//                                       .toString()
//                                       .toLowerCase() ==
//                                       "pending")
//                                     const SizedBox(width: 8),
//
//
//                                   InkWell(
//                                     onTap: () {
//                                       final memberData =
//                                       GlobalPrefs.getMemberData();
//                                       Get.to(
//                                             () => TrasactionReceiPage(
//                                           transaction:
//                                           transaction,
//                                           memberData: memberData,
//                                         ),
//                                       );
//                                     },
//                                     child: Container(
//                                       height: 34,
//                                       width: 120,
//                                       decoration: BoxDecoration(
//                                         gradient:
//                                         const LinearGradient(
//                                           colors: [
//                                             AppColors.khaki,
//                                             AppColors.primary,
//                                             AppColors
//                                                 .secondary,
//                                           ],
//                                           begin: Alignment
//                                               .topLeft,
//                                           end: Alignment
//                                               .bottomRight,
//                                         ),
//                                         borderRadius:
//                                         BorderRadius.circular(
//                                           6,
//                                         ),
//                                       ),
//                                       child: Center(
//                                         child: Row(
//                                           mainAxisAlignment:
//                                           MainAxisAlignment
//                                               .center,
//                                           children: const [
//                                             Icon(
//                                               Icons
//                                                   .remove_red_eye,
//                                               color: Colors.white,
//                                               size: 16,
//                                             ),
//                                             Text(
//                                               " VIEW",
//                                               style: TextStyle(
//                                                 color:
//                                                 Colors.white,
//                                                 fontWeight:
//                                                 FontWeight
//                                                     .bold,
//                                                 fontSize: 12,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//
//                         ],
//                       ),
//                     );
//                   },
//                 );
//                 ;
//               }),
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }


class OrderHistoryPage extends StatelessWidget {
  final OrderHistoryController controller = Get.put(OrderHistoryController());
  final TextEditingController searchController = TextEditingController();

  OrderHistoryPage({super.key});

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
                            controller.searchText.value = "";
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
                  controller.searchText.value = value;
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
                    final details = transaction["details"] as List<dynamic>;
                    final totalAmount = details.fold<double>(
                      0,
                          (sum, item) => sum + double.tryParse(item["price"] ?? "0")!,
                    );

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
                            // LEFT SIDE
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Orders Id: ${transaction["tran_id"]}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "Category ID: ${transaction["title"]}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "Status: ${transaction["status"]}",
                                  style: TextStyle(
                                    color: transaction["status"] == "Pending"
                                        ? Colors.orange
                                        : transaction["status"] == "Delivered"
                                        ? Colors.green
                                        : Colors.red,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            // RIGHT SIDE
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  transaction["date"] ?? "",
                                  style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  transaction["time"] ?? "",
                                  style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
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
                          ...details.map((item) {
                            final map = item as Map<String, dynamic>;
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 3,
                                horizontal: 16,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        map["item"] ?? "",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        "${map["price"]} /-",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }).toList(),

                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 6,
                              horizontal: 16,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Total:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "₹${totalAmount.toStringAsFixed(2)}/-",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if ((transaction["status"] ?? "")
                                      .toString()
                                      .toLowerCase() ==
                                      "pending")
                                    InkWell(
                                      onTap: () {
                                        CustomSnackBar.show(
                                          title: "Cancelled",
                                          message: "Order ${transaction["tran_id"]} cancelled",
                                          icon: Icons.cancel,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          iconColor: Colors.white,
                                        );
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.red.withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: const Text(
                                          "Cancel",
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  if ((transaction["status"] ?? "")
                                      .toString()
                                      .toLowerCase() ==
                                      "pending")
                                    const SizedBox(width: 8),

                                  InkWell(
                                    onTap: () {
                                      final memberData = GlobalPrefs.getMemberData();
                                      Get.to(
                                            () => TrasactionReceiPage(
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
                          ),
                          const SizedBox(height: 8),
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

  // Date selection function
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

      controller.searchText.value = formattedDate;
      searchController.text = formattedDate;
    }
  }
}

class TrasactionReceiPage extends StatelessWidget {
  final Map<String, dynamic> transaction;
  final Map<String, dynamic>? memberData;

  const TrasactionReceiPage({
    Key? key,
    required this.transaction,
    this.memberData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name = memberData?["member_name"] ?? "Unknown";
    final no = memberData?["member_code"] ?? "N/A";

    return Scaffold(
      backgroundColor: Colors.white,
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
                        Text(
                          "${transaction["title"]}",
                          style: TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "${transaction["date"]}, ${transaction["time"]}",
                          style: const TextStyle(fontSize: 12),
                        ),
                        Text(
                          "Order No: ${transaction["tran_id"]}",
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    // "Name: $name",
                    "Name:${GlobalList.memberData["member_fname"] ?? ""} ${GlobalList.memberData["member_lname"] ?? ""}",

                    style: const TextStyle(fontSize: 13),
                  ),
                  Text("No: $no", style: const TextStyle(fontSize: 13)),

                  const SizedBox(height: 12),

                  // ITEMS HEADER
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
                  ...transaction["details"].map<Widget>((item) {
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
                            const Text("1", style: TextStyle(fontSize: 13)),
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
                        "₹${transaction["amount"] ?? "0"}",
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
