import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class OrderReceiptPage extends StatelessWidget {
  const OrderReceiptPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ===== HEADER =====
                  const Center(
                    child: Column(
                      children: [
                        Text(
                          "DOI GOPALPUR",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Liquor",
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "9/26/2025, 10:45:40 AM",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          "Order No: 251",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text("Name: Amresh Dubey",
                      style: TextStyle(fontSize: 13)),
                  const Text("No: R-0302", style: TextStyle(fontSize: 13)),

                  const SizedBox(height: 12),


                  Row(
                    children: const [
                      Expanded(
                          child:
                          Text("NAME",  maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(

                                  fontWeight: FontWeight.bold, fontSize: 13))),
                      SizedBox(width: 8),
                      Text("AMT.",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13)),
                      SizedBox(width: 16),
                      Text("QTY.",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13)),
                    ],
                  ),
                  const Divider(thickness: 1),


                  Row(
                    children: const [
                      Expanded(
                          child: Text("100 PIPER12 YRS",  maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 13))),
                      SizedBox(width: 8),
                      Text("₹160.00", style: TextStyle(fontSize: 13)),
                      SizedBox(width: 16),
                      Text("1", style: TextStyle(fontSize: 13)),
                    ],
                  ),
                  const Divider(thickness: 1),
                  const SizedBox(height: 8),

                  // ===== TOTALS =====
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Total:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                      Text("₹160.00",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Card Balance:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13)),
                      Text("₹3393.00",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13)),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // ===== THANK YOU =====
                  const Center(
                    child: Text("Thank You!",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                  ),

                  const SizedBox(height: 12),

                  // ===== QR CODE =====
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

            // ===== CLOSE BUTTON =====
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
