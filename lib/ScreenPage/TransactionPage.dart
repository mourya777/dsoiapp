// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../ControllerPage/TransactionController.dart';
// import '../UtilsPage/ColorsPage.dart';
// import '../wedgetPage/AppBar.dart';
//
// class TransactionHistoryPage extends StatelessWidget {
//   TransactionHistoryPage({super.key});
//
//   final TransactionHistoryController controller =
//   Get.put(TransactionHistoryController());
//
//   @override
//   Widget build(BuildContext context) {
//     final size=MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AdvancedAppBar(),
//
//       backgroundColor: AppColors.white,
//       body: Obx(
//             () => Container(
//           color: AppColors.primary.withOpacity(0.2),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: ListView.builder(
//                   padding: const EdgeInsets.all(6),
//                   itemCount: controller.transactions.length,
//                   itemBuilder: (context, index) {
//                     var txn = controller.transactions[index];
//                     return Container(
//                       width: double.infinity,
//                       margin: const EdgeInsets.all(8),
//                       padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
//                       decoration: BoxDecoration(
//                         color: AppColors.white,
//                         borderRadius: BorderRadius.circular(16),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.2),
//                             blurRadius: 6,
//                             offset: const Offset(2, 4),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         children: [
//                           Theme(
//                             data: Theme.of(context).copyWith(
//                               dividerColor: Colors.transparent,
//                               expansionTileTheme: const ExpansionTileThemeData(
//                                 iconColor: AppColors.grey,
//                                 collapsedIconColor: AppColors.grey,
//                               ),
//                             ),
//                             child: ExpansionTile(
//                               title: Text(
//                                 txn["title"].toString(),
//                                 style: const TextStyle(
//                                   color: AppColors.black,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               trailing: Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   Text(
//                                     "${txn["amount"].toString()}/-",
//                                     style: const TextStyle(
//                                       color: AppColors.black,
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   const SizedBox(width: 8),
//                                   const Icon(Icons.expand_more, color: AppColors.golden),
//                                 ],
//                               ),
//                               children: [
//                                 const Divider(color: AppColors.khakiLight),
//
//                                 // Dynamic Food details
//                                 ...List.generate(
//                                   (txn["details"] as List).length,
//                                       (i) {
//                                     var item = txn["details"][i];
//                                     return ListTile(
//                                       leading: const Icon(Icons.fastfood, color: AppColors.primary),
//                                       title: Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             item["item"].toString(),
//                                             style: const TextStyle(color: AppColors.black, fontSize: 16),
//                                           ),
//                                           Text("${ item["price"].toString()}/-"
//                                            ,
//                                             style: const TextStyle(
//                                               color: AppColors.black,
//                                               fontSize: 16,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     );
//                                   },
//                                 ),
//
//                                 // Date
//                                 Padding(
//                                   padding: const EdgeInsets.only(bottom: 10, right: 12),
//                                   child: Align(
//                                     alignment: Alignment.centerRight,
//                                     child: Text(
//                                       txn["date"].toString(),
//                                       style: const TextStyle(
//                                         color: AppColors.grey,
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//
//               // ✅ NO MORE Button
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: TextButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.transparent,
//                     shadowColor: Colors.transparent,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     padding: const EdgeInsets.symmetric(vertical: 14),
//                   ),
//                   onPressed: () {
//                     Get.snackbar(
//                       "Info",
//                       "No more transactions available",
//                       snackPosition: SnackPosition.BOTTOM,
//                       backgroundColor: AppColors.primary,
//                       colorText: AppColors.white,
//                     );
//                   },
//                   child: const Text(
//                     "NO MORE",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: AppColors.black,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 180),
//
//
//             ],
//           ),
//         ),
//       ),
//
//
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ControllerPage/TransactionController.dart';
import '../UtilsPage/ColorsPage.dart';
import '../wedgetPage/AppBar.dart';

class TransactionHistoryPage extends StatelessWidget {
  TransactionHistoryPage({super.key});

  final TransactionHistoryController controller =
  Get.put(TransactionHistoryController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AdvancedAppBar(),

      backgroundColor: AppColors.white,
      body: Obx(
            () => Container(
          color: AppColors.primary.withOpacity(0.2),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListView.builder(
                  padding: const EdgeInsets.all(6),
                  shrinkWrap: true, // Added to allow ListView inside Column without Expanded
                  physics: const NeverScrollableScrollPhysics(), // Prevents internal scrolling
                  itemCount: controller.transactions.length,
                  itemBuilder: (context, index) {
                    var txn = controller.transactions[index];
                    return Container(
                      width: double.infinity,
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
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
                      child: Column(
                        children: [
                          Theme(
                            data: Theme.of(context).copyWith(
                              dividerColor: Colors.transparent,
                              expansionTileTheme: const ExpansionTileThemeData(
                                iconColor: AppColors.grey,
                                collapsedIconColor: AppColors.grey,
                              ),
                            ),
                            child: ExpansionTile(
                              title: Text(
                                txn["title"].toString(),
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
                                    "${txn["amount"].toString()}/-",
                                    style: const TextStyle(
                                      color: AppColors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  const Icon(Icons.expand_more, color: AppColors.grey),
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
                                      leading: const Icon(Icons.fastfood, color: AppColors.primary),
                                      title: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            item["item"].toString(),
                                            style: const TextStyle(color: AppColors.black, fontSize: 16),
                                          ),
                                          Text("${item["price"].toString()}/-",
                                            style: const TextStyle(
                                              color: AppColors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),

                                // Date
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10, right: 12),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      txn["date"].toString(),
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
                        ],
                      ),
                    );
                  },
                ),

                // ✅ NO MORE Button
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () {
                      Get.snackbar(
                        "Info",
                        "No more transactions available",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: AppColors.primary,
                        colorText: AppColors.white,
                      );
                    },
                    child: const Text(
                      "NO MORE",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 180),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
