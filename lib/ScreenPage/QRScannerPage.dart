import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../UtilsPage/ColorsPage.dart';
import '../wedgetPage/AppBar.dart';
import 'ManuPage.dart';

// class QrScannerPage extends StatefulWidget {
//   const QrScannerPage({super.key});
//
//   @override
//   State<QrScannerPage> createState() => _QrScannerPageState();
// }
//
// class _QrScannerPageState extends State<QrScannerPage> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   QRViewController? controller;
//   String? scannedCode;
//
//   @override
//   void reassemble() {
//     super.reassemble();
//     if (Platform.isAndroid) {
//       controller?.pauseCamera();
//     }
//     controller?.resumeCamera();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//
//     return Scaffold(
//       appBar: AdvancedAppBar(),
//       body: Stack(
//         children: [
//           QRView(
//             key: qrKey,
//             onQRViewCreated: _onQRViewCreated,
//             overlay: QrScannerOverlayShape(
//               borderColor: AppColors.golden,
//               borderRadius: 15,
//               borderLength: 30,
//               borderWidth: 8,
//               cutOutSize: size.width * 0.75,
//             ),
//           ),
//
//           Positioned(
//             top: 40,
//             left: 16,
//             right: 16,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 CircleAvatar(
//                   backgroundColor: Colors.transparent,
//
//                 ),
//                 const Text(
//                   "Scan Menu",
//                   style: TextStyle(
//                     color: AppColors.golden,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(width: 48),
//               ],
//             ),
//           ),
//
//
//           Positioned(
//             bottom: 100,
//             left: 16,
//             right: 16,
//             child: Container(
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [AppColors.khaki, AppColors.primary, AppColors.secondary],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//                 borderRadius: BorderRadius.circular(16),
//                 boxShadow: [
//                   BoxShadow(
//                     color: AppColors.khaki.withOpacity(0.5),
//                     blurRadius: 8,
//                     offset: const Offset(0, 3),
//                   ),
//                 ],
//               ),
//               child: Center(
//                 child: Text(
//                   scannedCode != null
//                       ? "✅ Scanned! Opening menu..."
//                       : "📷 Align QR code inside the frame",
//                   style: const TextStyle(
//                     color: AppColors.white,
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _onQRViewCreated(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((scanData) {
//       if (scannedCode == null) {
//         setState(() {
//           scannedCode = scanData.code;
//         });
//
//         debugPrint("✅ QR Code Scanned: $scannedCode");
//
//      Get.to(MenuView());
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
// }
//
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import '../UtilsPage/ColorsPage.dart';
import '../wedgetPage/AppBar.dart';
import 'ManuPage.dart';

class QrScannerPage extends StatefulWidget {
  const QrScannerPage({super.key});

  @override
  State<QrScannerPage> createState() => _QrScannerPageState();
}

class _QrScannerPageState extends State<QrScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String? scannedCode;
  bool _hasCameraPermission = false;
  bool _isPermissionChecked = false;
  bool _isNavigating = false;

  @override
  void initState() {
    super.initState();
    _checkCameraPermission();
  }

  Future<void> _checkCameraPermission() async {
    final status = await Permission.camera.status;
    setState(() {
      _hasCameraPermission = status.isGranted;
      _isPermissionChecked = true;
    });

    if (!_hasCameraPermission) {
      await _requestCameraPermission();
    }
  }

  Future<void> _requestCameraPermission() async {
    final status = await Permission.camera.request();
    setState(() {
      _hasCameraPermission = status.isGranted;
    });

    if (!_hasCameraPermission) {
      _showPermissionDeniedDialog();
    }
  }

  void _showPermissionDeniedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Camera Permission Required'),
        content: const Text('This app needs camera access to scan QR codes. '
            'Please enable camera permission in settings.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              openAppSettings();
            },
            child: const Text('Open Settings'),
          ),
        ],
      ),
    );
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    }
    controller?.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AdvancedAppBar(),
      body: _buildBody(size),
    );
  }

  Widget _buildBody(Size size) {
    if (!_isPermissionChecked) {
      return const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.golden),
        ),
      );
    }

    if (!_hasCameraPermission) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.camera_alt_outlined,
              size: 64,
              color: AppColors.golden,
            ),
            const SizedBox(height: 16),
            const Text(
              'Camera Access Denied',
              style: TextStyle(
                color: AppColors.golden,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Please enable camera permission to use QR scanner',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _requestCameraPermission,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.golden,
                foregroundColor: Colors.black,
              ),
              child: const Text('Grant Permission'),
            ),
            TextButton(
              onPressed: openAppSettings,
              child: const Text(
                'Open Settings',
                style: TextStyle(color: AppColors.golden),
              ),
            ),
          ],
        ),
      );
    }

    return Stack(
      children: [
        QRView(
          key: qrKey,
          onQRViewCreated: _onQRViewCreated,
          overlay: QrScannerOverlayShape(
            borderColor: AppColors.golden,
            borderRadius: 15,
            borderLength: 30,
            borderWidth: 8,
            cutOutSize: size.width * 0.75,
          ),
        ),

        Positioned(
          top: 40,
          left: 16,
          right: 16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: AppColors.golden),
                onPressed: () {
                  // Properly dispose camera before going back
                  controller?.dispose();
                  Get.back();
                },
              ),
              const Text(
                "Scan Menu",
                style: TextStyle(
                  color: AppColors.golden,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.flash_on, color: AppColors.golden),
                onPressed: _toggleFlash,
              ),
            ],
          ),
        ),

        Positioned(
          bottom: 100,
          left: 16,
          right: 16,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.khaki, AppColors.primary, AppColors.secondary],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppColors.khaki.withOpacity(0.5),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Center(
              child: Text(
                _isNavigating
                    ? "✅ Opening menu..."
                    : scannedCode != null
                    ? "✅ Scanned! Opening menu..."
                    : "📷 Align QR code inside the frame",
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _toggleFlash() async {
    if (controller != null) {
      try {
        await controller?.toggleFlash();
      } catch (e) {
        debugPrint('Error toggling flash: $e');
      }
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (scannedCode == null && scanData.code != null && !_isNavigating) {
        setState(() {
          scannedCode = scanData.code;
          _isNavigating = true;
        });

        debugPrint("✅ QR Code Scanned: $scannedCode");

        // Stop camera
        controller.pauseCamera();

        // Add a small delay for better UX
        Future.delayed(const Duration(milliseconds: 1000), () {
          // Properly dispose camera before navigation
          controller.dispose();

          // Use GetX recommended syntax
          Get.to(() =>  MenuView());
        });
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}