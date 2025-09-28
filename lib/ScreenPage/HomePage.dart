import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ControllerPage/HomeController.dart';
import '../UtilsPage/ColorsPage.dart';
import '../UtilsPage/SessionManager.dart';
import '../wedgetPage/AppBar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return FutureBuilder(
      future: SessionManager.getUser(), // ✅ user data load
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final user = snapshot.data!;
        final name = (user.mainMemberName ?? "Unknown").toUpperCase();
        final memberId = (user.records.memberId ?? "N/A").toUpperCase();
        final mobile = (user.records.memberMobile ?? "N/A").toUpperCase();
        final balance = (user.balance ?? "0").toUpperCase();
        final location = (user.records.branch ?? "N/A").toUpperCase();

        return Scaffold(
          appBar: AdvancedAppBar(),
          backgroundColor: AppColors.white,
          body: Container(
            height: size.height * 1,
            color: AppColors.primary.withOpacity(0.2),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  /// Profile Card
                  Container(
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
                                  "Assets/Images/profile_images.jpeg"),
                            ),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.person,
                                        color: AppColors.primary, size: 18),
                                    const SizedBox(width: 5),
                                    Text(
                                      name,
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
                                    const Icon(Icons.card_membership,
                                        color: AppColors.primary, size: 16),
                                    const SizedBox(width: 5),
                                    Text(
                                      "Member ID: $memberId",
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
                                    const Icon(Icons.phone,
                                        color: AppColors.primary, size: 16),
                                    const SizedBox(width: 5),
                                    Text(
                                      "Mobile: 9898765456",
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
                                    const Icon(Icons.location_on,
                                        color: AppColors.primary, size: 16),
                                    const SizedBox(width: 5),
                                    Text(
                                      "Branch: DSOI Jabalpur",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: AppColors.black,
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
                        const Divider(color: AppColors.khakiLight, thickness: 1),
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
                                    color: AppColors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "$balance/-",
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
                                size: 35,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  /// Recent Transaction (same as before)
                  Obx(() => Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(0),
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
                        expansionTileTheme: const ExpansionTileThemeData(
                          iconColor: AppColors.grey,
                          collapsedIconColor: AppColors.grey,
                        ),
                      ),
                      child: ExpansionTile(
                        title: Text(
                          controller.recentTransactionTitle.value,
                          style: const TextStyle(
                            color: AppColors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "${controller.recentTransactionAmount.value}/-",
                              style: const TextStyle(
                                color: AppColors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(Icons.expand_more,
                                color: AppColors.primary),
                          ],
                        ),
                        children: [
                          const Divider(color: AppColors.khakiLight),
                          // static transactions (Pizza, Burger, Cold Drink) अभी वैसे ही रहेंगे
                          ListTile(
                            leading: Icon(Icons.local_pizza,
                                color: AppColors.primary),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("Pizza",
                                    style: TextStyle(
                                        color: AppColors.black, fontSize: 16)),
                                Text("₹200/-",
                                    style: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          ListTile(
                            leading: Icon(Icons.lunch_dining,
                                color: AppColors.primary),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("Burger",
                                    style: TextStyle(
                                        color: AppColors.black, fontSize: 16)),
                                Text("₹150/-",
                                    style: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          ListTile(
                            leading: Icon(Icons.local_drink,
                                color: AppColors.primary),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("Cold Drink",
                                    style: TextStyle(
                                        color: AppColors.black, fontSize: 16)),
                                Text("₹150/-",
                                    style: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.only(bottom: 10, right: 12),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                controller.recentTransactionDate.value,
                                style: const TextStyle(
                                  color: AppColors.grey,
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

                  const SizedBox(height: 16),

                  /// ✅ Button with condition
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
                              vertical: 14, horizontal: 12),
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
        );
      },
    );
  }
}
