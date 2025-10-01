import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ControllerPage/PinSetController.dart';
import '../UtilsPage/ColorsPage.dart';
import '../wedgetPage/SnackBarMessage.dart';
import 'PinverifyPage.dart';

// class PinSetupPage extends StatelessWidget {
//   final pinController = TextEditingController();
//   final confirmPinController = TextEditingController();
//
//   PinSetupPage(String? memberId, String deviceToken, {super.key});
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
//             colors: [AppColors.khaki,
//               AppColors.primary, AppColors.secondary],
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
//               children: [
//                 Image.asset(
//                   "Assets/Images/appbar_logo-removebg-preview.png",
//                   width: 80,
//                   height: 80,
//                   fit: BoxFit.cover,
//                 ),
//                 SizedBox(height: 16,),
//                 const Text(
//                   "SET PIN",
//                   style: TextStyle(
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                     color: AppColors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//
//                 TextField(
//                   controller: pinController,
//                   keyboardType: TextInputType.number,
//                   maxLength: 6,
//                   obscureText: true,
//                   style: const TextStyle(color: AppColors.black),
//                   decoration: InputDecoration(
//                     labelText: "Enter 6 Digit PIN",
//                     hint: Text("Enter 6 Digit PIN",style: TextStyle(color: AppColors.grey),),
//                     labelStyle: const TextStyle(color: AppColors.black),
//                     prefixIcon: const Icon(Icons.lock, color: AppColors.primary),
//                     filled: true,
//                     fillColor: AppColors.white,
//
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//
//                 TextField(
//                   controller: confirmPinController,
//                   keyboardType: TextInputType.number,
//                   maxLength: 6,
//                   obscureText: true,
//                   style: const TextStyle(color: AppColors.black),
//                   decoration: InputDecoration(
//                     labelText: "Confirm 6 Digit PIN",
//                     hint: Text("Confirm 6 Digit PIN",style: TextStyle(color: AppColors.grey),),
//
//                     labelStyle: const TextStyle(color: AppColors.black),
//                     prefixIcon: const Icon(Icons.lock, color: AppColors.primary),
//                     filled: true,
//                     fillColor: AppColors.white,
//
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//
//                 Container(
//                   width: size.width * 1,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     gradient: const LinearGradient(
//                       colors: [AppColors.khaki, AppColors.primary, AppColors.secondary],
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                     ),
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: ElevatedButton(
//                     onPressed: () {
//                       if (pinController.text == confirmPinController.text &&
//                           pinController.text.length == 6) {
//                         Get.to(() => PinVerifyPage(pin: pinController.text));
//                       } else {
//
//                         CustomSnackBar.show(
//                           title: "Error",
//                           message: "PIN must be 6 digits & match",
//                           icon: Icons.close,
//                           backgroundColor: Colors.red,
//                           textColor: Colors.white,
//                           iconColor: Colors.white,
//                         );
//
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
//                       "SET PIN",
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: AppColors.white,
//                       ),
//                     ),
//                   ),
//                 ),  const SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Icon(Icons.info,color: AppColors.grey,size: 15,),
//                     SizedBox(width: 6,),
//                     Text('This PIN is used for order confirmation.',style: TextStyle(color: AppColors.grey,fontSize: 13),)
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../UtilsPage/ColorsPage.dart';
import '../wedgetPage/SnackBarMessage.dart';

class PinSetupPage extends StatelessWidget {
  final String memberId;
  final String deviceToken;

  PinSetupPage({required this.memberId, required this.deviceToken, super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final PinController controller = Get.put(
      PinController(memberId: memberId, deviceToken: deviceToken),
    );

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
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
                const SizedBox(height: 16),
                const Text(
                  "SET PIN",
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
                    labelText: "Enter 6 Digit PIN",
                    hintText: "Enter 6 Digit PIN",
                    labelStyle: const TextStyle(color: AppColors.black),
                    prefixIcon: const Icon(Icons.lock, color: AppColors.primary),
                    filled: true,
                    fillColor: AppColors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: controller.confirmPinController,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  obscureText: true,
                  style: const TextStyle(color: AppColors.black),
                  decoration: InputDecoration(
                    labelText: "Confirm 6 Digit PIN",
                    hintText: "Confirm 6 Digit PIN",
                    labelStyle: const TextStyle(color: AppColors.black),
                    prefixIcon: const Icon(Icons.lock, color: AppColors.primary),
                    filled: true,
                    fillColor: AppColors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Obx(() => Container(
                  width: size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        AppColors.khaki,
                        AppColors.primary,
                        AppColors.secondary
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ElevatedButton(
                    onPressed:
                    controller.isLoading.value ? null : controller.setPin,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: controller.isLoading.value
                        ? const  SizedBox(
                      height: 15,
                      width: 15,
                      child: const CircularProgressIndicator(
                        color: AppColors.golden,
                      ),
                    )
                        : const Text(
                      "SET PIN",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                )),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Icon(Icons.info, color: AppColors.grey, size: 15),
                    SizedBox(width: 6),
                    Text(
                      'This PIN is used for order confirmation.',
                      style: TextStyle(color: AppColors.grey, fontSize: 13),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
