import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ApiControllers/ManuApiControllerPage.dart';
import '../ApiControllers/OrderNowApiController.dart';
import '../ControllerPage/ViewCardController.dart';
import '../UtilsPage/ColorsPage.dart';
import '../UtilsPage/SessionManager.dart';
import '../UtilsPage/StringsPage.dart';
import '../UtilsPage/UrlPage.dart';
import '../wedgetPage/GlobleList.dart';
import '../wedgetPage/SnackBarMessage.dart';
import 'BillingPage.dart';
import 'ManuPage.dart';

class ViewCartPage extends StatelessWidget {
  ViewCartPage({Key? key}) : super(key: key);

  final ViewCartController controller = Get.put(ViewCartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary.withOpacity(0.2),
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
      body: Obx(() {
        if (controller.cartItems.isEmpty) {
          return const Center(child: Text("Your cart is empty"));
        }

        return Padding(
          padding: const EdgeInsets.all(6),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Column(
                children: [
                  const Text(
                    "Cart Items",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Divider(thickness: 1.2),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.cartItems.length,
                      itemBuilder: (context, index) {
                        final item = controller.cartItems[index];
                        final isLiquor = item['type'] == 'liquor';
                        int qty = isLiquor
                            ? ((item['small'] ?? 0) + (item['large'] ?? 0))
                            : (item['qty'] ?? 1);

                        return Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    item['image'] ??
                                        'Assets/Non-Veg/Egg Curry.jpeg',
                                    width: 70,
                                    height: 70,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item['name'].toString().toUpperCase(),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      if (isLiquor)
                                        Text(
                                          "Small: ${item['small'] ?? 0}, Large: ${item['large'] ?? 0}",
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: AppColors.black,
                                          ),
                                        ),
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              controller.decrementQty(index);

                                              int cartIndex = GlobalCart
                                                  .cartData[0]["order"]
                                                  .indexWhere(
                                                    (e) =>
                                                        e["prd_id"]
                                                            .toString() ==
                                                        item["prd_id"]
                                                            .toString(),
                                                  );

                                              if (cartIndex != -1) {
                                                int currentQty =
                                                    int.tryParse(
                                                      GlobalCart
                                                          .cartData[0]["order"][cartIndex]["qty"],
                                                    ) ??
                                                    0;

                                                currentQty -= 1;

                                                if (currentQty <= 0) {
                                                  GlobalCart
                                                      .cartData[0]["order"]
                                                      .removeAt(
                                                        cartIndex,
                                                      ); // ❌ remove if 0
                                                } else {
                                                  GlobalCart
                                                          .cartData[0]["order"][cartIndex]["qty"] =
                                                      "$currentQty";
                                                }
                                              }

                                              // ✅ Debug print to check global list
                                              print(
                                                "After Decrement: ${GlobalCart.cartData[0]["order"]}",
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.remove_circle,
                                              color: AppColors.primary,
                                            ),
                                          ),

                                          Text(
                                            "$qty",
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),

                                          IconButton(
                                            onPressed: () {
                                              controller.incrementQty(index);

                                              int cartIndex = GlobalCart
                                                  .cartData[0]["order"]
                                                  .indexWhere(
                                                    (e) =>
                                                        e["prd_id"]
                                                            .toString() ==
                                                        item["prd_id"]
                                                            .toString(),
                                                  );

                                              if (item["type"] == "liquor") {
                                                int smallQty =
                                                    item["small"] ?? 0;
                                                int largeQty =
                                                    item["large"] ?? 0;

                                                if (cartIndex != -1) {
                                                  GlobalCart
                                                          .cartData[0]["order"][cartIndex]["qty"] =
                                                      (smallQty + largeQty)
                                                          .toString();
                                                  GlobalCart
                                                          .cartData[0]["order"][cartIndex]["small"] =
                                                      smallQty.toString();
                                                  GlobalCart
                                                          .cartData[0]["order"][cartIndex]["large"] =
                                                      largeQty.toString();
                                                } else {
                                                  GlobalCart
                                                      .cartData[0]["order"]
                                                      .add({
                                                        "prd_id": item["prd_id"]
                                                            .toString(),
                                                        "qty":
                                                            (smallQty +
                                                                    largeQty)
                                                                .toString(),
                                                        "type": "liquor",
                                                        "small": smallQty
                                                            .toString(),
                                                        "large": largeQty
                                                            .toString(),
                                                        "price": item["price"]
                                                            .toString(),
                                                      });
                                                }
                                              } else {
                                                if (cartIndex != -1) {
                                                  int currentQty =
                                                      int.tryParse(
                                                        GlobalCart
                                                            .cartData[0]["order"][cartIndex]["qty"],
                                                      ) ??
                                                      0;
                                                  GlobalCart
                                                          .cartData[0]["order"][cartIndex]["qty"] =
                                                      "${currentQty + 1}";
                                                } else {
                                                  GlobalCart
                                                      .cartData[0]["order"]
                                                      .add({
                                                        "prd_id": item["prd_id"]
                                                            .toString(),
                                                        "qty": "1",
                                                        "price": item["price"]
                                                            .toString(),
                                                      });
                                                }
                                              }

                                              // ✅ Debug print to check global list
                                              print(
                                                "After Increment: ${GlobalCart.cartData[0]["order"]}",
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.add_circle,
                                              color: AppColors.primary,
                                            ),
                                          ),

                                          const Spacer(),

                                          Text(
                                            "₹${isLiquor ? (((item['small'] ?? 0) + ((item['large'] ?? 0) * 2)) * (double.tryParse(item['price'].toString()) ?? 0)) : ((double.tryParse(item['price'].toString()) ?? 0) * (item['qty'] ?? 1))}/-",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),

                                          IconButton(
                                            onPressed: () {
                                              controller.deleteItem(index);

                                              GlobalCart.cartData[0]["order"]
                                                  .removeWhere(
                                                    (orderItem) =>
                                                        orderItem["prd_id"]
                                                            .toString() ==
                                                        item["prd_id"]
                                                            .toString(),
                                                  );

                                              // ✅ Debug print to check global list
                                              print(
                                                "After Delete: ${GlobalCart.cartData[0]["order"]}",
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            if (index < controller.cartItems.length - 1)
                              const Divider(thickness: 1),
                          ],
                        );
                      },
                    ),
                  ),
                  const Divider(thickness: 1.2),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total: ₹${controller.getTotalPrice()}/-",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: AppColors.primary,
                            ),
                          ),
                          Text(
                            "All Item: ${controller.getTotalItems()}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Container(
                        width: double.infinity,
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
                          onPressed: () async {
                            final controller = Get.find<ViewCartController>();

                            if (controller.cartItems.isEmpty) {
                              CustomSnackBar.show(
                                title: "Empty",
                                message: "No items in cart!",
                                icon: Icons.info,
                                backgroundColor: AppColors.primary,
                                textColor: AppColors.white,
                                iconColor: AppColors.white,
                              );
                              return;
                            }

                            GlobalCart.cartData[0]["order"] = controller
                                .cartItems
                                .map(
                                  (item) => {
                                    "prd_id": "${item['prd_id']}",
                                    "qty":
                                        "${item['qty'] ?? (item['small'] ?? 0) + (item['large'] ?? 0)}",
                                    "price": "${item['price']}",
                                    "type": item['type'] ?? "food",
                                    if (item['type'] == 'liquor')
                                      "small": "${item['small'] ?? 0}",
                                    if (item['type'] == 'liquor')
                                      "large": "${item['large'] ?? 0}",
                                  },
                                )
                                .toList();

                            print(
                              "✅ Final GlobalCart Before API Call: ${GlobalCart.cartData}",
                            );

                            // -------------------- Check User Balance --------------------
                            final user = await SessionManager.getUser();

                            if (user != null) {
                              final double balance =
                                  double.tryParse(
                                    user.records.memberBalance.toString(),
                                  ) ??
                                  0;

                              double totalPrice = 0;
                              for (var item in controller.cartItems) {
                                final isLiquor = item['type'] == 'liquor';
                                final qty = isLiquor
                                    ? ((item['small'] ?? 0) +
                                          (item['large'] ?? 0))
                                    : (item['qty'] ?? 1);
                                final price =
                                    double.tryParse(item['price'].toString()) ??
                                    0;
                                totalPrice += isLiquor
                                    ? ((item['small'] ?? 0) * price +
                                          (item['large'] ?? 0) * price * 2)
                                    : price * qty;
                              }

                              if (balance < totalPrice) {
                                CustomSnackBar.show(
                                  title: "Insufficient Balance",
                                  message:
                                      "You do not have enough balance to place this order.",
                                  icon: Icons.error,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  iconColor: Colors.white,
                                );
                                return;
                              }

                              GlobalCart.cartData[0]["member_id"] =
                                  "${user.records.memberId}";
                              print(
                                "Member ID: ${GlobalCart.cartData[0]["member_id"]}",
                              );
                            } else {
                              print(
                                "Member ID: ${GlobalCart.cartData[0]["member_id"]}",
                              );
                            }

                            // -------------------- Call API --------------------
                            try {
                              final response = await OrderApiService.orderNow();
                              print("Order placed successfully: $response");

                              Get.offAll(
                                () => ThankYouPage(
                                  userName: user?.mainMemberName ?? "John Doe",
                                  cartItems: List<Map<String, dynamic>>.from(
                                    controller.cartItems,
                                  ),
                                  orderNo:
                                      "ORD${DateTime.now().millisecondsSinceEpoch}",
                                  userType: user?.records.memberType,
                                  orderStatusMsg:
                                      response['order'] == null ||
                                          response['order'][0] == null
                                      ? "Stock Not Available"
                                      : null,
                                ),
                              );
                            } catch (e) {
                              print("Failed to place order: $e");
                              CustomSnackBar.show(
                                title: "Error",
                                message: "Failed to place order!",
                                icon: Icons.error,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                iconColor: Colors.white,
                              );
                            }



                            final controllers = Get.find<ViewCartController>();

                            if (controller.cartItems.isEmpty) {
                              CustomSnackBar.show(
                                title: "Empty",
                                message: "No items in cart!",
                                icon: Icons.info,
                                backgroundColor: AppColors.primary,
                                textColor: AppColors.white,
                                iconColor: AppColors.white,
                              );
                              return;
                            }

                            // ✅ Clear previous cart in SharedPreferences
                            await CartPrefs.clearCart();

                            // ✅ Save current cart to SharedPreferences
                            await CartPrefs.saveCart(controller.cartItems);

                            print("✅ Cart saved in SharedPreferences: ${controller.cartItems}");

                            // -------------------- Continue existing Place Order logic --------------------
                            GlobalCart.cartData[0]["order"] = controller
                                .cartItems
                                .map(
                                  (item) => {
                                "prd_id": "${item['prd_id']}",
                                "qty":
                                "${item['qty'] ?? (item['small'] ?? 0) + (item['large'] ?? 0)}",
                                "price": "${item['price']}",
                                "type": item['type'] ?? "food",
                                if (item['type'] == 'liquor')
                                  "small": "${item['small'] ?? 0}",
                                if (item['type'] == 'liquor')
                                  "large": "${item['large'] ?? 0}",
                              },
                            )
                                .toList();



                          },

                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.shopping_cart,
                                color: AppColors.white,
                                size: 20,
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Place Order",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
