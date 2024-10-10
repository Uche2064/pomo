import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pomo/core/styles/app_sizes.dart';

class SquareContainerForSocialMedia extends StatelessWidget {
  const SquareContainerForSocialMedia({
    super.key,
    required this.socialMediaIcon,
  });
  final Widget socialMediaIcon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Get.theme.colorScheme.outline,
      borderRadius: BorderRadius.circular(AppSizes.borderMd),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.sp, vertical: 14.sp),
        decoration: BoxDecoration(
          border: Border.all(
            color: Get.theme.colorScheme.onPrimary,
          ),
          borderRadius: BorderRadius.circular(
            AppSizes.borderMd,
          ),
        ),
        child: socialMediaIcon,
      ),
    );
  }
}
