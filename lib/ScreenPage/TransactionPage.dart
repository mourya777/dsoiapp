import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ControllerPage/TransactionController.dart';
import '../UtilsPage/ColorsPage.dart';

class TransactionHistoryPage extends StatelessWidget {
  TransactionHistoryPage({super.key});

  final TransactionHistoryController controller =
  Get.put(TransactionHistoryController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Obx(
              () => ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: controller.transactions.length,
            itemBuilder: (context, index) {
              var txn = controller.transactions[index];
              return Container(
                width: double.infinity,
                margin: const EdgeInsets.all(8),
                padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
                      iconColor: AppColors.golden, // open arrow
                      collapsedIconColor: AppColors.golden, // close arrow
                    ),
                  ),
                  child: ExpansionTile(
                    title: Text(
                      txn["title"].toString(),
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
                          txn["amount"].toString(),
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

                      // Dynamic Food details
                      ...List.generate(
                        (txn["details"] as List).length,
                            (i) {
                          var item = txn["details"][i];
                          return ListTile(
                            leading: const Icon(Icons.fastfood, color: AppColors.golden),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item["item"].toString(),
                                  style: const TextStyle(color: AppColors.golden, fontSize: 16),
                                ),
                                Text(
                                  item["price"].toString(),
                                  style: const TextStyle(
                                      color: AppColors.golden,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          );
                        },
                      ),

                      // Date
                      Padding(
                        padding:
                        const EdgeInsets.only(bottom: 10, right: 12),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            txn["date"].toString(),
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
              );
            },
          ),
        ),
      ),
    );
  }
}
