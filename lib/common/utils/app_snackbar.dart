import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/common/colors/index.dart';

class AppSnackBar {
  static void errorSnackBar({required String title, required String message}) {
    Get.snackbar(title, message,
        backgroundColor: Colors.red, colorText: LightModeColor.whiteColor);
  }

  static void successSnackBar(
      {required String title, required String message}) {
    Get.snackbar(title, message,
        backgroundColor: Colors.green, colorText: LightModeColor.whiteColor);
  }
}
