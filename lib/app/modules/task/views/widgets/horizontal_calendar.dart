import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pomo/app/modules/task/controllers/pomo_task_controller.dart';
import 'package:pomo/core/styles/teststyle.dart';

// ignore: must_be_immutable
class HorizontalCalendar extends StatelessWidget {
  HorizontalCalendar({Key? key});
  PomoTaskController pomoTaskController = Get.put(PomoTaskController());

  @override
  Widget build(BuildContext context) {
    final days = pomoTaskController.getNextDays();
    return GetX(
      init: pomoTaskController,
      builder: (_) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Month and navigation arrows
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Iconsax.arrow_circle_left),
                    onPressed: () {
                      pomoTaskController.selectedDate.value =
                          pomoTaskController.selectedDate.value.add(
                        Duration(days: -1),
                      );
                    },
                  ),
                  InkWell(
                    onTap: pomoTaskController.showCalendar,
                    child: Text(
                      "${pomoTaskController.monthName(pomoTaskController.selectedDate.value.month)}, ${pomoTaskController.selectedDate.value.year}",
                      style: Textstyle.textStyle.copyWith(fontSize: 18.h),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Iconsax.arrow_circle_right),
                    onPressed: () {
                      pomoTaskController.selectedDate.value =
                          pomoTaskController.selectedDate.value.add(
                        Duration(days: 1),
                      );
                    },
                  ),
                ],
              ),
            ),

            // Horizontal calendar list
            Container(
              height: 60.h,
              child: ListView.builder(
                controller: pomoTaskController.scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: days.length,
                itemBuilder: (context, index) {
                  final day = days[index];
                  final isSelected =
                      day.day == pomoTaskController.selectedDate.value.day;
                  return GestureDetector(
                    onTap: () {
                      pomoTaskController.selectedDate.value = day;
                      pomoTaskController.scrollToSelectedDate(index);
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      width: pomoTaskController.itemWidth.value,
                      margin: EdgeInsets.symmetric(horizontal: 8.h),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Get.theme.colorScheme.primary
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(50.h),
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  blurRadius: 4,
                                  spreadRadius: 1,
                                  offset: Offset(4, 4),
                                ),
                                BoxShadow(
                                  color: Colors.grey.shade50,
                                  blurRadius: 4,
                                  spreadRadius: 1,
                                  offset: Offset(-4, -4),
                                ),
                              ]
                            : [],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            pomoTaskController
                                .dayName(day.weekday)
                                .substring(0, 1), // First letter of weekday
                            style: Textstyle.textStyle.copyWith(
                              fontSize: 14.h,
                              fontWeight: FontWeight.w500,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            day.day.toString(),
                            style: Textstyle.textStyle.copyWith(
                              fontSize: 16.h,
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
