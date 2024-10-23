import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pomo/app/modules/create_task/controllers/create_task_controller.dart';
import 'package:pomo/core/global/strings.dart';
import 'package:pomo/core/styles/app_sizes.dart';
import 'package:pomo/core/styles/teststyle.dart';

class TaskCategorySelector extends StatelessWidget {
  TaskCategorySelector({
    super.key,
    required RxString selectedCategory,
  }) : _selectedCategory = selectedCategory;

  final RxString _selectedCategory;
  final CreateTaskController _createTaskController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownMenu(
        expandedInsets: EdgeInsets.all(8),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Get.theme.colorScheme.onPrimary.withAlpha(50),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizes.borderMd),
            borderSide: BorderSide(
              color: Get.theme.colorScheme.onPrimary,
            ),
          ),
        ),
        onSelected: (value) {
          _selectedCategory.value = value!;
        },
        width: double.maxFinite,
        enableFilter: true,
        hintText: Strings.category,
        textStyle: Textstyle.textStyle,
        menuStyle: MenuStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSizes.borderMd),
            ),
          ),
        ),
        dropdownMenuEntries: List.generate(
          _createTaskController.taskCategory.length,
          (index) {
            return DropdownMenuEntry(
              value: _createTaskController.taskCategory[index].catName,
              label: _createTaskController.taskCategory[index].catName,
              labelWidget: Container(
                decoration: BoxDecoration(
                    color: _createTaskController.taskCategory[index].catColor),
                height: 20.h,
                width: 20.h,
              ),
            );
          },
        ),
      ),
    );
  }
}
