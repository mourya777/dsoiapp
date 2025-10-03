import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ControllerPage/PinVerifyController.dart';
import '../UtilsPage/ColorsPage.dart';
import '../wedgetPage/GlobleList.dart';
import '../wedgetPage/SnackBarMessage.dart';
import 'buttombarPage.dart';
import 'PinSetPage.dart';

// class PinVerifyPage extends StatelessWidget {
//   final String pin;
//   final verifyPinController = TextEditingController();
//
//   PinVerifyPage({super.key, required this.pin});
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: const LinearGradient(
//             colors: [AppColors.khaki, AppColors.primary, AppColors.secondary],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Center(
//           child: Container(
//             margin: const EdgeInsets.symmetric(horizontal: 25),
//             padding: const EdgeInsets.all(25),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(25),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.3),
//                   blurRadius: 12,
//                   offset: const Offset(0, 6),
//                 ),
//               ],
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//
//               children: [
//                 Image.asset(
//                   "Assets/Images/appbar_logo-removebg-preview.png",
//                   width: 80,
//                   height: 80,
//                   fit: BoxFit.cover,
//                 ),
//                 SizedBox(height: 14),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       "ENTER DSOI PIN",
//                       style: TextStyle(
//                         fontSize: 28,
//                         fontWeight: FontWeight.bold,
//                         color: AppColors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//
//                 TextField(
//                   controller: verifyPinController,
//                   keyboardType: TextInputType.number,
//                   maxLength: 6,
//                   obscureText: true,
//                   style: const TextStyle(color: AppColors.black),
//                   decoration: InputDecoration(
//                     labelText: "Enter DSOI PIN",
//                     hint: Text(
//                       "Enter DSOI PIN",
//                       style: TextStyle(color: AppColors.grey),
//                     ),
//                     labelStyle: const TextStyle(color: AppColors.black),
//                     prefixIcon: const Icon(
//                       Icons.lock,
//                       color: AppColors.primary,
//                     ),
//                     filled: true,
//                     fillColor: AppColors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//
//                 Container(
//                   width: size.width * 0.4,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     gradient: const LinearGradient(
//                       colors: [
//                         AppColors.khaki,
//                         AppColors.primary,
//                         AppColors.secondary,
//                       ],
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                     ),
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: ElevatedButton(
//                     onPressed: () {
//                       if (verifyPinController.text == pin) {
//                         Get.offAll(() => BottomNavPage());
//                       } else {
//                         CustomSnackBar.show(
//                           title: "Error",
//                           message: "Incorrect PIN",
//                           icon: Icons.close,
//                           backgroundColor: Colors.red,
//                           textColor: Colors.white,
//                           iconColor: Colors.white,
//                         );
//
//
//
//                       }
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.transparent,
//                       shadowColor: Colors.transparent,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                     ),
//                     child: const Text(
//                       "VERIFY PIN",
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: AppColors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class PinVerifyPage extends StatefulWidget {
  const PinVerifyPage({super.key});

  @override
  State<PinVerifyPage> createState() => _PinVerifyPageState();
}

class _PinVerifyPageState extends State<PinVerifyPage> {
  final PinVerifyController controller = PinVerifyController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.khaki, AppColors.primary, AppColors.secondary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "Assets/Images/appbar_logo-removebg-preview.png",
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 14),
                const Text(
                  "ENTER DSOI PIN",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: controller.pinController,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  obscureText: true,
                  style: const TextStyle(color: AppColors.black),
                  decoration: InputDecoration(
                    labelText: "Enter DSOI PIN",
                    labelStyle: const TextStyle(color: AppColors.black),
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: AppColors.primary,
                    ),
                    filled: true,
                    fillColor: AppColors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: size.width * 0.4,
                  height: 50,
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
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ElevatedButton(
                    // onPressed: isLoading
                    //     ? null
                    //     : () async {
                    //         setState(() => isLoading = true);
                    //         final result = await controller.verifyPin();
                    //
                    //         setState(() => isLoading = false);
                    //         print('tttttttttttttttttt${result['Status']}');
                    //
                    //         if (result["Status"] == 1) {
                    //           GlobalList.memberData.value =
                    //               result["result"] ?? {};
                    //
                    //           GlobalList.orders.assignAll(
                    //             List<Map<String, dynamic>>.from(
                    //               result["order"] ?? [],
                    //             ),
                    //           );
                    //
                    //           CustomSnackBar.show(
                    //             title: "Success",
                    //             message:
                    //                 result["Msg"] ??
                    //                 "PIN Verified Successfully",
                    //             icon: Icons.check_circle,
                    //             backgroundColor: AppColors.primary,
                    //             textColor: Colors.white,
                    //             iconColor: Colors.white,
                    //           );
                    //           Get.offAll(() => BottomNavPage());
                    //         } else {
                    //           CustomSnackBar.show(
                    //             title: "Error",
                    //             message: result["Msg"] ?? "Incorrect PIN",
                    //             icon: Icons.close,
                    //             backgroundColor: Colors.red,
                    //             textColor: Colors.white,
                    //             iconColor: Colors.white,
                    //           );
                    //         }
                    //       },
                    onPressed: isLoading
                        ? null
                        : () async {
                            setState(() => isLoading = true);
                            final result = await controller.verifyPin();

                            setState(() => isLoading = false);

                            if (result["Status"] == 1) {

                              GlobalList.memberData.value =
                                  (result["result"] as List).isNotEmpty
                                  ? result["result"][0]
                                  : {};

                              GlobalList.orders.assignAll(
                                List<Map<String, dynamic>>.from(
                                  result["order"] ?? [],
                                ),
                              );

                              CustomSnackBar.show(
                                title: "Success",
                                message:
                                    result["Msg"] ??
                                    "PIN Verified Successfully",
                                icon: Icons.check_circle,
                                backgroundColor: AppColors.primary,
                                textColor: Colors.white,
                                iconColor: Colors.white,
                              );

                              Get.offAll(
                                () => BottomNavPage(),
                              ); // ✅ ab navigate karega
                            } else {
                              CustomSnackBar.show(
                                title: "Error",
                                message: result["Msg"] ?? "Incorrect PIN",
                                icon: Icons.close,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                iconColor: Colors.white,
                              );
                            }
                          },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: isLoading
                        ? const SizedBox(
                            height: 15,
                            width: 15,
                            child: CircularProgressIndicator(
                              color: AppColors.golden,
                            ),
                          )
                        : const Text(
                            "VERIFY PIN",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.white,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
