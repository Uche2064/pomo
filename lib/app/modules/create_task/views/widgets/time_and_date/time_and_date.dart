import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:pomo/app/components/custom_text_form_field.dart';
import 'package:pomo/app/modules/create_task/controllers/create_task_controller.dart';
import 'package:pomo/app/modules/create_task/views/widgets/add_task_sections/add_task_sections.dart';
import 'package:pomo/core/global/strings.dart';
import 'package:pomo/core/styles/app_colors.dart';
import 'package:pomo/core/styles/app_sizes.dart';
import 'package:pomo/core/styles/teststyle.dart';
import 'package:pomo/utils/toast_notification.dart';

class TimeAndDate extends StatelessWidget {
  TimeAndDate({super.key, required this.createTaskController});
  final CreateTaskController createTaskController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AddTaskSections(
          sectionTitle: "Date",
          child: Obx(
            () => CustomTextFormField(
              onTap: _showDatePickerDialog,
              readOnly: true,
              controller: createTaskController.dateCtrl,
              hintText: createTaskController.selectedDate.isEmpty
                  ? DateFormat.yMd().format(DateTime.now())
                  : createTaskController.selectedDate.value,
              suffixIcon: Icon(
                Iconsax.calendar,
                size: 20.h,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        Gap(16.h),
        Row(
          children: [
            Expanded(
              flex: 8,
              child: AddTaskSections(
                sectionTitle: "Start time",
                child: Obx(
                  () => CustomTextFormField(
                    onTap: _showTimePickerDialog,
                    readOnly: true,
                    controller: createTaskController.dateCtrl,
                    hintText: createTaskController.selectedDate.isEmpty
                        ? DateFormat.yMd().format(DateTime.now())
                        : createTaskController.selectedDate.value,
                    suffixIcon: Icon(
                      Iconsax.calendar,
                      size: 20.h,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            Gap(12.h),
            Expanded(
              flex: 4,
              child: AddTaskSections(
                sectionTitle: "Min / Session",
                child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade400,
                    ),
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(
                      AppSizes.borderMd,
                    ),
                  ),
                  child: Obx(
                    () => NumberPicker(
                      itemHeight: 52.h,
                      axis: Axis.horizontal,
                      selectedTextStyle: Textstyle.textStyle.copyWith(
                        fontSize: 24.h,
                        fontWeight: FontWeight.bold,
                        color: AppColors.accent,
                      ),
                      textStyle: Textstyle.textStyle.copyWith(
                        fontSize: 20.h,
                        fontWeight: FontWeight.bold,
                      ),
                      value: createTaskController.minPerSessionText.value,
                      minValue: 0,
                      maxValue: 60,
                      step: 5,
                      haptics: true,
                      onChanged: (value) {
                        print(value);
                        createTaskController.minPerSessionText.value = value;
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _showDatePickerDialog() async {
    DateTime? date = await showDatePicker(
      context: Get.overlayContext!,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      currentDate: DateTime.now(),
    );

    if (date != null) {
      createTaskController.selectedDate.value = DateFormat.yMd().format(date);
    }
  }

  void _showTimePickerDialog() async {
    TimeOfDay? time = await showTimePicker(
      context: Get.overlayContext!,
      initialTime: TimeOfDay.now(),
    );
    if (time != null) {
      final now = DateTime.now();
      final selectedTime = DateTime(
        now.year,
        now.month,
        now.day,
        time.hour,
        time.minute,
      );
      if (createTaskController.selectedDate.value ==
          DateFormat.yMd().format(now)) {
        if (selectedTime.isBefore(now)) {
          ToastNotification.errorToastBar(message: Strings.invalidTime);
          return;
        }
      }
      createTaskController.selectedTime.value =
          DateFormat.jm().format(selectedTime);
    }
  }
}
