import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pomo/core/styles/app_colors.dart';
import 'package:pomo/core/styles/teststyle.dart';

class EWalletTile extends StatelessWidget {
  const EWalletTile({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
      margin: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8.h),
        border: Border.all(
          width: 1,
          color: Get.theme.colorScheme.onPrimary,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.purpleColor,
              borderRadius: BorderRadius.circular(100.h),
            ),
            child: Icon(
              Icons.wallet,
              color: AppColors.whiteColor,
              size: 16.h,
            ),
          ),
          Gap(12.h),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Textstyle.textStyle.copyWith(
                    fontSize: 18.h,
                  ),
                ),
                Gap(4.h),
                Text(
                  subtitle,
                  style:
                      Textstyle.textStyle.copyWith(color: Colors.grey.shade500),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
