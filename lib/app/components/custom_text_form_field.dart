import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pomo/core/styles/app_sizes.dart';
import 'package:pomo/core/styles/teststyle.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.obscureText,
    this.controller,
    this.onChanged,
    this.validator,
    this.readOnly,
    this.keyboardType,
    this.onTap,
  });

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final bool? obscureText;
  final TextEditingController? controller;
  String? Function(String?)? validator;
  void Function(String)? onChanged;
  void Function()? onTap;
  final bool? readOnly;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      readOnly: readOnly ?? false,
      keyboardType: keyboardType ?? TextInputType.emailAddress,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      onChanged: onChanged,
      style: Textstyle.textStyle.copyWith(fontSize: 18.h),
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Textstyle.textStyle.copyWith(
          color: Colors.grey.shade600,
          fontSize: AppSizes.fsXl,
        ),
        filled: true,
        fillColor: Get.theme.colorScheme.onPrimary.withAlpha(50),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppSizes.borderMd,
          ),
          borderSide: BorderSide(
            color: Get.theme.colorScheme.onPrimary,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppSizes.borderMd,
          ),
          borderSide: BorderSide(
            color: readOnly == null
                ? Get.theme.colorScheme.primary
                : Get.theme.colorScheme.onPrimary,
          ),
        ),
        border: InputBorder.none,
        errorStyle: Textstyle.textStyle.copyWith(
          color: Get.theme.colorScheme.error,
          fontSize: 14.h,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppSizes.borderMd,
          ),
          borderSide: BorderSide(
            color: Get.theme.colorScheme.error,
          ),
        ),
      ),
    );
  }
}
