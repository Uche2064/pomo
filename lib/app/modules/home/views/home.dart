import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pomo/app/modules/create_task/views/create_task_view.dart';

import 'package:pomo/app/modules/home/views/home_view.dart';
import 'package:pomo/app/modules/home/views/profile_view.dart';
import 'package:pomo/app/modules/statistics/views/statistics_view.dart';

import 'package:pomo/app/modules/task/views/task_view.dart';
import 'package:pomo/core/global/strings.dart';

import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({super.key});

  final HomeController _homeController = Get.find();

  List<Widget> body = [
    HomeView(),
    TaskView(),
    StatisticsView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
        onPressed: () => Get.to(() => CreateTaskView()),
        elevation: 0,
        child: Icon(
          Iconsax.add,
          size: 32.h,
          color: Get.theme.colorScheme.onSecondary,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildButtonNavBar(),
      body: Obx(() => body[_homeController.currentIndex.value]),
    );
  }

  Widget _buildButtonNavBar() {
    return Obx(() => BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          currentIndex: _homeController.currentIndex.value,
          onTap: (index) {
            _homeController.currentIndex.value = index;
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(size: 21.h, Iconsax.home),
              label: Strings.home,
            ),
            BottomNavigationBarItem(
              icon: Icon(size: 21.h, Iconsax.task_square),
              label: Strings.tasks,
            ),
            BottomNavigationBarItem(
              icon: Icon(size: 21.h, Icons.analytics_outlined),
              label: Strings.statistics,
            ),
            BottomNavigationBarItem(
              icon: Icon(size: 21.h, Iconsax.profile_circle),
              label: Strings.profile,
            ),
          ],
        ));
  }
}
