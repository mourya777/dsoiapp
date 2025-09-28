import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../UtilsPage/ColorsPage.dart';
import '../wedgetPage/SnackBarMessage.dart';

class HomeController extends GetxController {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  var attachedFilePath = ''.obs; // ✅ Reactive variable

  var memberName = "Rahul Sharma".obs;
  var membershipNo = "12345".obs;
  var balance = "₹1500".obs;
  var memberType = "Main Member".obs;
  var location = "DOI JABALPUR".obs;
  var mobileNo = "9876543210".obs;

  var recentTransactionTitle = "Food Court".obs;
  var recentTransactionAmount = "₹500".obs;
  var recentTransactionDate = "12 Sept 2025".obs;

  var transactions = [
    {
      "title": "Order",
      "amount": "₹500",
      "date": "12 Sept 2025",
      "details": [
        {"item": "Pizza", "price": "₹200"},
        {"item": "Burger", "price": "₹150"},
        {"item": "Cold Drink", "price": "₹150"},
      ],
    },
    {
      "title": "Gym",
      "amount": "₹1200",
      "date": "11 Sept 2025",
      "details": [
        {"item": "Personal Training", "price": "₹800"},
        {"item": "Protein Shake", "price": "₹400"},
      ],
    },
    {
      "title": "Membership Renewal",
      "amount": "₹5000",
      "date": "05 Sept 2025",
      "details": [
        {"item": "Annual Fee", "price": "₹5000"},
      ],
    },
  ].obs;

  void updateBalance(int newBalance) {
    balance.value = "₹$newBalance";
  }

  var imageFile = Rxn<File>();
  final ImagePicker _picker = ImagePicker();

  Future<void> attachScreenshot(BuildContext context) async {
    PermissionStatus status;

    if (Platform.isAndroid) {
      status = await Permission.storage
          .request(); // Android ke liye simple storage permission
    } else {
      status = await Permission.photos
          .request(); // iOS ke liye photos permission
    }

    if (status.isGranted) {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        attachedFilePath.value = pickedFile.path;
        imageFile.value = File(pickedFile.path);
      }
    } else if (status.isDenied) {
      Get.snackbar(
        "Permission Denied",
        "Gallery access is required to pick an image",
      );
    } else if (status.isPermanentlyDenied) {
      Get.snackbar(
        "Permission Required",
        "Please enable gallery permission from settings",
      );
      await openAppSettings();
    }
  }

  void openTransactionForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        final size = MediaQuery.of(context).size;

        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.payment, color: Colors.green, size: 28),
                          SizedBox(width: 8),
                          Text(
                            "TRANSACTION FORM",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: AppColors.red,
                          size: 30,
                        ),
                        onPressed: () => Get.back(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  Center(
                    child: Container(
                      color: Colors.grey[200],
                      padding: const EdgeInsets.all(16),
                      child: Image.asset(
                        'Assets/Images/images.png',
                        width: 100,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  TextField(
                    controller: amountController,
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Enter Amount",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixText: "₹ ",
                    ),
                  ),
                  const SizedBox(height: 15),

                  const Text(
                    "Attach Screenshot",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Obx(() {
                    bool isAttached = attachedFilePath.value.isNotEmpty;
                    return InkWell(
                      onTap: () => attachScreenshot(context),
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          isAttached
                              ? Icons.insert_drive_file
                              : Icons.attach_file,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    );
                  }),

                  const SizedBox(height: 15),

                  TextField(
                    controller: descController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: "Enter Description",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  SizedBox(
                    width: size.width,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        String amount = amountController.text.trim();
                        String desc = descController.text.trim();

                        if (amount.isEmpty) {
                          CustomSnackBar.show(
                            title: "Error",
                            message: "Please enter the amount",
                            icon: Icons.close,
                            backgroundColor: AppColors.red,
                            textColor: AppColors.white,
                            iconColor: AppColors.white,
                          );
                          return;
                        }

                        // Screenshot validation
                        if (attachedFilePath.value.isEmpty) {
                          CustomSnackBar.show(
                            title: "Error",
                            message: "Please attach a screenshot",
                            icon: Icons.close,
                            backgroundColor: AppColors.red,
                            textColor: AppColors.white,
                            iconColor: AppColors.white,
                          );
                          return;
                        }

                        if (desc.isEmpty) {
                          CustomSnackBar.show(
                            title: "Error",
                            message: "Please enter description",
                            icon: Icons.close,
                            backgroundColor: AppColors.red,
                            textColor: AppColors.white,
                            iconColor: AppColors.white,
                          );
                          return;
                        }

                        CustomSnackBar.show(
                          title: "Success",
                          message:
                              "Thanks for submit Payment Request,Our Admin Member will update you balance soon. Your Transaction id is: 584874445!",
                          icon: Icons.check_circle,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          iconColor: Colors.white,
                        );

                        // Correct delay: 500 milliseconds
                        Future.delayed(const Duration(milliseconds: 500), () {
                          Navigator.pop(context); // Close BottomSheet
                          amountController.clear();
                          descController.clear();
                          attachedFilePath.value = '';
                          imageFile.value = null;
                        });
                      },

                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      child: Ink(
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
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            "SUBMIT",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void refreshData() {
    balance.value = "₹1500";
    transactions.clear();
    transactions.addAll([
      {
        "title": "Food Court",
        "amount": "₹500",
        "date": "12 Sept 2025",
        "details": [
          {"item": "Pizza", "price": "₹200"},
          {"item": "Burger", "price": "₹150"},
          {"item": "Cold Drink", "price": "₹150"},
        ],
      },
      // add other transactions
    ]);
  }
}
