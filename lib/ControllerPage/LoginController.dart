import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ScreenPage/PinSetPage.dart';
import '../UtilsPage/ColorsPage.dart';
import '../wedgetPage/SnackBarMessage.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

// class LoginController extends GetxController {
//   var mobileController = TextEditingController();
//   var isLoading = false.obs;
//
//   void sendOTP(BuildContext context) {
//     String mobile = mobileController.text.trim();
//
//     if (mobile.isEmpty || mobile.length != 10 || !RegExp(r'^[0-9]{10}$').hasMatch(mobile)) {
//       CustomSnackBar.show(
//         title: "Error",
//         message: "Please enter a valid 10-digit mobile number!",
//         icon: Icons.close,
//         backgroundColor: AppColors.red,
//         textColor: AppColors.white,
//         iconColor: AppColors.white,
//       );
//
//
//
//       return;
//     }else{
//       CustomSnackBar.show(
//         title: "Success",
//         message: "You have logged in successfully!",
//         icon: Icons.check_circle,
//         backgroundColor: AppColors.primary,
//         textColor: AppColors.white,
//         iconColor: AppColors.white,
//         // durationSeconds: 4, // optional
//       );
//
//     }
//
//
//     isLoading.value = true;
//     Future.delayed(const Duration(seconds: 1), () {
//       isLoading.value = false;
//
//       // open OTP bottom sheet
//       showModalBottomSheet(
//         context: context,
//         isScrollControlled: true,
//         backgroundColor: Colors.transparent,
//         builder: (context) {
//           final TextEditingController otpController = TextEditingController();
//
//           final size = MediaQuery.of(context).size;
//
//           return Padding(
//             padding: EdgeInsets.only(
//               bottom: MediaQuery.of(context).viewInsets.bottom,
//             ),
//             child: Container(
//               padding: const EdgeInsets.all(20),
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(25),
//                   topRight: Radius.circular(25),
//                 ),
//               ),
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Icon(Icons.verified,color: AppColors.primary,size: 35,),SizedBox(width: 8,),
//                              Text(
//                               "VERIFY OTP",
//                               style: TextStyle(
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.bold,
//                                 color: AppColors.black,
//                               ),
//                             ),
//                           ],
//                         ),
//                         IconButton(
//                           icon: const Icon(Icons.close, color: AppColors.red,size: 35,),
//                           onPressed: () => Get.back(),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 50),
//
//                     // OTP Field
//                     SizedBox(
//                       width: size.width * 1,
//                       child: TextField(
//                         controller: otpController,
//                         keyboardType: TextInputType.number,
//                         autofocus: true,
//                         maxLength: 6,
//                         style: const TextStyle(color: AppColors.black),
//                         decoration: InputDecoration(
//                           counterText: "",
//                           labelText: "Enter the OTP sent to your number",
//                           hintText: "Enter the OTP sent to your number",
//                           labelStyle: const TextStyle(color: AppColors.black),
//                           prefixIcon: const Icon(Icons.lock, color: AppColors.primary),
//                           filled: true,
//                           fillColor: AppColors.white,
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 30),
//
//                     // OTP Verify Button
//                     Container(
//                       width: size.width * 1,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         gradient: const LinearGradient(
//                           colors: [AppColors.khaki, AppColors.primary, AppColors.secondary],
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                         ),
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                       child: ElevatedButton(
//                         onPressed: () {
//                           if(otpController.text.isNotEmpty && otpController.text!=null){
//                             CustomSnackBar.show(
//                               title: "Success",
//                               message: "You have verified OTP successfully!",
//                               icon: Icons.check_circle,
//                               backgroundColor: Colors.green,
//                               textColor: Colors.white,
//                               iconColor: Colors.white,
//                               // durationSeconds: 4, // optional
//                             );
//                            Get.back();
//
//                            Get.to(() => PinSetupPage());
//                           }else{
//                             CustomSnackBar.show(
//                               title: "Error",
//                               message: "Please enter a valid 6-digit OTP!",
//                               icon: Icons.close,
//                               backgroundColor: Colors.red,
//                               textColor: Colors.white,
//                               iconColor: Colors.white,
//                             );
//                           }
//
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.transparent,
//                           shadowColor: Colors.transparent,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                         ),
//                         child: const Text(
//                           "VERIFY OTP WITH MOBILE NO.",
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: AppColors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       );
//     });
//   }
//
//   @override
//   void onClose() {
//     mobileController.dispose();
//     super.onClose();
//   }
// }


class LoginController extends GetxController {
  var mobileController = TextEditingController();
  var isLoading = false.obs;

  void sendOTP(BuildContext context) {
    String mobile = mobileController.text.trim();

    if (mobile.isEmpty ||
        mobile.length != 10 ||
        !RegExp(r'^[0-9]{10}$').hasMatch(mobile)) {
      CustomSnackBar.show(
        title: "Error",
        message: "Please enter a valid 10-digit mobile number!",
        icon: Icons.close,
        backgroundColor: AppColors.red,
        textColor: AppColors.white,
        iconColor: AppColors.white,
      );
      return;
    } else {
      CustomSnackBar.show(
        title: "Success",
        message: "You have logged in successfully!",
        icon: Icons.check_circle,
        backgroundColor: AppColors.primary,
        textColor: AppColors.white,
        iconColor: AppColors.white,
      );
    }

    isLoading.value = true;
    Future.delayed(const Duration(seconds: 1), () {
      isLoading.value = false;

      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          final TextEditingController otpController = TextEditingController();
          final size = MediaQuery.of(context).size;

          // ✅ Auto-fill static OTP after 1 second
          Future.delayed(const Duration(seconds: 1), () {
            otpController.text = "583496"; // static OTP
          });

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
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.verified,
                              color: AppColors.primary,
                              size: 35,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "VERIFY OTP",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.close,
                            color: AppColors.red,
                            size: 35,
                          ),
                          onPressed: () => Get.back(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),

                    SizedBox(
                      width: size.width * 1,
                      child: PinCodeTextField(
                        appContext: context,
                        length: 6,
                        controller: otpController,
                        autoFocus: true,
                        keyboardType: TextInputType.number,
                        enablePinAutofill: true,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(8),
                          fieldHeight: 50,
                          fieldWidth: 40,
                          activeFillColor: Colors.white,
                          inactiveFillColor: Colors.white,
                          selectedFillColor: Colors.white,
                          inactiveColor: Colors.grey,
                          activeColor: AppColors.primary,
                          selectedColor: AppColors.secondary,
                        ),
                        onCompleted: (value) {
                          otpController.text = value ?? '';
                        },
                        onChanged: (value) {},
                      ),
                    ),
                    const SizedBox(height: 30),

                    // OTP Verify Button
                    Container(
                      width: size.width * 1,
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
                        onPressed: () {
                          String otp = otpController.text.trim();

                          if (otp.length == 6) {
                            CustomSnackBar.show(
                              title: "Success",
                              message: "You have verified OTP successfully!",
                              icon: Icons.check_circle,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              iconColor: Colors.white,
                            );
                            Get.back();
                            Get.to(() => PinSetupPage());
                          } else {
                            CustomSnackBar.show(
                              title: "Error",
                              message: "Please enter a valid 6-digit OTP!",
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
                        child: const Text(
                          "VERIFY OTP WITH MOBILE NO.",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        },
      );
    });
  }

  @override
  void onClose() {
    mobileController.dispose();
    super.onClose();
  }
}
