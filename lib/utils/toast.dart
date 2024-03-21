import 'package:flutter/material.dart';

class Toast {
  static void showToast(
      {required BuildContext context, required String message}) {
    var snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(
        seconds: 3,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
