import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../UtilsPage/ColorsPage.dart';

class AddToCardPage extends StatefulWidget {
  const AddToCardPage({Key? key,}) : super(key: key);

  @override
  State<AddToCardPage> createState() => _AddToCardPageState();
}

class _AddToCardPageState extends State<AddToCardPage> {
  List<Map<String, dynamic>> cartItems = [];

  @override
  void initState() {
    super.initState();
    loadCartItems();
  }

  Future<void> loadCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString("cart_items");
    if (data != null) {
      setState(() {
        cartItems = List<Map<String, dynamic>>.from(jsonDecode(data));
      });
    }
  }

  int getTotalPrice() {
    int total = 0;
    for (var item in cartItems) {
      int price = int.tryParse(item['price'].toString().replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
      int qty = (item['qty'] is int) ? item['qty'] : int.tryParse(item['qty'].toString()) ?? 0;
      total += price * qty;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart", style: TextStyle(color: AppColors.golden)),
        backgroundColor: AppColors.primary,
        iconTheme: IconThemeData(color: AppColors.golden),
      ),
      backgroundColor: AppColors.white,
      body: cartItems.isEmpty
          ? Center(
        child: Text(
          "No items in cart",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary),
        ),
      )
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: Image.asset(item['image'], width: 60, height: 60, fit: BoxFit.cover),
                    title: Text(item['name'], style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.golden)),
                    subtitle: Text("${item['price']} x ${item['qty']}"),
                    trailing: Text(
                      "₹${(int.tryParse(item['price'].toString().replaceAll(RegExp(r'[^0-9]'), '')) ?? 0) * item['qty']}/-",
                      style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary,fontSize: 15),
                    ),
                  ),
                );
              },
            ),
          ),

          // Bottom total and Payment button
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary),
                    ),
                    Text(
                      "₹${getTotalPrice()}/-",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary),
                    ),
                  ],
                ),
                const SizedBox(height: 70),
                // SizedBox(
                //   width: double.infinity,
                //   height: 50,
                //   child: ElevatedButton(
                //     onPressed: () {
                //       // Payment logic here
                //       Get.snackbar("Payment", "Proceed to Payment", snackPosition: SnackPosition.BOTTOM);
                //     },
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: AppColors.primary,
                //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                //     ),
                //     child: const Text(
                //       "Payment",
                //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.golden),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
