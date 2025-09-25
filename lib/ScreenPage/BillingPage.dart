import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturent/ScreenPage/ManuPage.dart';
import '../UtilsPage/ColorsPage.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../UtilsPage/ColorsPage.dart';
import 'BillingPage.dart';
import 'buttombarPage.dart';

class ThankYouPage extends StatelessWidget {
  final String userName;
  final List<Map<String, dynamic>> cartItems;
  final String orderNo;
  final String? orderStatusMsg;
  final String? userType;

  ThankYouPage({
    Key? key,
    required this.userName,
    required this.cartItems,
    this.orderNo = "N/A",
    this.orderStatusMsg,
    this.userType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderDate = DateTime.now();
    final bool orderSuccess = orderStatusMsg == null;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              Icon(Icons.check_circle_outline,
                  size: 120,
                  color: orderSuccess ? AppColors.primary : AppColors.primary),
              const SizedBox(height: 20),
              Text(
                "THANK YOU!",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: orderSuccess ? AppColors.primary : AppColors.primary),
              ),
              const SizedBox(height: 16),
              Text(
                "Dear $userName",
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black),
              ),
              if (orderSuccess && userType != null) ...[
                const SizedBox(height: 8),
                Text(
                  "User Type: $userType",
                  style: const TextStyle(fontSize: 16, color: AppColors.black),
                ),
              ],
              const SizedBox(height: 16),
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (orderSuccess) ...[
                        Text("Order No: $orderNo",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 6),
                        Text(
                            "Date: ${orderDate.day}-${orderDate.month}-${orderDate.year} ${orderDate.hour}:${orderDate.minute}",
                            style: const TextStyle(fontSize: 14)),
                        const Divider(height: 20, thickness: 1),
                      ],
                      if (!orderSuccess) ...[
                        const SizedBox(height: 6),
                        Text(
                          orderStatusMsg!,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                      ],
                      if (orderSuccess && cartItems.isNotEmpty) ...[
                        SizedBox(
                          height: 100,
                          child: ListView.builder(
                            itemCount: cartItems.length,
                            itemBuilder: (context, index) {
                              final item = cartItems[index];
                              final isLiquor = item['type'] == 'liquor';
                              final qty = isLiquor
                                  ? ((item['small'] ?? 0) + (item['large'] ?? 0))
                                  : (item['qty'] ?? 1);
                              final price =
                                  double.tryParse(item['price'].toString()) ?? 0;
                              final totalPrice = isLiquor
                                  ? ((item['small'] ?? 0) * price +
                                  (item['large'] ?? 0) * price * 2)
                                  : price * qty;

                              return Padding(
                                padding:
                                const EdgeInsets.symmetric(vertical: 2),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("${item['name'] ?? ''}",
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500)),
                                    Text(
                                      "Qty: $qty  ₹${totalPrice.toStringAsFixed(0)}",
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: () {
                            Get.to(() => BillingPage(
                                userName: userName, cartItems: cartItems));
                          },
                          child: const Text(
                            "View",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary),
                          ),
                        ),
                      ],
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          Get.offAll(() => MenuView());
                        },
                        child: const Text(
                          "Back",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class BillingPage extends StatelessWidget {
  final String userName;
  final List<Map<String, dynamic>> cartItems;

  BillingPage({Key? key, required this.userName, required this.cartItems}) : super(key: key);

  /// Generate text-based bill
  String generateBill() {
    final buffer = StringBuffer();
    buffer.writeln("\n\n");
    buffer.writeln("====================================");
    buffer.writeln("          DSOMI Mhow Bill        ");
    buffer.writeln("====================================");
    buffer.writeln("Date: ${DateTime.now().toString().split(' ')[0]}");
    buffer.writeln("Customer: $userName");
    buffer.writeln("------------------------------------");

    int totalItems = 0;
    double totalPrice = 0;

    for (var item in cartItems) {
      String name = item['name'] ?? '';
      int qty = item['type'] == 'liquor'
          ? ((item['small'] ?? 0) + (item['large'] ?? 0)).toInt()
          : (item['qty'] ?? 1).toInt();
      double price = double.tryParse(item['price'].toString()) ?? 0;
      double itemTotal = item['type'] == 'liquor'
          ? ((item['small'] ?? 0) * price + (item['large'] ?? 0) * price * 2)
          : price * qty;

      totalItems += qty;
      totalPrice += itemTotal;

      buffer.writeln(
          "${name.padRight(20)} Qty:${qty.toString().padRight(3)} ₹${itemTotal.toStringAsFixed(0).padLeft(6)}/-");
    }

    buffer.writeln("------------------------------------");
    buffer.writeln("Total Items: $totalItems");
    buffer.writeln("Total Price: ₹${totalPrice.toStringAsFixed(0)}/-");
    buffer.writeln("====================================");

    return buffer.toString();
  }

  @override
  Widget build(BuildContext context) {
    final billText = generateBill();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  billText,
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: "Courier", // Monospace for alignment
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Back',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
