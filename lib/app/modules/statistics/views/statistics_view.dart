import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pomo/app/components/custom_elevated_button.dart';
import 'package:pomo/app/components/custom_outline_button.dart';
import 'package:pomo/app/components/pomo_logo.dart';
import 'package:pomo/app/components/custom_popup_menu.dart';
import 'package:pomo/app/components/task_tile.dart';
import 'package:pomo/app/modules/statistics/controllers/statistics_controller.dart';
import 'package:pomo/core/global/strings.dart';
import 'package:pomo/core/styles/app_colors.dart';
import 'package:pomo/core/styles/teststyle.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatisticsView extends GetView {
  StatisticsView({
    super.key,
  });
  final List<SalesData> chartData = [
    SalesData(weekday: "Mon", sales: 2000, color: Colors.red),
    SalesData(weekday: "Tue", sales: 3000, color: Colors.green),
    SalesData(weekday: "Wed", sales: 2500, color: Colors.blue),
    SalesData(weekday: "Thu", sales: 3200, color: Colors.orange),
    SalesData(weekday: "Fri", sales: 1000, color: Colors.purple),
    SalesData(weekday: "Sat", sales: 800, color: Colors.deepOrange),
    SalesData(weekday: "Sun", sales: 7500, color: Colors.indigo),
  ];
  final StatisticsController _statController = Get.put(StatisticsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: SingleChildScrollView(
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
                          PomoLogo(),
                          Gap(12.h),
                          Text(
                            Strings.statistics,
                            style: Textstyle.textStyle.copyWith(
                              fontSize: 18.h,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      CustomPopupMenu()
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Your statistics graph",
                      style: Textstyle.textStyle.copyWith(
                        fontSize: 20.h,
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                            width: 1.5.h, color: Get.theme.colorScheme.primary),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "This week",
                            style: Textstyle.textStyle.copyWith(
                              color: Get.theme.colorScheme.primary,
                              fontSize: 14.h,
                            ),
                          ),
                          Icon(
                            Icons.arrow_drop_down_rounded,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  height: 250.h,
                  child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    primaryYAxis: NumericAxis(
                      isVisible: false,
                    ),
                    series: [
                      ColumnSeries<SalesData, String>(
                        enableTooltip: true,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.h),
                          topRight: Radius.circular(25.h),
                        ),
                        pointColorMapper: (SalesData sales, _) => sales.color,
                        dataSource: chartData,
                        xValueMapper: (SalesData sales, _) => sales.weekday,
                        yValueMapper: (SalesData sales, _) => sales.sales,
                      ),
                    ],
                  ),
                ),
                Gap(20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Today, December 14',
                      style: Textstyle.textStyle.copyWith(
                          fontSize: 18.h, fontWeight: FontWeight.w700),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'See All',
                        style: Textstyle.textStyle.copyWith(
                          color: Get.theme.colorScheme.primary,
                          fontSize: 18.h,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
                Gap(20.h),
                for (int i = 0; i < 5; i++)
                  Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: Slidable(
                      endActionPane: ActionPane(
                        motion: StretchMotion(),
                        children: [
                          // delete
                          SlidableAction(
                            backgroundColor: Get.theme.colorScheme.outline,
                            onPressed: (context) => _deleteTask(),
                            icon: Iconsax.trash,
                            foregroundColor: Get.theme.colorScheme.primary,
                            borderRadius: BorderRadius.circular(20.h),
                          ),

                          // update
                          SlidableAction(
                            backgroundColor: AppColors.greenColor,
                            onPressed: (context) {},
                            icon: Icons.sync,
                            foregroundColor: Get.theme.colorScheme.onSecondary,
                            borderRadius: BorderRadius.circular(20.h),
                          ),
                        ],
                      ),
                      child: TaskTile(
                        suffixIcon: SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "60 min",
                                style: Textstyle.textStyle
                                    .copyWith(fontSize: 14.h),
                              ),
                              Text(
                                "09:00 - 10:00",
                                style: Textstyle.textStyle.copyWith(
                                    color: Colors.grey, fontSize: 14.h),
                              ),
                            ],
                          ),
                        ),
                        prefixIcon: Icon(Icons.book),
                        title: "Learn UI/UX design",
                        subtitle: "Design",
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _deleteTask() {
    showModalBottomSheet(
      context: Get.overlayContext!,
      builder: (context) => Container(
        width: double.maxFinite,
        height: Get.height / 2.5,
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Column(
          children: [
            Container(
              height: 5,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade400,
              ),
            ),
            Gap(40.h),
            Text(
              "Are you sure you want to delete this task?",
              style: Textstyle.textStyle
                  .copyWith(fontSize: 20.h, color: AppColors.accent),
            ),
            Gap(24.h),
            Divider(
              color: Colors.grey.shade300,
            ),
            Gap(24.h),
            TaskTile(
              suffixIcon: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "60 min",
                      style: Textstyle.textStyle.copyWith(fontSize: 16.h),
                    ),
                    Gap(8.h),
                    Text(
                      "09:00 - 10:00",
                      style: Textstyle.textStyle.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              prefixIcon: Icon(Icons.book),
              title: "Learn UI/UX design",
              subtitle: "Design",
            ),
            Gap(24.h),
            Row(
              children: [
                Expanded(
                  child: CustomOutlineButton(
                    borderStyle: BorderStyle.none,
                    height: 45.h,
                    borderRadius: 30,
                    backgroundColor: AppColors.lightAccent,
                    foregroundColor: AppColors.accent,
                    text: "Cancel",
                    onPressed: () {},
                  ),
                ),
                Gap(12.h),
                Expanded(
                  child: CustomElevatedButton(
                    controller: _statController,
                    onPressed: () {},
                    text: "Yes, Delete",
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SalesData {
  final String weekday;
  final double sales;
  final Color color;
  SalesData({required this.weekday, required this.sales, required this.color});
}
