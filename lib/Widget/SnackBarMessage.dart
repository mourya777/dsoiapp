import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class CustomSnackBar {
//   static void show({
//     required String title,
//     required String message,
//     IconData icon = Icons.info,         // Default icon
//     Color backgroundColor = Colors.black,
//     Color textColor = Colors.white,
//     Color iconColor = Colors.white,
//     int durationSeconds = 3,            // Auto dismiss time
//     EdgeInsets margin = const EdgeInsets.only(
//       bottom: 60,
//       left: 12,
//       right: 12,
//     ),
//   }) {
//     Get.snackbar(
//       "", "",
//       backgroundColor: backgroundColor,
//       colorText: textColor,
//       snackPosition: SnackPosition.BOTTOM,
//       borderColor: backgroundColor.withOpacity(0.8),
//       borderWidth: 2,
//       margin: margin,
//       duration: Duration(seconds: durationSeconds),
//
//       // 🔹 Title + Icon Row
//       titleText: Row(
//         children: [
//           Icon(icon, color: iconColor, size: 26),
//           const SizedBox(width: 8),
//           Text(
//             title,
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: textColor,
//             ),
//           ),
//         ],
//       ),
//
//       // 🔹 Message Text
//       messageText: Text(
//         message,
//         style: TextStyle(fontSize: 16, color: textColor),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  static void show({
    required String title,
    required String message,
    IconData icon = Icons.info,
    Color backgroundColor = Colors.black,
    Color textColor = Colors.white,
    Color iconColor = Colors.white,
    int durationSeconds = 3,
  }) {
    Get.snackbar(
      "", "",
      backgroundColor: backgroundColor,
      colorText: textColor,
      snackPosition: SnackPosition.BOTTOM,
      borderColor: backgroundColor.withOpacity(0.8),
      borderWidth: 2,
      duration: Duration(seconds: durationSeconds),

      maxWidth: Get.width * 0.33,

      margin: EdgeInsets.only(
        bottom: 60,
        left: Get.width * 0.05,
        right: Get.width * 0.62,
      ),
      titleText: Row(
        children: [
          Icon(icon, color: iconColor, size: 26),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),

      // 🔹 Message Text
      messageText: Text(
        message,
        style: TextStyle(fontSize: 16, color: textColor),
      ),
    );
  }
}
