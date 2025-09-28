import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../ApiControllers/RFIDVerifyApiController.dart';
import '../UtilsPage/ColorsPage.dart';
import '../UtilsPage/SessionManager.dart';
import 'GlobleList.dart';
import 'SnackBarMessage.dart';

class RFIDDialog {
  static void show(
      BuildContext context,
      String title, {
        Function()? onVerified,
      }) {
    final TextEditingController rfidController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // --- Title ---
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.restaurant_menu,
                        color: AppColors.primary, size: 24),
                    SizedBox(width: 8),
                    Text(
                      title.toUpperCase(),
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(thickness: 1.2),
                const SizedBox(height: 10),

                // --- TextField ---
                TextField(
                  controller: rfidController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "RFID Number",
                    hintText: "Your RFID Number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(Icons.perm_identity,
                        color: AppColors.primary),
                  ),
                ),

                const SizedBox(height: 15),
                const Divider(thickness: 1.2),
                const SizedBox(height: 15),

                // --- Buttons ---
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Cancel button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          Icon(Icons.cancel, color: Colors.red),
                          SizedBox(width: 8),
                          Text("Cancel",
                              style:
                              TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),

                    const SizedBox(width: 20),

                    // Search button
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.khaki,
                              AppColors.primary,
                              AppColors.secondary,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            foregroundColor: AppColors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          onPressed: () async {
                            String rfid = rfidController.text.trim();
                            if (rfid.isEmpty) {
                              CustomSnackBar.show(
                                title: "Error",
                                message: "Please enter RFID number!",
                                icon: Icons.close,
                                backgroundColor: AppColors.red,
                                textColor: AppColors.white,
                                iconColor: AppColors.white,
                              );
                              return;
                            }

                            final result = await AttendenceService.verifyRFID(rfid);
                            GlobalCart.cartData[0]["member_id"] =result!.records.memberId;

                            if (result != null && result.status == 1) {

                              await SessionManager.saveUser(result); // ✅ SharedPref में save
                              Navigator.of(context).pop();   // ✅ dialog close
                              if (onVerified != null) onVerified();
                            } else {
                              CustomSnackBar.show(
                                title: "Error",
                                message: "${result?.msg ?? "RFID verification failed"}",
                                icon: Icons.close,
                                backgroundColor: AppColors.red,
                                textColor: AppColors.white,
                                iconColor: AppColors.white,
                              );
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.search, color: AppColors.white),
                              SizedBox(width: 8),
                              Text("Search",
                                  style: TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.bold)),
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
        );
      },
    );
  }
}

