import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ControllerPage/TransactionController.dart';
import '../UtilsPage/ColorsPage.dart';
import '../wedgetPage/AppBar.dart';
import '../wedgetPage/SnackBarMessage.dart';
import 'OrderBillPage.dart';

class OrderHistoryPage extends StatelessWidget {
  final OrderHistoryController controller =
  Get.put(OrderHistoryController());

  OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AdvancedAppBar(),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.transactions.length,
          itemBuilder: (context, index) {
            var txn = controller.transactions[index];
            var details = txn["details"];

            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 3,
              child: ExpansionTile(
                leading: const Icon(Icons.shopping_bag, color: AppColors.primary),
                title: Text(
                  "${txn["title"]} (${txn["amount"]})",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(txn["date"]),
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildRow("Order ID:", details["orderId"]),
                        buildRow("Category:", details["category"]),
                        buildRow("Price:", details["price"]),
                        buildRow(
                          "Status:",
                          details["status"],
                          color: details["status"] == "Delivered"
                              ? Colors.green
                              : details["status"] == "Pending"
                              ? Colors.orange
                              : Colors.red,
                        ),
                        const SizedBox(height: 12),

                        // Action Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // Cancel Button with gradient
                            Container(
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    AppColors.white, AppColors.white],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  foregroundColor: Colors.white,
                                ),
                                onPressed: () {
                                  CustomSnackBar.show(
                                    title: "Cancelled",
                                    message: "Order ${details["orderId"]} cancelled",
                                    icon: Icons.close,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    iconColor: Colors.white,
                                  );

                                },
                                icon: const Icon(Icons.cancel, color: Colors.white),
                                label: const Text(
                                  "Cancel",
                                  style: TextStyle(color: AppColors.red),
                                ),
                              ),
                            ),

                            const SizedBox(width: 8),

                            // View Button with gradient
                            Container(
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    AppColors.khaki,
                                    AppColors.primary,
                                    AppColors.secondary],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  foregroundColor: Colors.white,
                                ),
                                onPressed: () {
                                  Get.to(() => OrderReceiptPage());
                                },
                                icon: const Icon(Icons.remove_red_eye, color: Colors.white),
                                label: const Text(
                                  "View",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        )

                      ],
                    ),
                  )
                ],
              ),
            );
          },
        );
      }),
    );
  }

  Widget buildRow(String label, String value, {Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(width: 6),
          Text(
            value,
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w500, color: color),
          ),
        ],
      ),
    );
  }
}

