import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pomo/core/global/strings.dart';
import 'package:pomo/core/styles/app_colors.dart';
import 'package:pomo/core/styles/teststyle.dart';

class HomeHero extends StatelessWidget {
  const HomeHero({
    super.key,
    required this.percent,
    required this.completedCount,
    required this.notCompletedCount,
  });
  final double percent;
  final int completedCount, notCompletedCount;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.h),
            color: AppColors.whiteColor,
            boxShadow: [
              BoxShadow(
                spreadRadius: 1,
                color: Colors.grey.shade200,
              ),
            ]),
        child: Row(
          children: [
            Container(
                child: CircularPercentIndicator(
              radius: 50.h,
              lineWidth: 12.h,
              percent: percent,
              animation: true,
              animationDuration: 1000,
              backgroundColor: Get.theme.colorScheme.outline,
              circularStrokeCap: CircularStrokeCap.round,
              center: Text(
                "${(percent * 100).floor()} %", //completedCount / notCompletedCount
                style: Textstyle.textStyle
                    .copyWith(fontSize: 25.h, fontWeight: FontWeight.bold),
              ),
            )),
            Gap(16.h),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.dailyWork,
                    style: Textstyle.textStyle.copyWith(
                      fontSize: 18.h,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Gap(4.h),
                  Text(
                    "${completedCount} ${Strings.of} ${notCompletedCount} ${Strings.completed}",
                    style: Textstyle.textStyle.copyWith(color: Colors.grey),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
