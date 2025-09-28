import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ControllerPage/HomeController.dart';
import '../ControllerPage/SplashController.dart';
import '../ScreenPage/splashPage.dart';
import '../UtilsPage/ColorsPage.dart';
import '../wedgetPage/SnackBarMessage.dart';

// class ProfileController extends GetxController {
//   final homeController = Get.put(HomeController());
//
//   void showUserDetailsSheet(BuildContext context) {
//     Get.bottomSheet(
//       Stack(
//         children: [
//           Container(
//             padding: EdgeInsets.only(
//               top: 20,
//               left: 20,
//               right: 20,
//               bottom: MediaQuery.of(context).viewInsets.bottom + 20,
//             ),
//             decoration: BoxDecoration(
//               color: AppColors.white,
//               borderRadius: const BorderRadius.vertical(
//                 top: Radius.circular(25),
//               ),
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Row(
//                       children: [
//                         Icon(Icons.person, color: AppColors.primary, size: 28),
//                         SizedBox(width: 8),
//                         Text(
//                           "DETAILS",
//                           style: TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                             color: AppColors.black,
//                           ),
//                         ),
//                       ],
//                     ),
//                     IconButton(
//                       onPressed: () => Get.back(),
//                       icon: const Icon(
//                         Icons.close,
//                         color: Colors.red,
//                         size: 35,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//
//                 Obx(
//                   () => _buildDetailRowWithIcon(
//                     Icons.account_circle,
//                     "Name",
//                     homeController.memberName.value,
//                   ),
//                 ),
//                 Obx(
//                   () => _buildDetailRowWithIcon(
//                     Icons.confirmation_num,
//                     "Membership No",
//                     homeController.membershipNo.value,
//                   ),
//                 ),
//                 Obx(
//                   () => _buildDetailRowWithIcon(
//                     Icons.group,
//                     "Member Type",
//                     homeController.memberType.value,
//                   ),
//                 ),
//                 Obx(
//                   () => _buildDetailRowWithIcon(
//                     Icons.location_on,
//                     "Location",
//                     homeController.location.value,
//                   ),
//                 ),
//                 Obx(
//                   () => _buildDetailRowWithIcon(
//                     Icons.phone,
//                     "Mobile No",
//                     homeController.mobileNo.value,
//                   ),
//                 ),
//                 Obx(
//                   () => _buildDetailRowWithIcon(
//                     Icons.account_balance_wallet,
//                     "Balance",
//                     homeController.balance.value,
//                   ),
//                 ),
//
//                 const SizedBox(height: 25),
//
//                 const SizedBox(height: 15),
//               ],
//             ),
//           ),
//         ],
//       ),
//       isScrollControlled: true,
//     );
//   }
//
//   void showLogoutConfirmation(BuildContext context) {
//     Get.dialog(
//       Dialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         child: Container(
//           padding: const EdgeInsets.all(20),
//           decoration: BoxDecoration(
//             color: AppColors.white,
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: const [
//                   Icon(Icons.logout, color: Colors.red, size: 30),
//                   SizedBox(width: 8),
//                   Text(
//                     "LOGOUT",
//                     style: TextStyle(
//                       color: AppColors.red,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 22,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 15),
//               const Text(
//                 "Are you sure you want to logout?",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(color: AppColors.red, fontSize: 16),
//               ),
//               const SizedBox(height: 25),
//
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton.icon(
//                     icon: const Icon(Icons.close, color: AppColors.primary),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: AppColors.white,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     onPressed: () {
//                       Get.back();
//                     },
//                     label: const Text(
//                       "Cancel",
//                       style: TextStyle(color: AppColors.primary),
//                     ),
//                   ),
//
//                   ElevatedButton.icon(
//                     icon: const Icon(Icons.check, color: AppColors.red),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: AppColors.white,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     onPressed: () async {
//                       Get.back();
//                       Get.back(); // Close dialog
//                       await SessionManager.logout();
//
//                       Get.delete<SplashController>();
//
//                       Get.offAll(() => SplashScreen());
//                     },
//                     label: const Text(
//                       "Yes",
//                       style: TextStyle(color: AppColors.red),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // 🔹 Show Reset PIN
//   void showResetPinSheet(BuildContext context) {
//     final TextEditingController oldPin = TextEditingController();
//     final TextEditingController newPin = TextEditingController();
//     final TextEditingController confirmPin = TextEditingController();
//
//     Get.bottomSheet(
//       Stack(
//         children: [
//           SingleChildScrollView(
//             child: Container(
//               padding: EdgeInsets.only(
//                 top: 20, // extra space for top-right close button
//                 left: 20,
//                 right: 20,
//                 bottom: MediaQuery.of(context).viewInsets.bottom + 20,
//               ),
//               decoration: BoxDecoration(
//                 color: AppColors.white,
//                 borderRadius: const BorderRadius.vertical(
//                   top: Radius.circular(25),
//                 ),
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Icon(
//                             Icons.lock_reset,
//                             color: AppColors.primary,
//                             size: 35,
//                           ),
//                           SizedBox(width: 8),
//                           Text(
//                             "RESET PIN",
//                             style: TextStyle(
//                               fontSize: 22,
//                               fontWeight: FontWeight.bold,
//                               color: AppColors.black,
//                             ),
//                           ),
//                         ],
//                       ),
//                       IconButton(
//                         onPressed: () => Get.back(),
//                         icon: const Icon(
//                           Icons.close,
//                           color: Colors.red,
//                           size: 35,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 15),
//                   _pinField("Old PIN", oldPin),
//                   const SizedBox(height: 12),
//                   _pinField("New PIN", newPin),
//                   const SizedBox(height: 12),
//                   _pinField("Confirm PIN", confirmPin),
//                   const SizedBox(height: 20),
//                   Center(
//                     child: Container(
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         gradient: const LinearGradient(
//                           colors: [
//                             AppColors.khakiLight,
//                             AppColors.primary,
//                             AppColors.secondary,
//                           ],
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                         ),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.transparent,
//                           shadowColor: Colors.transparent,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           padding: const EdgeInsets.symmetric(vertical: 14),
//                         ),
//                         // onPressed: () {
//                         //   if (newPin.text == confirmPin.text &&
//                         //       oldPin.text.isNotEmpty) {
//                         //     Get.back();
//                         //     Get.snackbar(
//                         //       "Success",
//                         //       "PIN reset successfully",
//                         //       snackPosition: SnackPosition.BOTTOM,
//                         //       backgroundColor: AppColors.primary,
//                         //       colorText: AppColors.white,
//                         //     );
//                         //   } else {
//                         //     Get.snackbar(
//                         //       "Error",
//                         //       "PIN mismatch or empty",
//                         //       snackPosition: SnackPosition.BOTTOM,
//                         //       backgroundColor: AppColors.primary,
//                         //       colorText: Colors.white,
//                         //       borderColor: Colors.red,
//                         //       borderWidth: 2,
//                         //     );
//                         //   }
//                         // },
//                         onPressed: () {
//                           if (oldPin.text.isEmpty ||
//                               newPin.text.isEmpty ||
//                               confirmPin.text.isEmpty) {
//                             CustomSnackBar.show(
//                               title: "Error",
//                               message: "All fields are required!",
//                               icon: Icons.close,
//                               backgroundColor: Colors.red,
//                               textColor: Colors.white,
//                               iconColor: Colors.white,
//                             );
//                           } else if (newPin.text.length != 6 ||
//                               confirmPin.text.length != 6 ||
//                               oldPin.text.length != 6) {
//                             CustomSnackBar.show(
//                               title: "Error",
//                               message: "PIN must be exactly 6 digits!",
//                               icon: Icons.close,
//                               backgroundColor: Colors.red,
//                               textColor: Colors.white,
//                               iconColor: Colors.white,
//                             );
//                           } else if (newPin.text != confirmPin.text) {
//                             CustomSnackBar.show(
//                               title: "Error",
//                               message: "New PIN and Confirm PIN do not match!",
//                               icon: Icons.close,
//                               backgroundColor: Colors.red,
//                               textColor: Colors.white,
//                               iconColor: Colors.white,
//                             );
//                           } else {
//                             Get.offAll(SplashScreen());
//                             CustomSnackBar.show(
//                               title: "Success",
//                               message: "PIN reset successfully!",
//                               icon: Icons.check_circle,
//                               backgroundColor: Colors.green,
//                               textColor: Colors.white,
//                               iconColor: Colors.white,
//                               // durationSeconds: 4, // optional
//                             );
//                           }
//                         },
//
//                         child: const Text(
//                           "RESET PIN",
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: AppColors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       isScrollControlled: true,
//     );
//   }
//
//   // 🔹 Helper Widgets
//   static Widget _buildDetailRowWithIcon(
//     IconData icon,
//     String title,
//     String value,
//   ) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 6),
//       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
//       decoration: BoxDecoration(
//         color: Colors.grey.shade100,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         children: [
//           Icon(icon, color: AppColors.primary),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Text(
//               "$title: $value",
//               style: const TextStyle(
//                 fontSize: 16,
//                 color: AppColors.black,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   static Widget _pinField(String label, TextEditingController controller) {
//     return TextField(
//       controller: controller,
//       keyboardType: TextInputType.number,
//       obscureText: true,
//       style: const TextStyle(color: AppColors.black),
//       decoration: InputDecoration(
//         labelText: label,
//         labelStyle: const TextStyle(color: AppColors.black),
//         filled: true,
//         fillColor: AppColors.white,
//         prefixIcon: const Icon(Icons.lock, color: AppColors.primary),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ControllerPage/HomeController.dart';
import '../ControllerPage/SplashController.dart';
import '../ScreenPage/splashPage.dart';
import '../UtilsPage/ColorsPage.dart';
import '../UtilsPage/SessionManager.dart';
import '../wedgetPage/SnackBarMessage.dart';

// class ProfileController extends GetxController {
//   final homeController = Get.put(HomeController());
//
//   void showUserDetailsSheet(BuildContext context) {
//     Get.bottomSheet(
//       Stack(
//         children: [
//           Container(
//             padding: EdgeInsets.only(
//               top: 20,
//               left: 20,
//               right: 20,
//               bottom: MediaQuery.of(context).viewInsets.bottom + 20,
//             ),
//             decoration: BoxDecoration(
//               color: AppColors.white,
//               borderRadius: const BorderRadius.vertical(
//                 top: Radius.circular(25),
//               ),
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Row(
//                       children: [
//                         Icon(Icons.person, color: AppColors.primary, size: 28),
//                         SizedBox(width: 8),
//                         Text(
//                           "DETAILS",
//                           style: TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                             color: AppColors.black,
//                           ),
//                         ),
//                       ],
//                     ),
//                     IconButton(
//                       onPressed: () => Get.back(),
//                       icon: const Icon(
//                         Icons.close,
//                         color: Colors.red,
//                         size: 35,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//
//                 Obx(
//                   () => _buildDetailRowWithIcon(
//                     Icons.account_circle,
//                     "Name",
//                     homeController.memberName.value,
//                   ),
//                 ),
//                 Obx(
//                   () => _buildDetailRowWithIcon(
//                     Icons.confirmation_num,
//                     "Membership No",
//                     homeController.membershipNo.value,
//                   ),
//                 ),
//                 Obx(
//                   () => _buildDetailRowWithIcon(
//                     Icons.group,
//                     "Member Type",
//                     homeController.memberType.value,
//                   ),
//                 ),
//                 Obx(
//                   () => _buildDetailRowWithIcon(
//                     Icons.location_on,
//                     "Location",
//                     homeController.location.value,
//                   ),
//                 ),
//                 Obx(
//                   () => _buildDetailRowWithIcon(
//                     Icons.phone,
//                     "Mobile No",
//                     homeController.mobileNo.value,
//                   ),
//                 ),
//                 Obx(
//                   () => _buildDetailRowWithIcon(
//                     Icons.account_balance_wallet,
//                     "Balance",
//                     homeController.balance.value,
//                   ),
//                 ),
//
//                 const SizedBox(height: 25),
//
//                 const SizedBox(height: 15),
//               ],
//             ),
//           ),
//         ],
//       ),
//       isScrollControlled: true,
//     );
//   }
//
//   void showLogoutConfirmation(BuildContext context) {
//     Get.dialog(
//       Dialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         child: Container(
//           padding: const EdgeInsets.all(20),
//           decoration: BoxDecoration(
//             color: AppColors.white,
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: const [
//                   Icon(Icons.logout, color: Colors.red, size: 30),
//                   SizedBox(width: 8),
//                   Text(
//                     "LOGOUT",
//                     style: TextStyle(
//                       color: AppColors.red,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 22,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 15),
//               const Text(
//                 "Are you sure you want to logout?",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(color: AppColors.red, fontSize: 16),
//               ),
//               const SizedBox(height: 25),
//
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton.icon(
//                     icon: const Icon(Icons.close, color: AppColors.primary),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: AppColors.white,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     onPressed: () {
//                       Get.back();
//                     },
//                     label: const Text(
//                       "Cancel",
//                       style: TextStyle(color: AppColors.primary),
//                     ),
//                   ),
//
//                   ElevatedButton.icon(
//                     icon: const Icon(Icons.check, color: AppColors.red),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: AppColors.white,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     onPressed: () async {
//                       Get.back();
//                       Get.back(); // Close dialog
//                       await SessionManager.logout();
//
//                       Get.delete<SplashController>();
//
//                       Get.offAll(() => SplashScreen());
//                     },
//                     label: const Text(
//                       "Yes",
//                       style: TextStyle(color: AppColors.red),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // 🔹 Show Reset PIN
//   void showResetPinSheet(BuildContext context) {
//     final TextEditingController oldPin = TextEditingController();
//     final TextEditingController newPin = TextEditingController();
//     final TextEditingController confirmPin = TextEditingController();
//
//     Get.bottomSheet(
//       Stack(
//         children: [
//           SingleChildScrollView(
//             child: Container(
//               padding: EdgeInsets.only(
//                 top: 20, // extra space for top-right close button
//                 left: 20,
//                 right: 20,
//                 bottom: MediaQuery.of(context).viewInsets.bottom + 20,
//               ),
//               decoration: BoxDecoration(
//                 color: AppColors.white,
//                 borderRadius: const BorderRadius.vertical(
//                   top: Radius.circular(25),
//                 ),
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Icon(
//                             Icons.lock_reset,
//                             color: AppColors.primary,
//                             size: 35,
//                           ),
//                           SizedBox(width: 8),
//                           Text(
//                             "RESET PIN",
//                             style: TextStyle(
//                               fontSize: 22,
//                               fontWeight: FontWeight.bold,
//                               color: AppColors.black,
//                             ),
//                           ),
//                         ],
//                       ),
//                       IconButton(
//                         onPressed: () => Get.back(),
//                         icon: const Icon(
//                           Icons.close,
//                           color: Colors.red,
//                           size: 35,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 15),
//                   _pinField("Old PIN", oldPin),
//                   const SizedBox(height: 12),
//                   _pinField("New PIN", newPin),
//                   const SizedBox(height: 12),
//                   _pinField("Confirm PIN", confirmPin),
//                   const SizedBox(height: 20),
//                   Center(
//                     child: Container(
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         gradient: const LinearGradient(
//                           colors: [
//                             AppColors.khakiLight,
//                             AppColors.primary,
//                             AppColors.secondary,
//                           ],
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                         ),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.transparent,
//                           shadowColor: Colors.transparent,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           padding: const EdgeInsets.symmetric(vertical: 14),
//                         ),
//                         // onPressed: () {
//                         //   if (newPin.text == confirmPin.text &&
//                         //       oldPin.text.isNotEmpty) {
//                         //     Get.back();
//                         //     Get.snackbar(
//                         //       "Success",
//                         //       "PIN reset successfully",
//                         //       snackPosition: SnackPosition.BOTTOM,
//                         //       backgroundColor: AppColors.primary,
//                         //       colorText: AppColors.white,
//                         //     );
//                         //   } else {
//                         //     Get.snackbar(
//                         //       "Error",
//                         //       "PIN mismatch or empty",
//                         //       snackPosition: SnackPosition.BOTTOM,
//                         //       backgroundColor: AppColors.primary,
//                         //       colorText: Colors.white,
//                         //       borderColor: Colors.red,
//                         //       borderWidth: 2,
//                         //     );
//                         //   }
//                         // },
//                         onPressed: () {
//                           if (oldPin.text.isEmpty ||
//                               newPin.text.isEmpty ||
//                               confirmPin.text.isEmpty) {
//                             CustomSnackBar.show(
//                               title: "Error",
//                               message: "All fields are required!",
//                               icon: Icons.close,
//                               backgroundColor: Colors.red,
//                               textColor: Colors.white,
//                               iconColor: Colors.white,
//                             );
//                           } else if (newPin.text.length != 6 ||
//                               confirmPin.text.length != 6 ||
//                               oldPin.text.length != 6) {
//                             CustomSnackBar.show(
//                               title: "Error",
//                               message: "PIN must be exactly 6 digits!",
//                               icon: Icons.close,
//                               backgroundColor: Colors.red,
//                               textColor: Colors.white,
//                               iconColor: Colors.white,
//                             );
//                           } else if (newPin.text != confirmPin.text) {
//                             CustomSnackBar.show(
//                               title: "Error",
//                               message: "New PIN and Confirm PIN do not match!",
//                               icon: Icons.close,
//                               backgroundColor: Colors.red,
//                               textColor: Colors.white,
//                               iconColor: Colors.white,
//                             );
//                           } else {
//                             Get.offAll(SplashScreen());
//                             CustomSnackBar.show(
//                               title: "Success",
//                               message: "PIN reset successfully!",
//                               icon: Icons.check_circle,
//                               backgroundColor: Colors.green,
//                               textColor: Colors.white,
//                               iconColor: Colors.white,
//                               // durationSeconds: 4, // optional
//                             );
//                           }
//                         },
//
//                         child: const Text(
//                           "RESET PIN",
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: AppColors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       isScrollControlled: true,
//     );
//   }
//
//   // 🔹 Helper Widgets
//   static Widget _buildDetailRowWithIcon(
//     IconData icon,
//     String title,
//     String value,
//   ) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 6),
//       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
//       decoration: BoxDecoration(
//         color: Colors.grey.shade100,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         children: [
//           Icon(icon, color: AppColors.primary),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Text(
//               "$title: $value",
//               style: const TextStyle(
//                 fontSize: 16,
//                 color: AppColors.black,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   static Widget _pinField(String label, TextEditingController controller) {
//     return TextField(
//       controller: controller,
//       keyboardType: TextInputType.number,
//       obscureText: true,
//       style: const TextStyle(color: AppColors.black),
//       decoration: InputDecoration(
//         labelText: label,
//         labelStyle: const TextStyle(color: AppColors.black),
//         filled: true,
//         fillColor: AppColors.white,
//         prefixIcon: const Icon(Icons.lock, color: AppColors.primary),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ControllerPage/HomeController.dart';
import '../ControllerPage/SplashController.dart';
import '../ScreenPage/splashPage.dart';
import '../UtilsPage/ColorsPage.dart';
import '../UtilsPage/SessionManager.dart';
import '../wedgetPage/SnackBarMessage.dart';

class ProfileController extends GetxController {
  final homeController = Get.put(HomeController());

<<<<<<< Updated upstream
<<<<<<< Updated upstream
  // 🔹 Show User Details
=======
=======
>>>>>>> Stashed changes
  @override
  void onInit() {
    super.onInit();
    loadUserDetails();
  }

  void loadUserDetails() async {
    final user = await SessionManager.getUser();

    homeController.memberName.value = user!.mainMemberName.toUpperCase();
    homeController.membershipNo.value = user.records.memberId.toUpperCase();
    homeController.mobileNo.value = user.records.memberMobile.toUpperCase();
    homeController.balance.value = user.balance.toUpperCase();
    homeController.location.value = user.records.branch!.toUpperCase();
    homeController.memberType.value =
        (user.records.memberType ?? "Main Member").toUpperCase();
  }

<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
  void showUserDetailsSheet(BuildContext context) {
    Get.bottomSheet(
      Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom + 20,
            ),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.person, color: AppColors.primary, size: 28),
                        SizedBox(width: 8),
                        Text(
                          "DETAILS",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: AppColors.black),
                        ),
                      ],
                    ),          IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(
                        Icons.close,
                        color: Colors.red,
                        size: 35,
                      ),
                    ),

                  ],
                ),
                const SizedBox(height: 20),

<<<<<<< Updated upstream
                // User detail rows
                Obx(() => _buildDetailRowWithIcon(Icons.account_circle, "Name", homeController.memberName.value)),
                Obx(() => _buildDetailRowWithIcon(Icons.confirmation_num, "Membership No", homeController.membershipNo.value)),
                Obx(() => _buildDetailRowWithIcon(Icons.group, "Member Type", homeController.memberType.value)),
                Obx(() => _buildDetailRowWithIcon(Icons.location_on, "Location", homeController.location.value)),
                Obx(() => _buildDetailRowWithIcon(Icons.phone, "Mobile No", homeController.mobileNo.value)),
                Obx(() => _buildDetailRowWithIcon(Icons.account_balance_wallet, "Balance", homeController.balance.value)),
=======
                Obx(
                      () => _buildDetailRowWithIcon(
                    Icons.account_circle,
                    "Name",
                    homeController.memberName.value,
                  ),
                ),
                Obx(
                      () => _buildDetailRowWithIcon(
                    Icons.confirmation_num,
                    "Membership No",
                    homeController.membershipNo.value,
                  ),
                ),
                Obx(
                      () => _buildDetailRowWithIcon(
                    Icons.group,
                    "Member Type",
                    homeController.memberType.value,
                  ),
                ),
                Obx(
                      () => _buildDetailRowWithIcon(
                    Icons.location_on,
                    "Location",
                    homeController.location.value,
                  ),
                ),
                Obx(
                      () => _buildDetailRowWithIcon(
                    Icons.phone,
                    "Mobile No",
                    homeController.mobileNo.value,
                  ),
                ),
                Obx(
                      () => _buildDetailRowWithIcon(
                    Icons.account_balance_wallet,
                    "Balance",
                    homeController.balance.value,
                  ),
                ),
>>>>>>> Stashed changes

                const SizedBox(height: 25),
                const SizedBox(height: 15),
              ],
            ),
          ),

        ],
      ),
      isScrollControlled: true,
    );
  }

  // 🔹 Show Logout Confirmation
  void showLogoutConfirmation(BuildContext context) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.logout, color: Colors.red, size: 30),
                  SizedBox(width: 8),
                  Text(
                    "LOGOUT",
                    style: TextStyle(
                        color: AppColors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const Text(
                "Are you sure you want to logout?",
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.red, fontSize: 16),
              ),
              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.close, color: AppColors.primary),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    label: const Text(
                      "Cancel",
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),

                  ElevatedButton.icon(
                    icon: const Icon(Icons.check, color: AppColors.red),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {
                      Get.back();
                      Get.delete<SplashController>();
                      Get.offAll(() => SplashScreen());
                    },
                    label: const Text(
                      "Yes",
                      style: TextStyle(color: AppColors.red),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void showResetPinSheet(BuildContext context) {
    final TextEditingController oldPin = TextEditingController();
    final TextEditingController newPin = TextEditingController();
    final TextEditingController confirmPin = TextEditingController();

    Get.bottomSheet(
      Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20,
              ),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius:
                const BorderRadius.vertical(top: Radius.circular(25)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.lock_reset,color: AppColors.primary,size: 35,),
                          SizedBox(width: 8,),
                          Text(
                            "RESET PIN",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: ()=> Get.back(),
                        icon: const Icon(
                          Icons.close,
                          color: Colors.red,
                          size: 35,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  _pinField("Old PIN", oldPin),
                  const SizedBox(height: 12),
                  _pinField("New PIN", newPin),
                  const SizedBox(height: 12),
                  _pinField("Confirm PIN", confirmPin),
                  const SizedBox(height: 20),
                  Center(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            AppColors.khakiLight,
                            AppColors.primary,
                            AppColors.secondary
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: () {
                          if (oldPin.text.isEmpty || newPin.text.isEmpty || confirmPin.text.isEmpty) {
                            CustomSnackBar.show(
                              title: "Error",
                              message: "All fields are required!",
                              icon: Icons.close,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              iconColor: Colors.white,
                            );




                          } else if (newPin.text.length != 6 || confirmPin.text.length != 6 || oldPin.text.length != 6) {
                            CustomSnackBar.show(
                              title: "Error",
                              message: "PIN must be exactly 6 digits!",
                              icon: Icons.close,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              iconColor: Colors.white,
                            );


                          } else if (newPin.text != confirmPin.text) {
                            CustomSnackBar.show(
                              title: "Error",
                              message: "New PIN and Confirm PIN do not match!",
                              icon: Icons.close,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              iconColor: Colors.white,
                            );

                          } else {
                            Get.offAll(SplashScreen());
                            CustomSnackBar.show(
                              title: "Success",
                              message: "PIN reset successfully!",
                              icon: Icons.check_circle,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              iconColor: Colors.white,
                            );




                          }
                        },
<<<<<<< Updated upstream
<<<<<<< Updated upstream

                        child: const Text("RESET PIN",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.white)),
=======
=======
>>>>>>> Stashed changes
                        child: const Text(
                          "RESET PIN",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        ),
>>>>>>> Stashed changes
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),

        ],
      ),
      isScrollControlled: true,
    );
  }

<<<<<<< Updated upstream
<<<<<<< Updated upstream
  // 🔹 Helper Widgets
  static Widget _buildDetailRowWithIcon(IconData icon, String title, String value) {
=======
=======
>>>>>>> Stashed changes
  static Widget _buildDetailRowWithIcon(
      IconData icon,
      String title,
      String value,
      ) {
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              "$title: $value",
              style: const TextStyle(fontSize: 16, color: AppColors.black, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _pinField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      obscureText: true,
      style: const TextStyle(color: AppColors.black),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: AppColors.black),
        filled: true,
        fillColor: AppColors.white,
        prefixIcon: const Icon(Icons.lock, color: AppColors.primary),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
