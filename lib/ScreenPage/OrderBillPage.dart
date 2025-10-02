import 'package:flutter/material.dart';

import '../UtilsPage/ColorsPage.dart';
import '../wedgetPage/GlobleList.dart';



// class OrderReceiptPage extends StatelessWidget {
//   const OrderReceiptPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // ===== HEADER =====
//                   const Center(
//                     child: Column(
//                       children: [
//                         Text(
//                           "DOI GOPALPUR",
//                           style: TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           "Liquor",
//                           style: TextStyle(fontSize: 14),
//                         ),
//                         SizedBox(height: 4),
//                         Text(
//                           "9/26/2025, 10:45:40 AM",
//                           style: TextStyle(fontSize: 12),
//                         ),
//                         Text(
//                           "Order No: 251",
//                           style: TextStyle(fontSize: 18),
//                         ),
//                       ],
//                     ),
//                   ),
//
//                   const SizedBox(height: 10),
//
//                   const Text("Name: Amresh Dubey",
//                       style: TextStyle(fontSize: 13)),
//                   const Text("No: R-0302", style: TextStyle(fontSize: 13)),
//
//                   const SizedBox(height: 12),
//
//
//                   Row(
//                     children: const [
//                       Expanded(
//                           child:
//                           Text("NAME",  maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                               style: TextStyle(
//
//                                   fontWeight: FontWeight.bold, fontSize: 13))),
//                       SizedBox(width: 8),
//                       Text("AMT.",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 13)),
//                       SizedBox(width: 16),
//                       Text("QTY.",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 13)),
//                     ],
//                   ),
//                   const Divider(thickness: 1),
//
//
//                   Row(
//                     children: const [
//                       Expanded(
//                           child: Text("100 PIPER12 YRS",  maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                               style: TextStyle(fontSize: 13))),
//                       SizedBox(width: 8),
//                       Text("₹160.00", style: TextStyle(fontSize: 13)),
//                       SizedBox(width: 16),
//                       Text("1", style: TextStyle(fontSize: 13)),
//                     ],
//                   ),
//                   const Divider(thickness: 1),
//                   const SizedBox(height: 8),
//
//                   // ===== TOTALS =====
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: const [
//                       Text("Total:",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 14)),
//                       Text("₹160.00",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 14)),
//                     ],
//                   ),
//                   const SizedBox(height: 4),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: const [
//                       Text("Card Balance:",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 13)),
//                       Text("₹3393.00",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 13)),
//                     ],
//                   ),
//
//                   const SizedBox(height: 12),
//
//                   // ===== THANK YOU =====
//                   const Center(
//                     child: Text("Thank You!",
//                         style: TextStyle(
//                             fontSize: 14, fontWeight: FontWeight.bold)),
//                   ),
//
//                   const SizedBox(height: 12),
//
//                   // ===== QR CODE =====
//                   Center(
//                     child: Image.asset(
//                       "Assets/Drink/QR_code.png",
//                       width: 100,
//                       height: 100,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             // ===== CLOSE BUTTON =====
//             Positioned(
//               top: 10,
//               right: 10,
//               child: GestureDetector(
//                 onTap: () => Navigator.of(context).pop(),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.grey.shade300,
//                     shape: BoxShape.circle,
//                   ),
//                   padding: const EdgeInsets.all(6),
//                   child: const Icon(Icons.close, size: 20),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
class OrderReceiptPage extends StatelessWidget {
  final Map<String, dynamic> transaction;
  final Map<String, dynamic>? memberData;

  const OrderReceiptPage({Key? key, required this.transaction, this.memberData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name = memberData?["member_name"] ?? "Unknown";
    final no = memberData?["member_code"] ?? "N/A";

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ===== HEADER =====
                  Center(
                    child: Column(
                      children: [
                        const Text(
                          "DSOI JABALPUR",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${transaction["title"]}",
                          style: TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "${transaction["date"]}, ${transaction["time"]}",
                          style: const TextStyle(fontSize: 12),
                        ),
                        Text(
                          "Order No: ${transaction["tran_id"]}",
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    // "Name: $name",
                    "Name:${GlobalList.memberData["member_fname"] ?? ""} ${GlobalList.memberData["member_lname"] ?? ""}",

                    style: const TextStyle(fontSize: 13),
                  ),
                  Text("No: $no", style: const TextStyle(fontSize: 13)),

                  const SizedBox(height: 12),

                  // ITEMS HEADER
                  Row(
                    children: const [
                      Expanded(
                        child: Text(
                          "NAME",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "AMT.",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(width: 16),
                      Text(
                        "QTY.",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  const Divider(thickness: 1),

                  // ITEMS LIST
                  ...transaction["details"].map<Widget>((item) {
                    final map = item as Map<String, dynamic>;
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                map["item"] ?? "",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 13),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "₹${map["price"] ?? "0"}",
                              style: const TextStyle(fontSize: 13),
                            ),
                            const SizedBox(width: 16),
                            const Text("1", style: TextStyle(fontSize: 13)),
                          ],
                        ),
                        const Divider(thickness: 1),
                      ],
                    );
                  }).toList(),

                  const SizedBox(height: 8),

                  // TOTAL
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "₹${transaction["amount"] ?? "0"}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  const Center(
                    child: Text(
                      "Thank You!",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  Center(
                    child: Image.asset(
                      "Assets/Drink/QR_code.png",
                      width: 100,
                      height: 100,
                    ),
                  ),
                ],
              ),
            ),

            // CLOSE BUTTON
            Positioned(
              top: 10,
              right: 10,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(6),
                  child: const Icon(Icons.close, size: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
