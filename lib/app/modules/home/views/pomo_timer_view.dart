import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pomo/app/components/custom_page_title.dart';
import 'package:pomo/app/modules/auth/models/task.dart';
import 'package:pomo/app/modules/home/controllers/home_controller.dart';
import 'package:pomo/app/components/custom_popup_menu.dart';
import 'package:pomo/app/components/task_tile.dart';
import 'package:pomo/core/global/strings.dart';
import 'package:pomo/core/styles/app_colors.dart';
import 'package:pomo/core/styles/teststyle.dart';

class PomoTimerView extends GetView {
  PomoTimerView({required this.task, super.key});
  final RxBool _isTimerRunning = false.obs;
  final RxBool _isPaused = false.obs;
  final HomeController _homeController = Get.find();
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomPageTitle(title: Strings.pomoTimer),
        actions: [
          InkWell(
            borderRadius: BorderRadius.circular(100.h),
            onTap: () {},
            child: CustomPopupMenu(),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Obx(
              () => Column(
                children: [
                  TaskTile(
                    onTap: () {},
                    prefixIcon: Icon(Icons.design_services),
                    subtitle: "120 minuts",
                    title: task.title!,
                    suffixIcon: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          task.workSessions.toString(),
                          style: Textstyle.textStyle.copyWith(fontSize: 18.h),
                        ),
                        Text(
                          "30 minutes",
                          style: Textstyle.textStyle.copyWith(
                              fontSize: 16.h,
                              color: Get.theme.colorScheme.onPrimary),
                        ),
                      ],
                    ),
                  ),
                  Gap(50.h),
                  SizedBox(
                    child: CircularPercentIndicator(
                      lineWidth: 15,
                      circularStrokeCap: CircularStrokeCap.round,
                      radius: 140,
                      percent: 1,
                      center: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${_homeController.minutes.value.toString().padLeft(2, "0")}:${_homeController.second.value.toString().padLeft(2, "0")}",
                            style: Textstyle.textStyle.copyWith(
                                fontSize: 50.h, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "2 of ${task.workSessions} session",
                            style: Textstyle.textStyle.copyWith(
                                fontSize: 20.h,
                                color: Get.theme.colorScheme.onPrimary),
                          )
                        ],
                      ),
                    ),
                  ),
                  Gap(20.h),
                  if (!_isTimerRunning.value)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: _startTimer,
                          icon: Icon(
                            Icons.play_circle,
                            size: 70.h,
                            color: AppColors.greenColor,
                          ),
                        ),
                      ],
                    ),
                  Gap(16.h),
                  if (_isTimerRunning.value)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(50.h),
                          onTap: () {},
                          child: Icon(
                            Icons.replay_circle_filled,
                            size: 40.h,
                            color: Get.theme.colorScheme.onPrimary,
                          ),
                        ),
                        Gap(16.h),
                        if (!_isPaused.value)
                          InkWell(
                            borderRadius: BorderRadius.circular(50.h),
                            onTap: _pauseTimer,
                            child: Icon(
                              Icons.pause_circle_filled,
                              color: Get.theme.colorScheme.primary,
                              size: 70.h,
                            ),
                          ),
                        if (_isPaused.value)
                          InkWell(
                            borderRadius: BorderRadius.circular(50.h),
                            onTap: _resumeTime,
                            child: Icon(
                              Icons.play_circle,
                              color: AppColors.greenColor,
                              size: 70.h,
                            ),
                          ),
                        Gap(16.h),
                        InkWell(
                          borderRadius: BorderRadius.circular(50.h),
                          onTap: _stopTimer,
                          child: Icon(
                            Icons.stop_circle,
                            size: 40.h,
                            color: Get.theme.colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  Text(
                    "Stay focused for 30 min",
                    style: Textstyle.textStyle.copyWith(fontSize: 18.h),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _startTimer() {
    _isTimerRunning.value = !_isTimerRunning.value;
    // _homeController.startTimer();
  }

  void _pauseTimer() {
    _isPaused.value = true;
    // _homeController.pauseTimer();
  }

  void _resumeTime() {
    _isPaused.value = false;
  }

  void _stopTimer() {
    // _homeController.resetTimer();
  }
}
