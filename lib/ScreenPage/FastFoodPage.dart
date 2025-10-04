import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ControllerPage/ManuitemController.dart';
import '../UtilsPage/ColorsPage.dart';
import '../UtilsPage/StringsPage.dart';
import '../wedgetPage/GlobleList.dart';
import '../wedgetPage/SnackBarMessage.dart';
import 'ViewCardPage.dart';
import 'ManuPage.dart';

class FastFoodPage extends StatelessWidget {
  final String catId;
  late final CartController cartController;
  final RxString searchQuery = "".obs;

  FastFoodPage({Key? key, required this.catId}) : super(key: key) {
    cartController = Get.put(CartController(catId: catId), tag: catId);
  }

  @override
  Widget build(BuildContext context) {
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
      body: Container(
        color: AppColors.primary.withOpacity(0.2),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  onChanged: (val) => searchQuery.value = val.toLowerCase(),
                  decoration: const InputDecoration(
                    hintText: "Search fast food items...",
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Obx(() {
                if (cartController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                final filtered = cartController.products
                    .where((p) => p.prdName.toLowerCase().contains(searchQuery.value))
                    .toList();

                if (filtered.isEmpty) {
                  return const Center(child: Text("No fast food items found"));
                }

                return ListView.builder(
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final item = filtered[index];
                    return Card(
                      color: AppColors.white,
                      margin: const EdgeInsets.all(8),
                      child: Container(
                        height: 120,
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    color: Colors.grey[200],
                                    child: Image.asset(
                                      'Assets/Non-Veg/Egg Curry.jpeg', // You can change this to fast food image
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
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.prdName.toUpperCase(),
                                    maxLines: 1,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Obx(() {
                                    final qty = cartController.getQtyForItem(item);
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                  cartController.updateItemQty(item, qty - 1);
                                                }
                                              },
                                              icon: const Icon(
                                                Icons.remove_circle,
                                                color: AppColors.primary,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                int stock = int.tryParse(item.prdStock) ?? 0;

                                                if (stock < 10) {
                                                  CustomSnackBar.show(
                                                    title: "Low Stock",
                                                    message: "Sorry, stock is too low to order this item!",
                                                    icon: Icons.error,
                                                    backgroundColor: AppColors.red,
                                                    textColor: AppColors.white,
                                                    iconColor: AppColors.white,
                                                  );
                                                  return;
                                                }

                                                cartController.updateItemQty(item, qty + 1);
                                              },
                                              icon: const Icon(
                                                Icons.add_circle,
                                                color: AppColors.primary,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  }),
                                  Text(
                                    "₹${item.prdPrice}/-",
                                    style: const TextStyle(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(() {
        if (cartController.cartItems.isEmpty) return const SizedBox.shrink();

        final total = cartController.getTotalPrice();

        return Container(
          padding: const EdgeInsets.all(12),
          color: AppColors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total: ₹${total}/-",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                  fontSize: 18,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                    colors: [
                      AppColors.khaki,
                      AppColors.primary,
                      AppColors.secondary,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.transparent,
                    foregroundColor: AppColors.transparent,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 3,
                  ),
                  onPressed: () async {
                    if (cartController.cartItems.isEmpty) {
                      CustomSnackBar.show(
                        title: "Empty",
                        message: "No fast food items in cart!",
                        icon: Icons.info,
                        backgroundColor: AppColors.primary,
                        textColor: AppColors.white,
                        iconColor: AppColors.white,
                      );
                      return;
                    }

                    CustomSnackBar.show(
                      title: "Success",
                      message: "Fast food items added to cart successfully!",
                      icon: Icons.check_circle,
                      backgroundColor: AppColors.primary,
                      textColor: AppColors.white,
                      iconColor: AppColors.white,
                    );
                    Get.off(() => ViewCartPage());
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
                        "VIEW CART",
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