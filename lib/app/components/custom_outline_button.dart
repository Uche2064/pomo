import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pomo/core/styles/app_sizes.dart';
import 'package:pomo/core/styles/teststyle.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton(
      {super.key,
      this.icon,
      this.borderStyle,
      required this.text,
      this.foregroundColor,
      this.backgroundColor,
      this.borderColor,
      required this.onPressed,
      this.borderRadius,
      this.width,
      this.height});
  final Widget? icon;
  final String text;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final void Function()? onPressed;
  final double? width;
  final double? height;
  final double? borderRadius;
  final BorderStyle? borderStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 55.h,
      width: width,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(borderRadius ?? AppSizes.borderMd)),
          foregroundColor: foregroundColor,
          side: BorderSide(
              color: borderColor ?? Colors.grey.shade300,
              style: borderStyle ?? BorderStyle.solid,
              width: 1,
              strokeAlign: 1),
          backgroundColor: backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? SizedBox.shrink(),
            Gap(10.h),
            Text(
              text,
              style: Textstyle.textStyle.copyWith(
                  color: foregroundColor ?? Get.theme.colorScheme.onTertiary,
                  fontSize: 16.h),
            ),
          ],
        ),
      ),
    );
  }
}
