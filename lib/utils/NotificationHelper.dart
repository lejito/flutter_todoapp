import 'package:flutter/material.dart';

class NotificationHelper {
  static void showNotification(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.greenAccent[700],
      ),
    );
  }
}