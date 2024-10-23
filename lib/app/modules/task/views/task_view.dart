import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pomo/app/modules/task/views/widgets/pomo_task_tile_display.dart';
import 'package:pomo/core/constant/image_strings.dart';
import 'package:pomo/core/styles/app_colors.dart';
import 'package:pomo/core/styles/teststyle.dart';

import 'widgets/horizontal_calendar.dart';

class TaskView extends GetView {
  const TaskView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Fixed non-scrollable header
              SizedBox(
                height: 80.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          ImageStrings.pomo,
                          height: 30.h,
                        ),
                        Gap(12.h),
                        Text(
                          "Pomodoro Task",
                          style: Textstyle.textStyle.copyWith(
                            fontSize: 18.h,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {},
                      child: Icon(Iconsax.search_normal),
                    ),
                  ],
                ),
              ),
              HorizontalCalendar(),
              Gap(20.h),

              // NoTaskContainer(),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    PomoTaskTileDisplay(
                      containerColor: Get.theme.colorScheme.primary,
                      endHour: "11:00 AM",
                      startHour: "09:00 AM",
                      title: "Learn UI/UX Design",
                    ),
                    PomoTaskTileDisplay(
                      containerColor: AppColors.purpleColor,
                      endHour: "15:00 PM",
                      startHour: "12:00 PM",
                      title: "Do something else",
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.stop_circle_rounded,
                              color: Get.theme.colorScheme.primary,
                            )),
                        Expanded(
                          flex: 11,
                          child: Divider(
                            color: Get.theme.colorScheme.primary,
                            thickness: 5,
                          ),
                        ),
                      ],
                    ),
                    PomoTaskTileDisplay(
                      containerColor: AppColors.blueColor,
                      endHour: "07:45 PM",
                      startHour: "08:45 PM",
                      title: "Take a nap",
                    ),
                    PomoTaskTileDisplay(
                      containerColor: AppColors.purpleColor,
                      endHour: "09:00 PM",
                      startHour: "10:30 PM",
                      title: "Learn SQL",
                    ),
                    PomoTaskTileDisplay(
                      containerColor: AppColors.orangeColor,
                      endHour: "09:00 PM",
                      startHour: "10:30 PM",
                      title: "Learn SQL",
                    ),
                    PomoTaskTileDisplay(
                      containerColor: AppColors.yellowColor,
                      endHour: "09:00 PM",
                      startHour: "10:30 PM",
                      title: "Learn SQL",
                    ),
                    PomoTaskTileDisplay(
                      containerColor: AppColors.accent2,
                      endHour: "09:00 PM",
                      startHour: "10:30 PM",
                      title: "Learn SQL",
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
