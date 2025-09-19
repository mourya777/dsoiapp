import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ControllerPage/HomeController.dart';
import '../UtilsPage/ColorsPage.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // 🔹 Profile + Balance Card
              Obx(() => Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.khaki.withOpacity(0.6),
                      offset: const Offset(0, 3),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.3),
                      offset: const Offset(0, 3),
                      blurRadius: 10,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // Profile Image
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.deepPurple.shade100,
                          backgroundImage: const AssetImage(
                              "Assets/Images/profile_images.jpeg"),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.person,
                                    color: AppColors.golden, size: 18),
                                const SizedBox(width: 5),
                                Text(
                                  controller.memberName.value,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: AppColors.golden,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                const Icon(Icons.card_membership,
                                    color: AppColors.golden, size: 16),
                                const SizedBox(width: 5),
                                Text(
                                  "Member ID: ${controller.membershipNo.value}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: AppColors.golden,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                const Icon(Icons.phone,
                                    color: AppColors.golden, size: 16),
                                const SizedBox(width: 5),
                                Text(
                                  "Mobile: ${controller.mobileNo.value}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: AppColors.golden,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
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
                          children: [
                            const Text(
                              "Current Balance",
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.golden,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              controller.balance.value,
                              style: const TextStyle(
                                fontSize: 28,
                                color: AppColors.golden,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.golden,
                          ),
                          padding: const EdgeInsets.all(10),
                          child: const Icon(
                            Icons.account_balance_wallet,
                            color: Colors.white,
                            size: 35,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )),

              const SizedBox(height: 16),

              // 🔹 Last Transaction (Food Card)
              Obx(() => Container(
                width: double.infinity,
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 6),
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
                child: Theme(
                  data: Theme.of(context).copyWith(
                    dividerColor: Colors.transparent,
                    expansionTileTheme:
                    const ExpansionTileThemeData(
                      iconColor: AppColors.golden,
                      collapsedIconColor: AppColors.golden,
                    ),
                  ),
                  child: ExpansionTile(
                    title: Text(
                      controller.recentTransactionTitle.value,
                      style: const TextStyle(
                        color: AppColors.golden,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          controller.recentTransactionAmount.value,
                          style: const TextStyle(
                            color: AppColors.golden,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.expand_more,
                            color: AppColors.golden),
                      ],
                    ),
                    children: [
                      const Divider(color: AppColors.khakiLight),
                      ListTile(
                        leading: Icon(Icons.local_pizza, color: AppColors.golden),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Pizza",
                              style: TextStyle(color: AppColors.golden, fontSize: 16),
                            ),
                            Text(
                              "₹200/-",
                              style: TextStyle(color: AppColors.golden, fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.lunch_dining, color: AppColors.golden),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Burger",
                              style: TextStyle(color: AppColors.golden, fontSize: 16),
                            ),
                            Text(
                              "₹150/-",
                              style: TextStyle(color: AppColors.golden, fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.local_drink, color: AppColors.golden),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Cold Drink",
                              style: TextStyle(color: AppColors.golden, fontSize: 16),
                            ),
                            Text(
                              "₹150/-",
                              style: TextStyle(color: AppColors.golden, fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10, right: 12),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            controller.recentTransactionDate.value,
                            style: const TextStyle(
                              color: AppColors.golden,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
