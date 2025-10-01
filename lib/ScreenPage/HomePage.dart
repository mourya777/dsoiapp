import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ControllerPage/BottomNavController.dart';
import '../ControllerPage/HomeController.dart';
import '../UtilsPage/ColorsPage.dart';
import '../UtilsPage/StringsPage.dart';
import '../wedgetPage/GlobleList.dart';
import '../wedgetPage/SnackBarMessage.dart';
import 'OrderBillPage.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ControllerPage/BottomNavController.dart';
import '../ControllerPage/HomeController.dart';
import '../UtilsPage/ColorsPage.dart';
import '../UtilsPage/StringsPage.dart';
import '../wedgetPage/SnackBarMessage.dart';
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
                            // CircleAvatar(
                            //   radius: 35,
                            //   backgroundColor: Colors.deepPurple.shade100,
                            //   backgroundImage: GlobalList.memberData["member_img"] != null
                            //       ? NetworkImage(GlobalList.memberData["member_img"])
                            //       : const AssetImage("Assets/Images/profile_images.jpeg")
                            //   as ImageProvider,
                            // ),
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
                                      "${GlobalList.memberData["member_fname"] ?? ""} ${GlobalList.memberData["member_lname"] ?? ""}",
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
                                      Icons.confirmation_number,
                                      color: AppColors.primary,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      "Membership No.: ${GlobalList.memberData["member_no"] ?? ""}",
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
                                      Icons.group,
                                      color: AppColors.primary,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      "MemberType: ${GlobalList.memberData["member_type"] == 0 ? "MainMember" : "SubMember" ?? ""}",
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
                                  "${GlobalList.memberData["member_balance"] ?? "0.00"}/-",
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
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () =>
                                  controller.openTransactionForm(context),
                              child: Container(
                                height: 34,
                                width: 150,
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
                                        Icons.account_balance_wallet,
                                        color: AppColors.white,
                                        size: 16,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "TRANSACTION",
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
                            InkWell(
                              onTap: () {
                                Get.to(OrderReceiptPage());
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
                ),

                const SizedBox(height: 16),

                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16,
                        ),
                        child: Text(
                          "ORDER HISTORY",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Obx(
                        () => Column(
                          children: controller.transactions.take(5).map((
                            transactionObj,
                          ) {
                            final transaction =
                                transactionObj as Map<String, dynamic>;
                            final details =
                                transaction["details"] as List<dynamic>? ?? [];

                            // Categories list
                            List<String> possibleCategories = [
                              "Food",
                              "Liquor",
                              "FastFood",
                              "Snack",
                            ];
                            // Alternate categories based on index
                            String outerCategory =
                                possibleCategories[controller.transactions
                                        .indexOf(transaction) %
                                    possibleCategories.length];

                            // Status: dynamic from predefined list
                            List<String> statuses = [
                              "Pending",
                              "Delivered",
                              "Cancelled",
                              "In Progress",
                            ];
                            String status =
                                statuses[controller.transactions.indexOf(
                                      transaction,
                                    ) %
                                    statuses.length];

                            String date = transaction["date"] as String? ?? "";

                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 6),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Order ID: ${controller.transactions.indexOf(transaction) + 1000}",
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          "Category: $outerCategory",
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          "Status: $status",
                                          style: TextStyle(
                                            color: status == "Pending"
                                                ? Colors.orange
                                                : status == "Delivered"
                                                ? Colors.green
                                                : status == "Cancelled"
                                                ? Colors.red
                                                : Colors.blue,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      date,
                                      style: const TextStyle(
                                        color: Colors.black54,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ...details.map((itemObj) {
                                          final item =
                                              itemObj as Map<String, dynamic>;
                                          String itemName =
                                              item["item"] as String? ?? "";
                                          String itemPrice =
                                              item["price"] as String? ?? "";
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 3,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  itemName,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                  "${itemPrice}/-",
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }).toList(),
                                        const SizedBox(height: 8),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              // Cancel Button
                                              InkWell(
                                                onTap: () {
                                                  CustomSnackBar.show(
                                                    title: "Cancelled",
                                                    message:
                                                        "Order ${controller.transactions.indexOf(transaction) + 1000} cancelled",
                                                    icon: Icons.cancel,
                                                    backgroundColor: Colors.red,
                                                    textColor: Colors.white,
                                                    iconColor: Colors.white,
                                                  );
                                                },
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                        horizontal: 12,
                                                        vertical: 6,
                                                      ),
                                                  decoration: BoxDecoration(
                                                    color: Colors.red
                                                        .withOpacity(0.1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          8,
                                                        ),
                                                  ),
                                                  child: const Text(
                                                    "Cancel",
                                                    style: TextStyle(
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 8),

                                              // View Button
                                              InkWell(
                                                onTap: () {
                                                  Get.to(OrderReceiptPage());
                                                },
                                                child: Container(
                                                  height: 34,
                                                  width: 120,
                                                  decoration: BoxDecoration(
                                                    gradient:
                                                        const LinearGradient(
                                                          colors: [
                                                            AppColors.khaki,
                                                            AppColors.primary,
                                                            AppColors.secondary,
                                                          ],
                                                          begin:
                                                              Alignment.topLeft,
                                                          end: Alignment
                                                              .bottomRight,
                                                        ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          6,
                                                        ),
                                                  ),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
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
                                                            fontWeight:
                                                                FontWeight.bold,
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
                        if (true) {
                          Get.find<BottomNavController>().changeIndex(1);
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
