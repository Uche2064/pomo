import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pomo/core/styles/teststyle.dart';

class NoTaskContainer extends StatelessWidget {
  const NoTaskContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Icon(
            Iconsax.calendar,
            size: 300,
          ),
          Gap(20.h),
          Text(
            "You have no task today!",
            style: Textstyle.textStyle.copyWith(
              fontSize: 24.h,
              color: Get.theme.colorScheme.primary,
            ),
          ),
          Gap(20.h),
          Text(
            "Click the (+) icon to add a new task",
            style: Textstyle.textStyle.copyWith(
              fontSize: 18.h,
              color: Get.theme.colorScheme.onPrimary,
            ),
          )
        ],
      ),
    );
  }
}
