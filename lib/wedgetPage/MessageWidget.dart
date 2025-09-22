import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

class AppAlert {
  static Future<void> success(
      BuildContext context, {
        required String text,
        String title = "Success",
      }) async {
    _showAlert(
      context,
      type: QuickAlertType.success,
      title: title,
      text: text,
    );
  }

  // 🔹 Error Alert
  static Future<void> error(
      BuildContext context, {
        required String text,
        String title = "Error",
      }) async {
    _showAlert(
      context,
      type: QuickAlertType.error,
      title: title,
      text: text,
    );
  }

  // 🔹 Warning Alert
  static Future<void> warning(
      BuildContext context, {
        required String text,
        String title = "Warning",
      }) async {
    _showAlert(
      context,
      type: QuickAlertType.warning,
      title: title,
      text: text,
    );
  }

  // 🔹 Private method to show and auto dismiss after 2 sec
  static Future<void> _showAlert(
      BuildContext context, {
        required QuickAlertType type,
        required String title,
        required String text,
      }) async {
    QuickAlert.show(
      context: context,
      type: type,
      title: title,
      text: text,
      barrierDismissible: false,
    );

    // Auto dismiss after 2 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      }
    });
  }
}
