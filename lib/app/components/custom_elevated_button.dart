import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pomo/core/styles/app_sizes.dart';
import 'package:pomo/core/styles/teststyle.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.controller,
    this.formKeySignin,
    required this.onPressed,
    required this.text,
    this.width,
    this.borderRadius,
    this.height,
  });

  final GetxController controller;
  final GlobalKey<FormState>? formKeySignin;
  final String text;
  final void Function()? onPressed;
  final double? width;
  final double? height;
  final double? borderRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height ?? 45.sp,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(borderRadius ?? AppSizes.border4Xl))),
        onPressed: onPressed,
        child: Text(
          text,
          style: Textstyle.textStyle.copyWith(
            color: Get.theme.colorScheme.onSecondary,
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }
}
