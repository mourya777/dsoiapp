// import 'dart:io';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';
// import '../ScreenPage/LoginPage.dart';
//
// class RegisterController extends GetxController {
//   var name = ''.obs;
//   var memberId = ''.obs;
//   var mobileNo = ''.obs;
//   var password = ''.obs;
//   var branch = ''.obs;
//
//   // Loading state
//   var isLoading = false.obs;
//
//   // Profile Image
//   var imageFile = Rxn<File>();
//   final ImagePicker _picker = ImagePicker();
//
//   Future<void> pickImage() async {
//     PermissionStatus status;
//
//     if (Platform.isAndroid) {
//       status = await Permission.storage.request();
//     } else {
//       status = await Permission.photos.request();
//     }
//
//     if (status.isGranted) {
//       final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//       if (pickedFile != null) {
//         imageFile.value = File(pickedFile.path);
//       }
//     } else if (status.isDenied) {
//       Get.snackbar("Permission Denied", "Gallery access is required to pick an image");
//     } else if (status.isPermanentlyDenied) {
//       Get.snackbar("Permission Required", "Please enable gallery permission from settings");
//       await openAppSettings();
//     }
//   }
//
//   Future<void> register() async {
//     if (name.value.isNotEmpty &&
//         memberId.value.isNotEmpty &&
//         mobileNo.value.isNotEmpty &&
//         branch.value.isNotEmpty &&
//         imageFile.value != null &&
//         password.value.isNotEmpty) {
//       isLoading.value = true;
//
//       // simulate API call
//       await Future.delayed(const Duration(seconds: 2));
//
//       isLoading.value = false;
//       Get.snackbar("Success", "Registration Successful");
//       Get.offAll(LoginView());
//     } else {
//       Get.snackbar("Error", "Please fill all fields and upload image");
//     }
//   }
// }
