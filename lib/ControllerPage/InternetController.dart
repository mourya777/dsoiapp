// import 'dart:async';
// import 'package:get/get.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
//
// class InternetController extends GetxController {
//   var isConnected = true.obs;
//   late StreamSubscription subscription;
//
//   @override
//   void onInit() {
//     super.onInit();
//     checkConnection();
//     subscription = Connectivity().onConnectivityChanged.listen((result) async {
//       if (result != ConnectivityResult.none) {
//         isConnected.value = await InternetConnectionChecker().hasConnection;
//       } else {
//         isConnected.value = false;
//       }
//     });
//   }
//
//   void checkConnection() async {
//     isConnected.value = await InternetConnectionChecker().hasConnection;
//   }
//
//   @override
//   void onClose() {
//     subscription.cancel();
//     super.onClose();
//   }
// }
