import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pomo/app/modules/auth/models/task.dart';
import 'package:pomo/app/modules/auth/services/app_services.dart';
import 'package:pomo/app/modules/home/controllers/home_controller.dart';
import 'package:pomo/core/constant/image_strings.dart';
import 'package:pomo/core/global/strings.dart';
import 'package:pomo/core/styles/app_colors.dart';
import 'package:pomo/core/styles/app_sizes.dart';
import 'package:pomo/core/styles/teststyle.dart';

import 'all_task_view.dart';
import 'notification_view.dart';
import 'pomo_timer_view.dart';
import 'widgets/home_view_hero.dart';
import '../../../components/task_tile.dart';

class HomeView extends StatelessWidget {
  HomeView({
    super.key,
  });
  final HomeController _homeController = Get.find();
  final AppServices _appServices = AppServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: StreamBuilder<List<Task>>(
                stream: _appServices
                    .getTasksByUser(FirebaseAuth.instance.currentUser!.uid),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final tasks = snapshot.data;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Fixed non-scrollable header
                      _buildCustomAppBar(),
                      if (tasks!.isEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                "No task yet. Click the (+) icon to add a new task",
                                style: Textstyle.textStyle
                                    .copyWith(fontSize: 18.h),
                              ),
                            ),
                          ],
                        ),

                      if (tasks.isNotEmpty)
                        // Scrollable content
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      Strings.morning,
                                      style: Textstyle.textStyle.copyWith(
                                          fontSize: AppSizes.fs6Xl - 4.h),
                                    ),
                                    Gap(8.h),
                                    Obx(() => _homeController
                                                .currentUser.value?.nickName ==
                                            null
                                        ? CircularProgressIndicator()
                                        : Text(
                                            _homeController.currentUser.value!
                                                    .nickName!.isEmpty
                                                ? _homeController
                                                    .extractUsername(
                                                        _homeController
                                                            .currentUser
                                                            .value!
                                                            .email!)
                                                : _homeController.currentUser
                                                    .value!.nickName!,
                                            style: Textstyle.textStyle.copyWith(
                                                fontSize: AppSizes.fs6Xl - 4.h),
                                          )),
                                    Gap(4.h),
                                  ],
                                ),
                                Gap(20.h),
                                HomeHero(
                                  completedCount:
                                      _homeController.completedTasks.length,
                                  notCompletedCount:
                                      _homeController.tasksList.length,
                                  percent: 0.75,
                                ),
                                Gap(36.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${Strings.todaysTasks} (16)",
                                      style: Textstyle.textStyle.copyWith(
                                          fontSize: 18.h,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    InkWell(
                                      onTap: () => Get.to(() => AllTaskView()),
                                      child: Text(
                                        Strings.seeAll,
                                        style: Textstyle.textStyle.copyWith(
                                          color: Get.theme.colorScheme.primary,
                                          fontSize: 16.h,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Gap(20.h),
                                // ListView inside a scrollable Column
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: tasks!.length,
                                  itemBuilder: (context, index) {
                                    final task = tasks[index];
                                    final int duration = task.longBreaks! +
                                        task.shortBreaks! +
                                        task.workSessions! * 30;
                                    return InkWell(
                                      onTap: () {
                                        Get.to(
                                          () => PomoTimerView(task: task),
                                        );
                                        printInfo(info: index.toString());
                                      },
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8.h),
                                        child: TaskTile(
                                          prefixIcon: Image.asset(
                                            ImageStrings.pomo,
                                            height: 40,
                                          ),
                                          subtitle: "${duration} minutes",
                                          title: task.title!,
                                          suffixIcon: Icon(
                                            Icons.play_circle_filled_outlined,
                                            color: AppColors.greenColor,
                                            size: 36.h,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  );
                })),
      ),
    );
  }

  SizedBox _buildCustomAppBar() {
    return SizedBox(
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
                "Pomo",
                style: Textstyle.textStyle.copyWith(
                  fontSize: 18.h,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () => Get.to(() => NotificationView()),
            child: Icon(Iconsax.notification),
          )
        ],
      ),
    );
  }
}
