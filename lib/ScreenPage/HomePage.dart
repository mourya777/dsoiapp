import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ControllerPage/HomeController.dart';
import '../UtilsPage/ColorsPage.dart';
import '../UtilsPage/StringsPage.dart';
import 'OrderBillPage.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
              Stack(
                clipBehavior: Clip.none,
                children: [
                  // Bell iconimport 'package:flutter/material.dart';
                  // import 'package:get/get.dart';
                  // import '../ControllerPage/HomeController.dart';
                  // import '../ControllerPage/TransactionController.dart'; // Correct single import
                  // import '../UtilsPage/ColorsPage.dart';
                  // import '../UtilsPage/StringsPage.dart';
                  //
                  // class HomePage extends StatelessWidget {
                  //   HomePage({super.key});
                  //
                  //   // Use HomeController
                  //   final HomeController controller = Get.put(HomeController());
                  //
                  //   @override
                  //   Widget build(BuildContext context) {
                  //     final size = MediaQuery.of(context).size;
                  //     return Scaffold(
                  //       appBar: AppBar(
                  //         automaticallyImplyLeading: false,
                  //         backgroundColor: AppColors.primary,
                  //         title: Row(
                  //           crossAxisAlignment: CrossAxisAlignment.center,
                  //           children: [
                  //             Image.asset(
                  //               'Assets/Images/appbar_logo-removebg-preview.png',
                  //               height: 50,
                  //               width: 50,
                  //             ),
                  //             const SizedBox(width: 10),
                  //             Text(
                  //               "${AppStrings.locationJabalpur}",
                  //               style: TextStyle(
                  //                 fontSize: 15,
                  //                 fontWeight: FontWeight.w900,
                  //                 color: AppColors.white,
                  //                 letterSpacing: 1.5,
                  //                 shadows: [
                  //                   Shadow(
                  //                     offset: Offset(2, 2),
                  //                     blurRadius: 4,
                  //                     color: Colors.black26,
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //         actions: [
                  //           Row(
                  //             children: [
                  //               Stack(
                  //                 clipBehavior: Clip.none,
                  //                 children: [
                  //                   Container(
                  //                     padding: const EdgeInsets.all(8),
                  //                     decoration: BoxDecoration(
                  //                       color: AppColors.primary,
                  //                       shape: BoxShape.circle,
                  //                     ),
                  //                     child: Icon(
                  //                       Icons.notifications,
                  //                       color: Colors.white,
                  //                       size: 28,
                  //                     ),
                  //                   ),
                  //                   Positioned(
                  //                     top: 1,
                  //                     right: 10,
                  //                     child: Container(
                  //                       padding: const EdgeInsets.all(2),
                  //                       decoration: BoxDecoration(
                  //                         color: Colors.red,
                  //                         shape: BoxShape.circle,
                  //                       ),
                  //                       child: Text(
                  //                         "3",
                  //                         style: TextStyle(
                  //                           color: Colors.white,
                  //                           fontSize: 12,
                  //                           fontWeight: FontWeight.bold,
                  //                         ),
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //               SizedBox(width: 20),
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //       backgroundColor: AppColors.white,
                  //       body: Container(
                  //         height: size.height * 1,
                  //         color: AppColors.primary.withOpacity(0.2),
                  //         child: Padding(
                  //           padding: const EdgeInsets.all(16.0),
                  //           child: SingleChildScrollView(
                  //             child: Column(
                  //               children: [
                  //                 // ... Your existing widgets and Obx sections
                  //                 // Make sure whenever you use TransactionHistoryController:
                  //                 // final transController = Get.put(TransactionHistoryController());
                  //                 // OR
                  //                 // final transController = Get.find<TransactionHistoryController>();
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     );
                  //   }
                  // }
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),

                  // Notification dots
                  Positioned(
                    top: 1,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        "3",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 20),
            ],
          ),
        ],
      ),

      backgroundColor: AppColors.white,
      body: Container(
        height: size.height * 1,
        color: AppColors.primary.withOpacity(0.2),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Obx(
                  () => Container(
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 6,
                          offset: const Offset(2, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.deepPurple.shade100,
                              backgroundImage: const AssetImage(
                                "Assets/Images/profile_images.jpeg",
                              ),
                            ),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.person,
                                      color: AppColors.primary,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      controller.memberName.value,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: AppColors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.card_membership,
                                      color: AppColors.primary,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      "Membership No.: 654UTC",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.card_membership,
                                      color: AppColors.primary,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      "MemberType: Main Branch",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Divider(
                          color: AppColors.khakiLight,
                          thickness: 1,
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Current Balance",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "${controller.balance.value}/-",
                                  style: const TextStyle(
                                    fontSize: 28,
                                    color: AppColors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primary,
                              ),
                              padding: const EdgeInsets.all(10),
                              child: const Icon(
                                Icons.account_balance_wallet,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                controller.refresh();
                              },
                              child: Container(
                                height: 34,
                                width: 100,
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
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Center(
                                  child: Text(
                                    "REFRESH",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            InkWell(
                              onTap: () =>
                                  controller.openTransactionForm(context),
                              child: Container(
                                height: 34,
                                width: 100,
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
                                  child: const Text(
                                    "TRANSACTION",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            InkWell(
                              onTap: () {
                                Get.to(OrderReceiptPage());
                              },
                              child: Container(
                                height: 34,
                                width: 70,
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
                                  child: const Text(
                                    "VIEW",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                SingleChildScrollView(
                  child: Column(
                    children: [
                      Obx(
                        () => Column(
                          children: controller.transactions.map((transaction) {
                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: AppColors.white,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Outer: User Order Id
                                    Text(
                                      "User Order Id: ${controller.transactions.indexOf(transaction) + 1000}",
                                      style: const TextStyle(
                                        color: AppColors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "500/-", // static total amount
                                      style: const TextStyle(
                                        color: AppColors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                trailing: const Icon(
                                  Icons.expand_more,
                                  color: AppColors.primary,
                                ),
                                children: [
                                  const Divider(color: AppColors.khakiLight),

                                  // Inner content with static values
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        buildRow("Order ID:", "1001"),
                                        buildRow(
                                          "Category:",
                                          "Food, Snack, Liquor, FastFood",
                                        ),
                                        buildRow("Price:", "500/-"),
                                        buildRow(
                                          "Status:",
                                          "Pending",
                                          color: Colors.orange,
                                        ),
                                        const SizedBox(height: 12),
                                      ],
                                    ),
                                  ),

                                  // Buttons: Cancel next to View
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 12,
                                              vertical: 6,
                                            ),
                                            decoration: BoxDecoration(
                                              color: AppColors.jungleGreen
                                                  .withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: const Text(
                                              "Cancel",
                                              style: TextStyle(
                                                color: AppColors.red,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 8),

                                        InkWell(
                                          onTap: () {
                                            Get.to(OrderReceiptPage());
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 12,
                                              vertical: 6,
                                            ),
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
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            child: const Text(
                                              "View",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
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
                    ],
                  ),
                ),

                SizedBox(height: 16),

                Obx(() {
                  bool hasMore = controller.transactions.length > 5;
                  return Align(
                    alignment: Alignment.centerRight,
                    child: TextButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 12,
                        ),
                      ),
                      onPressed: () {
                        if (hasMore) {
                          Get.snackbar(
                            "Info",
                            "Showing all transactions",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: AppColors.primary,
                            colorText: AppColors.white,
                          );
                        } else {
                          Get.snackbar(
                            "Info",
                            "No more transactions available",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: AppColors.primary,
                            colorText: AppColors.white,
                          );
                        }
                      },
                      icon: Icon(
                        hasMore ? Icons.arrow_forward_ios : Icons.block,
                        size: 18,
                        color: AppColors.black,
                      ),
                      label: Text(
                        hasMore ? "VIEW ALL" : "VIEW MORE",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRow(String label, String value, {Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(width: 6),
          Text(
            value,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
