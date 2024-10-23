import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pomo/core/styles/teststyle.dart';

class AccountAccessor extends StatelessWidget {
  const AccountAccessor({
    super.key,
    required this.leftText,
    required this.rightText,
    this.onTap,
  });
  final String leftText;
  final String rightText;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          leftText,
          style: Textstyle.textStyle.copyWith(
            fontSize: 16.h,
            color: Get.theme.colorScheme.onTertiary.withAlpha(150),
          ),
        ),
        Gap(8.h),
        InkWell(
          onTap: onTap,
          child: Text(
            rightText,
            style: Textstyle.textStyle.copyWith(
              color: Get.theme.colorScheme.primary,
              fontSize: 16.h,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
