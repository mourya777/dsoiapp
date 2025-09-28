import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../ControllerPage/ViewCardController.dart';
import '../UtilsPage/ColorsPage.dart';
import '../UtilsPage/SessionManager.dart';
import '../wedgetPage/AppBar.dart';

class AddToCartPage extends StatelessWidget {
  AddToCartPage({Key? key}) : super(key: key);

<<<<<<< Updated upstream
<<<<<<< Updated upstream
  final CartController controller = Get.put(CartController());
  final LiquorController liquorController = Get.put(LiquorController());
  final HomeController homeController = Get.put(HomeController());
=======
  final ViewCartController controller = Get.put(ViewCartController());
>>>>>>> Stashed changes
=======
  final ViewCartController controller = Get.put(ViewCartController());
>>>>>>> Stashed changes

  @override
  Widget build(BuildContext context) {
    // Load saved cart on page init
    CartPrefs.loadCart().then((savedItems) {
      controller.cartItems.value = savedItems;
    });

    return Scaffold(
      appBar: AdvancedAppBar(),
      body: Obx(() {
<<<<<<< Updated upstream
<<<<<<< Updated upstream
        final combinedCart = [...controller.cartItems, ...liquorController.cartItems];

        if (combinedCart.isEmpty) {
=======
        if (controller.cartItems.isEmpty) {
>>>>>>> Stashed changes
=======
        if (controller.cartItems.isEmpty) {
>>>>>>> Stashed changes
          return Center(
            child: Text(
              "Your cart is empty",
              style: TextStyle(fontSize: 18, color: AppColors.primary),
            ),
          );
        }

<<<<<<< Updated upstream
<<<<<<< Updated upstream
        return Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 120), // <-- Added bottom padding
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          children: List.generate(combinedCart.length, (index) {
                            final item = combinedCart[index];
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
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
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
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "${item['price']}/-",
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors.primary),
                                              ),
                                              item['type'] == 'liquor'
                                                  ? Row(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.grey.shade200,
                                                    ),
                                                    child: IconButton(
                                                      icon: const Icon(Icons.remove),
                                                      onPressed: () => liquorController.removeItem(item['category']),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 8),
                                                    child: Text(
                                                      "${(item['small'] ?? 0) + (item['large'] ?? 0)}",
                                                      style: const TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 16),
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.grey.shade200,
                                                    ),
                                                    child: IconButton(
                                                      icon: const Icon(Icons.add),
                                                      onPressed: () => liquorController.addItem(item['category']),
                                                    ),
                                                  ),
                                                ],
                                              )
                                                  : Row(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.grey.shade200,
                                                    ),
                                                    child: IconButton(
                                                      icon: const Icon(Icons.remove),
                                                      onPressed: () => controller.updateQty(index, -1, ''),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 8),
                                                    child: Text(
                                                      "$qty",
                                                      style: const TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 16),
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.grey.shade200,
                                                    ),
                                                    child: IconButton(
                                                      icon: const Icon(Icons.add),
                                                      onPressed: () => controller.updateQty(index, 1, ''),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                                child: Text(
                                                  item['type'] == 'liquor'
                                                      ? "Small: ${item['small'] ?? 0}  Large: ${item['large'] ?? 0}"
                                                      : "Qty: ${item['qty'] ?? 0}",
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                icon: const Icon(Icons.delete, color: Colors.red),
                                                onPressed: () {
                                                  if (item['type'] == 'liquor') {
                                                    liquorController.removeItem(item['category']);
                                                  } else {
                                                    controller.removeItem(index);
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                if (index < combinedCart.length - 1)
                                  const Divider(thickness: 1),
                              ],
                            );
                          }),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Bottom Section moved above nav bar
            Positioned(
              left: 0,
              right: 0,
              bottom: 70,
              child: Obx(() {
                int total = controller.getTotalPrice() + liquorController.getTotalPrice();
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total: ₹$total/-",
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary),
                      ),
                      Container(
                        width: 120,
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

                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.transparent,
                              foregroundColor: AppColors.transparent,
                              padding:
                              const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          onPressed: () {
                            CustomSnackBar.show(
                              title: "Reorder Placed",
                              message: "Your order has been reordered successfully!",
                              icon: Icons.check_circle,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              iconColor: Colors.white,
                              // durationSeconds: 4, // optional
                            );




                          },
                          child: const Text(
                            "Reorder",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: AppColors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
=======
=======
>>>>>>> Stashed changes
        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: controller.cartItems.length,
          itemBuilder: (context, index) {
            final item = controller.cartItems[index];
            final isLiquor = item['type'] == 'liquor';
            int qty = isLiquor
                ? ((item['small'] ?? 0) + (item['large'] ?? 0))
                : (item['qty'] ?? 1);

            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        item['image'] ?? 'Assets/Non-Veg/Egg Curry.jpeg',
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['name']?.toUpperCase() ?? '',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Qty: $qty",
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
        );
      }),
    );
  }
}
