import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturent/wedgetPage/AppBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../ControllerPage/HomeController.dart';
import '../ControllerPage/LiquorController.dart';
import '../ControllerPage/ManuitemController.dart';
import '../UtilsPage/ColorsPage.dart';
<<<<<<< Updated upstream
import '../wedgetPage/SnackBarMessage.dart';
=======

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../UtilsPage/ColorsPage.dart';
import '../UtilsPage/StringsPage.dart';
import '../wedgetPage/GlobleList.dart';
import 'BillingPage.dart';
>>>>>>> Stashed changes
import 'buttombarPage.dart';

class BillingPage extends StatefulWidget {
  const BillingPage({Key? key}) : super(key: key);

  @override
  _BillingPageState createState() => _BillingPageState();
}

class _BillingPageState extends State<BillingPage> {
  List<Map<String, dynamic>> cartItems = [];
  final CartController controller = Get.put(CartController());
  final LiquorController liquorController = Get.put(LiquorController());
  final HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    loadCartItems();
  }

  Future<void> loadCartItems() async {
    final prefs = await SharedPreferences.getInstance();

    // Load normal cart items
    List<Map<String, dynamic>> normalItems = [];
    final savedCart = prefs.getString("cart_items");
    if (savedCart != null) {
      final decoded = jsonDecode(savedCart) as List;
      normalItems = decoded.map((e) => Map<String, dynamic>.from(e)).toList();
    }

    // Load liquor cart items
    List<Map<String, dynamic>> liquorItems = [];
    final savedLiquorCart = prefs.getString("liquor_cart_items");
    if (savedLiquorCart != null) {
      final decodedLiquor = jsonDecode(savedLiquorCart) as List;
      liquorItems = decodedLiquor.map((e) {
        final map = Map<String, dynamic>.from(e);
        map['qty'] ??= 1; // Ensure qty exists
        return map;
      }).toList();
    }

    // Merge both lists
    cartItems = [...normalItems, ...liquorItems];

    setState(() {});
  }

  void updateCart() async {
    final prefs = await SharedPreferences.getInstance();

    // Split normal items and liquor items
    final normalItems = cartItems.where((e) => e['type'] != 'liquor').toList();
    final liquorItems = cartItems.where((e) => e['type'] == 'liquor').toList();

    await prefs.setString("cart_items", jsonEncode(normalItems));
    await prefs.setString("liquor_cart_items", jsonEncode(liquorItems));

    setState(() {});
  }

  int getTotal() {
    int total = 0;
    for (var item in cartItems) {
      final price =
          int.tryParse(item['price'].toString().replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
      final qty = int.tryParse(item['qty'].toString()) ?? 0;
      total += price * qty;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdvancedAppBar(),
      body: cartItems.isEmpty
          ? Center(
        child: Text(
          "Your cart is empty",
          style: TextStyle(fontSize: 18, color: AppColors.primary),
        ),
      )
          : Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: List.generate(cartItems.length, (index) {
                      final item = cartItems[index];
                      final qty = int.tryParse(item['qty'].toString()) ?? 0;

                      return Column(
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  item['image'],
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      // Item name
                                      Text(
                                        item['name'] ?? '',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${item['price'] ?? '0'}/-",
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.primary),
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color:
                                                  Colors.grey.shade200,
                                                ),
                                                child: IconButton(
                                                  icon: const Icon(
                                                      Icons.remove),
                                                  onPressed: () {
                                                    if (qty > 1) {
                                                      cartItems[index]
                                                      ['qty'] = qty - 1;
                                                    } else {
                                                      cartItems
                                                          .removeAt(index);
                                                    }
                                                    updateCart();
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets
                                                    .symmetric(
                                                    horizontal: 8),
                                                child: Text(
                                                  "$qty",
                                                  style: const TextStyle(
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                              ),
                                              // Plus Button
                                              Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color:
                                                  Colors.grey.shade200,
                                                ),
                                                child: IconButton(
                                                  icon:
                                                  const Icon(Icons.add),
                                                  onPressed: () {
                                                    cartItems[index]['qty'] =
                                                        qty + 1;
                                                    updateCart();
                                                  },
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          // Show qty or small/large
                                          Padding(
                                            padding: const EdgeInsets
                                                .symmetric(horizontal: 8),
                                            child: Text(
                                              item['type'] == 'liquor'
                                                  ? "Small: ${item['small'] ?? 0}  Large: ${item['large'] ?? 0}"
                                                  : "Qty: ${item['qty'] ?? 0}",
                                              style: const TextStyle(
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          // Delete Button
                                          IconButton(
                                            icon: const Icon(Icons.delete,
                                                color: Colors.red),
                                            onPressed: () {
                                              cartItems.removeAt(index);
                                              updateCart();
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
<<<<<<< Updated upstream
                          if (index < cartItems.length - 1)
                            const Divider(thickness: 1),
                        ],
                      );
                    }),
=======
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
                          GlobalCart.cartData[0]["order"].clear(); // ✅ Global list clear

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
>>>>>>> Stashed changes
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 4)
                ]),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total:-",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary),
                    ),
                    Text(
                      "₹${getTotal()}/-",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        AppColors.khaki,
                        AppColors.primary,
                        AppColors.secondary
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Parse balance and total
                      int currentBalance = int.tryParse(
                          homeController.balance.value.replaceAll('₹', '')) ?? 0;
                      int totalCart = controller.getTotalPrice() + liquorController.getTotalPrice();

                      if (currentBalance < totalCart) {
                        // Show insufficient balance message
                        CustomSnackBar.show(
                          title: "Insufficient Balance",
                          message: "Your balance is not enough to place this order.",
                          icon: Icons.error,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          iconColor: Colors.white,
                        );
                      } else {
                        // Show order placed message
                        CustomSnackBar.show(
                          title: "Order Placed",
                          message: "Your order will reach you in 5 minutes!",
                          icon: Icons.check_circle,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          iconColor: Colors.white,
                        );

                        // Update cart and navigate
                        updateCart();
                        Get.offAll(BottomNavPage());
                      }
                    },

<<<<<<< Updated upstream
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.transparent,
                        foregroundColor: AppColors.transparent,
                        padding:
                        const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: const Text(
                      "Place Order",
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
=======
class BillingPage extends StatelessWidget {
  final String userName;
  final List<Map<String, dynamic>> cartItems;

  BillingPage({Key? key, required this.userName, required this.cartItems}) : super(key: key);

  /// Generate text-based bill
  String generateBill() {
    final buffer = StringBuffer();
    buffer.writeln("\n\n");
    buffer.writeln("====================================");
    buffer.writeln("          ${AppStrings.locationJabalpur} BILL        ");
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
>>>>>>> Stashed changes
                  ),
                ),
              ],
            ),
<<<<<<< Updated upstream
          ),
        ],
=======
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                GlobalCart.cartData[0]["order"].clear(); // ✅ Global list clear

              },
              child: const Text(
                'Back',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
>>>>>>> Stashed changes
      ),
    );
  }
}
