import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Snackbars {
  static void error({
    String title = 'Error!',
    required String message,
  }) {
    Get.snackbar(
      '',
      '',
      titleText: Center(
        child: Text(title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            )),
      ),
      messageText: Center(
        child: Text(
          message,
        ),
      ),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      backgroundColor: Colors.red.withOpacity(0.5),
      colorText: Colors.white,
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
