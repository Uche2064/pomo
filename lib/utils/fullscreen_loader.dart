import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomo/core/styles/app_colors.dart';

class FullScreenLoader {
  static void openLoadingDialog() {
    showDialog(
      barrierDismissible: false,
      context: Get.overlayContext!,
      builder: (_) => PopScope(
        canPop: false,
        child: Center(
          child: CircularProgressIndicator(
            color: AppColors.accent,
          ),
        ),
      ),
    );
  }

  static void stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
