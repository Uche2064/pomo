import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pomo/core/styles/app_colors.dart';

class ToastNotification {
  static successToastBar({required message}) {
    ElegantNotification.success(
      description: Text(
        message,
        style: Get.textTheme.headlineMedium!
            .copyWith(color: AppColors.whiteColor, fontWeight: FontWeight.bold),
      ),
      animation: AnimationType.fromTop,
      height: 50,
      width: Get.width.r,
      icon: Icon(
        Icons.check_circle_rounded,
        color: AppColors.whiteColor,
      ),
      animationCurve: Curves.bounceIn,
      position: Alignment.topLeft,
      displayCloseButton: false,
      showProgressIndicator: false,
      autoDismiss: true,
      background: AppColors.greenColor,
      isDismissable: true,
    ).show(Get.overlayContext!);
  }

  static errorToastBar({required message}) {
    return ElegantNotification.success(
      description: Text(
        message,
        style: Get.textTheme.headlineMedium!
            .copyWith(color: AppColors.whiteColor, fontWeight: FontWeight.bold),
      ),
      displayCloseButton: false,
      showProgressIndicator: false,
      animation: AnimationType.fromTop,
      height: 50,
      width: Get.width.r - 20.h,
      icon: Icon(
        Icons.cancel,
        color: AppColors.whiteColor,
      ),
      animationCurve: Curves.bounceIn,
      position: Alignment.topLeft,
      autoDismiss: true,
      background: AppColors.redColor,
      isDismissable: true,
    ).show(Get.overlayContext!);
  }

  static infoToastBar({required message}) {
    return ElegantNotification.info(
      description: Text(
        message,
        style: Get.textTheme.headlineMedium!
            .copyWith(color: AppColors.whiteColor, fontWeight: FontWeight.bold),
      ),
      displayCloseButton: false,
      showProgressIndicator: false,
      animation: AnimationType.fromTop,
      height: 50,
      width: Get.width.r,
      icon: Icon(
        Icons.info,
        color: AppColors.whiteColor,
      ),
      animationCurve: Curves.bounceIn,
      position: Alignment.topLeft,
      autoDismiss: true,
      background: AppColors.accent2,
      isDismissable: true,
    ).show(Get.overlayContext!);
  }
}
