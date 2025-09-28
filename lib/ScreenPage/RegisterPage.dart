// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'dart:io';
// import '../ControllerPage/RegisterController.dart';
// import 'LoginPage.dart';
// import '../UtilsPage/ColorsPage.dart';
//
// class RegisterView extends StatelessWidget {
//   final RegisterController controller = Get.put(RegisterController());
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//
//     return Scaffold(
//       backgroundColor: AppColors.khakiLight,
//       body: Container(
//         width: size.width,
//         height: size.height,
//         color: AppColors.khakiLight,
//         child: Center(
//           child: Container(
//             margin: const EdgeInsets.symmetric(horizontal: 25),
//             decoration: BoxDecoration(
//               gradient: const LinearGradient(
//                 colors: [AppColors.khaki, AppColors.primary, AppColors.secondary],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//               borderRadius: BorderRadius.circular(25),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.3),
//                   blurRadius: 12,
//                   offset: const Offset(0, 6),
//                 ),
//               ],
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(25.0),
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     // 🔹 Profile Image Picker (Logo Replacement)
//                     Obx(() {
//                       return GestureDetector(
//                         onTap: () => controller.pickImage(),
//                         child: Stack(
//                           alignment: Alignment.center,
//                           children: [
//                             Container(
//                               width: 100,
//                               height: 100,
//                               decoration: BoxDecoration(
//                                 color: AppColors.khaki,
//                                 shape: BoxShape.circle,
//                                 border: Border.all(
//                                   color: AppColors.khakiLight,
//                                   width: 3,
//                                 ),
//                               ),
//                               child: ClipOval(
//                                 child: controller.imageFile.value != null
//                                     ? Image.file(
//                                   controller.imageFile.value!,
//                                   fit: BoxFit.cover,
//                                 )
//                                     : Image.asset(
//                                   'Assets/Images/dsoi_logo.png',
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//
//                             // 🔹 Camera Icon Overlay (Bottom Right)
//                             Positioned(
//                               bottom: 5,
//                               right: 5,
//                               child: Container(
//                                 padding: const EdgeInsets.all(4),
//                                 decoration: BoxDecoration(
//                                   color: AppColors.khakiLight,
//                                   shape: BoxShape.circle,
//                                 ),
//                                 child: const Icon(
//                                   Icons.camera_alt,
//                                   size: 20,
//                                   color: AppColors.golden,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     }),
// SizedBox(height: 5,),
//                     const Text(
//                       "Register",
//                       style: TextStyle(
//                         fontSize: 28,
//                         fontWeight: FontWeight.bold,
//                         color: AppColors.golden,
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//
//                     // Full Name
//                     TextField(
//                       style: const TextStyle(color: AppColors.golden),
//                       decoration: InputDecoration(
//                         labelText: "Full Name",
//                         labelStyle: const TextStyle(color: AppColors.khakiLight),
//                         prefixIcon: const Icon(Icons.person, color: AppColors.khakiLight),
//                         filled: true,
//                         fillColor: AppColors.khaki,
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                       onChanged: (val) => controller.name.value = val,
//                     ),
//                     const SizedBox(height: 15),
//
//                     // Member Id
//                     TextField(
//                       style: const TextStyle(color: AppColors.golden),
//                       decoration: InputDecoration(
//                         labelText: "Member Id",
//                         labelStyle: const TextStyle(color: AppColors.khakiLight),
//                         prefixIcon: const Icon(Icons.card_membership, color: AppColors.khakiLight),
//                         filled: true,
//                         fillColor: AppColors.khaki,
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                       onChanged: (val) => controller.memberId.value = val,
//                     ),
//                     const SizedBox(height: 15),
//
//                     // Branch
//                     TextField(
//                       style: const TextStyle(color: AppColors.golden),
//                       decoration: InputDecoration(
//                         labelText: "Branch",
//                         labelStyle: const TextStyle(color: AppColors.khakiLight),
//                         prefixIcon: const Icon(Icons.account_balance, color: AppColors.khakiLight),
//                         filled: true,
//                         fillColor: AppColors.khaki,
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                       onChanged: (val) => controller.branch.value = val,
//                     ),
//                     const SizedBox(height: 15),
//
//                     // Mobile No
//                     TextField(
//                       style: const TextStyle(color: AppColors.golden),
//                       decoration: InputDecoration(
//                         labelText: "Mobile No",
//                         labelStyle: const TextStyle(color: AppColors.khakiLight),
//                         prefixIcon: const Icon(Icons.mobile_friendly, color: AppColors.khakiLight),
//                         filled: true,
//                         fillColor: AppColors.khaki,
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                       onChanged: (val) => controller.mobileNo.value = val,
//                     ),
//                     const SizedBox(height: 15),
//
//                     // Password
//                     TextField(
//                       style: const TextStyle(color: AppColors.golden),
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         labelText: "Password",
//                         labelStyle: const TextStyle(color: AppColors.khakiLight),
//                         prefixIcon: const Icon(Icons.lock, color: AppColors.khakiLight),
//                         filled: true,
//                         fillColor: AppColors.khaki,
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                       onChanged: (val) => controller.password.value = val,
//                     ),
//                     const SizedBox(height: 25),
//
//                     // Register Button with bottom sheet for verification
//                     Container(
//                       width: size.width * 0.6,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         gradient: const LinearGradient(
//                           colors: [AppColors.khaki, AppColors.primary, AppColors.secondary],
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                         ),
//                         borderRadius: BorderRadius.circular(12),
//                         boxShadow: [
//                           BoxShadow(
//                             color: AppColors.khaki.withOpacity(0.6),
//                             offset: const Offset(0, 1),
//                             blurRadius: 6,
//                             spreadRadius: 1,
//                           ),
//                           BoxShadow(
//                             color: AppColors.primary.withOpacity(0.3),
//                             offset: const Offset(0, 1),
//                             blurRadius: 6,
//                             spreadRadius: 0,
//                           ),
//                         ],
//                       ),
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.transparent,
//                           shadowColor: Colors.transparent,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         onPressed: () {
//                           // Open bottom sheet for mobile verification
//                           showModalBottomSheet(
//                             context: context,
//                             isScrollControlled: true,
//                             backgroundColor: Colors.transparent,
//                             builder: (context) {
//                               final TextEditingController mobileController =
//                               TextEditingController(text: controller.mobileNo.value);
//                               return Container(
//                                 padding: EdgeInsets.only(
//                                   top: 20,
//                                   left: 20,
//                                   right: 20,
//                                   bottom: MediaQuery.of(context).viewInsets.bottom + 20,
//                                 ),
//                                 decoration: BoxDecoration(
//                                   gradient: const LinearGradient(
//                                     colors: [AppColors.khaki, AppColors.primary, AppColors.secondary],
//                                     begin: Alignment.topLeft,
//                                     end: Alignment.bottomRight,
//                                   ),
//                                   borderRadius: const BorderRadius.only(
//                                     topLeft: Radius.circular(25),
//                                     topRight: Radius.circular(25),
//                                   ),
//                                 ),
//                                 child: SingleChildScrollView(
//                                   child: Column(
//                                     mainAxisSize: MainAxisSize.min,
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       const Text(
//                                         "Mobile Verification",
//                                         style: TextStyle(
//                                           fontSize: 22,
//                                           fontWeight: FontWeight.bold,
//                                           color: AppColors.golden,
//                                         ),
//                                       ),
//                                       const SizedBox(height: 15),
//                                       TextField(
//                                         controller: mobileController,
//                                         keyboardType: TextInputType.phone,
//                                         style: const TextStyle(color: AppColors.golden),
//                                         decoration: InputDecoration(
//                                           labelText: "Enter Mobile Number",
//                                           labelStyle: const TextStyle(color: AppColors.khakiLight),
//                                           prefixIcon: const Icon(Icons.phone, color: AppColors.khakiLight),
//                                           filled: true,
//                                           fillColor: AppColors.khaki,
//                                           border: OutlineInputBorder(
//                                             borderRadius: BorderRadius.circular(12),
//                                           ),
//                                           focusedBorder: OutlineInputBorder(
//                                             borderRadius: BorderRadius.circular(12),
//                                             borderSide: const BorderSide(
//                                               color: AppColors.khakiLight,
//                                               width: 2,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       const SizedBox(height: 20),
//                                       Center(
//                                         child: Container(
//                                           width: size.width * 0.5,
//                                           height: 50,
//                                           decoration: BoxDecoration(
//                                             gradient: const LinearGradient(
//                                               colors: [AppColors.khaki, AppColors.primary, AppColors.secondary],
//                                               begin: Alignment.topLeft,
//                                               end: Alignment.bottomRight,
//                                             ),
//                                             borderRadius: BorderRadius.circular(12),
//                                             boxShadow: [
//                                               BoxShadow(
//                                                 color: AppColors.khaki.withOpacity(0.6),
//                                                 offset: const Offset(0, 1),
//                                                 blurRadius: 6,
//                                                 spreadRadius: 1,
//                                               ),
//                                               BoxShadow(
//                                                 color: AppColors.primary.withOpacity(0.3),
//                                                 offset: const Offset(0, 1),
//                                                 blurRadius: 6,
//                                                 spreadRadius: 0,
//                                               ),
//                                             ],
//                                           ),
//                                           child: ElevatedButton(
//                                             style: ElevatedButton.styleFrom(
//                                               backgroundColor: Colors.transparent,
//                                               shadowColor: Colors.transparent,
//                                               shape: RoundedRectangleBorder(
//                                                 borderRadius: BorderRadius.circular(12),
//                                               ),
//                                             ),
//                                             onPressed: () {
//                                               // TODO: Handle OTP Verification
//                                               Get.off(LoginView());
//                                               Get.snackbar(
//                                                 "OTP Sent",
//                                                 "Verification sent to ${mobileController.text}",
//                                                 snackPosition: SnackPosition.BOTTOM,
//                                                 backgroundColor: AppColors.khakiLight,
//                                                 colorText: AppColors.golden,
//                                               );
//                                             },
//                                             child: const Text(
//                                               "Verify",
//                                               style: TextStyle(
//                                                 fontSize: 18,
//                                                 fontWeight: FontWeight.bold,
//                                                 color: AppColors.golden,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       const SizedBox(height: 20),
//                                     ],
//                                   ),
//                                 ),
//                               );
//                             },
//                           );
//                         },
//                         child: const Text(
//                           "Register",
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: AppColors.golden,
//                           ),
//                         ),
//                       ),
//                     ),
//
//                     const SizedBox(height: 15),
//
//                     // Already have account? Login
//                     TextButton(
//                       onPressed: () {
//                         Get.to(LoginView());
//                       },
//                       child: const Text(
//                         "Already have an account? Login",
//                         style: TextStyle(
//                           color: AppColors.golden,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
