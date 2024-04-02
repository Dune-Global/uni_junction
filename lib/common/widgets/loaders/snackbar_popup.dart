import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TLoaders {
  static void errorSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
  }

  static void successSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
  }

  static void infoSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.blue,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
  }
}
