// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../ControllerPage/InternetController.dart';
//
// class InternetStatusWidget extends StatelessWidget {
//   final InternetController c = Get.put(InternetController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       if (c.isConnected.value) {
//         return const SizedBox.shrink();
//       } else {
//         return AnimatedContainer(
//           duration: const Duration(milliseconds: 500),
//           curve: Curves.easeInOut,
//           width: double.infinity,
//           padding: const EdgeInsets.all(12),
//           margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
//           decoration: BoxDecoration(
//             color: Colors.redAccent,
//             borderRadius: BorderRadius.circular(15),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.4),
//                 blurRadius: 6,
//                 offset: const Offset(2, 4),
//               ),
//             ],
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: const [
//               Icon(Icons.wifi_off, color: Colors.white),
//               SizedBox(width: 10),
//               Text(
//                 "No Internet Connection",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   letterSpacing: 1,
//                 ),
//               ),
//             ],
//           ),
//         );
//       }
//     });
//   }
// }
