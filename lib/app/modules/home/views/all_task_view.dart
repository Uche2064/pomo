import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:pomo/app/components/custom_page_title.dart';
import 'package:pomo/app/components/task_tile.dart';
import 'package:pomo/core/global/strings.dart';

import '../../../components/custom_popup_menu.dart';

class AllTaskView extends GetView {
  const AllTaskView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: CustomPageTitle(
            title: "${Strings.todaysTasks} (16)",
          ),
          actions: [CustomPopupMenu()],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 16,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 8.h),
                        child: TaskTile(
                          prefixIcon: Icon(Icons.safety_check),
                          subtitle: "safety_check",
                          title: "Task $index",
                          suffixIcon: Icon(Icons.abc),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
