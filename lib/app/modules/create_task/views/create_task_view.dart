import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:pomo/app/components/custom_elevated_button.dart';
import 'package:pomo/app/components/custom_page_title.dart';
import 'package:pomo/app/components/custom_text_form_field.dart';
import 'package:pomo/app/modules/create_task/controllers/create_task_controller.dart';
import 'package:pomo/app/modules/create_task/views/widgets/add_task_sections/add_task_sections.dart';
import 'package:pomo/app/modules/create_task/views/widgets/custom_slider/custom_slider.dart';
import 'package:pomo/app/modules/create_task/views/widgets/task_category_selector/task_category_selector.dart';
import 'package:pomo/app/modules/create_task/views/widgets/time_and_date/time_and_date.dart';
import 'package:pomo/core/global/strings.dart';
import 'package:pomo/core/styles/app_colors.dart';
import 'package:pomo/core/styles/app_sizes.dart';
import 'package:pomo/core/styles/teststyle.dart';
import 'package:pomo/utils/validators.dart';

class CreateTaskView extends GetView {
  CreateTaskView({super.key});

  final CreateTaskController _createTaskController =
      Get.put(CreateTaskController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomPageTitle(title: Strings.createNewTask),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AddTaskSections(
                    sectionTitle: Strings.title,
                    child: CustomTextFormField(
                      hintText: Strings.taskTitle,
                      controller: _createTaskController.titleCtrl,
                      validator: (title) => Validators.validateField(title),
                    ),
                  ),
                  Gap(16.h),
                  AddTaskSections(
                    child: TimeAndDate(
                      createTaskController: _createTaskController,
                    ),
                  ),
                  Gap(20.h),
                  Row(children: [
                    Expanded(
                      flex: 9,
                      child: AddTaskSections(
                        sectionTitle: Strings.selectCategory,
                        child: TaskCategorySelector(
                          selectedCategory:
                              _createTaskController.selectedCategory,
                        ),
                      ),
                    ),
                    Gap(4.h),
                    Expanded(
                      flex: 3,
                      child: AddTaskSections(
                        sectionTitle: "Add category",
                        child: AddCategory(),
                      ),
                    )
                  ]),
                  Gap(20.h),
                  AddTaskSections(
                    sectionTitle: Strings.workSessions,
                    child: Obx(
                      () => CustomSlider(
                        value: _createTaskController.workSessionsText.value,
                        max: 8,
                        min: 0,
                        onChanged: (value) {
                          _createTaskController.workSessionsText.value =
                              value.floor();
                        },
                      ),
                    ),
                  ),
                  Gap(20.h),
                  AddTaskSections(
                    sectionTitle: Strings.longBreaks,
                    child: Obx(
                      () => CustomSlider(
                        value: _createTaskController.longBreaksText.value,
                        max: 30,
                        min: 0,
                        onChanged: (value) {
                          _createTaskController.longBreaksText.value =
                              value.floor();
                        },
                      ),
                    ),
                  ),
                  Gap(10.h),
                  AddTaskSections(
                    sectionTitle: Strings.shortBreaks,
                    child: Obx(
                      () => CustomSlider(
                        value: _createTaskController.shortBreaksText.value,
                        max: 10,
                        min: 0,
                        onChanged: (value) {
                          _createTaskController.shortBreaksText.value =
                              value.floor();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding _buildBottomNavBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.h),
      child: CustomElevatedButton(
        controller: _createTaskController,
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _createTaskController.saveTask();
          }
        },
        text: Strings.createNewTask,
      ),
    );
  }
}

class AddCategory extends StatelessWidget {
  const AddCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: _addCategory,
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.borderMd),
            border: Border.all(
              color: Get.theme.colorScheme.onPrimary,
            ),
          ),
          child: Text(
            "Tap to add",
            style: Textstyle.textStyle.copyWith(fontSize: 14.h),
          ),
        ),
      ),
    );
  }

  void _addCategory() {
    showModalBottomSheet(
        context: Get.overlayContext!,
        builder: (context) {
          return AddCategoryBottomSheet();
        });
  }
}

class AddCategoryBottomSheet extends StatelessWidget {
  const AddCategoryBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: Get.height / 2.5,
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add category',
            style: Textstyle.textStyle.copyWith(
              fontSize: 18.h,
              color: AppColors.accent,
            ),
          ),
          Gap(24.h),
          AddTaskSections(
            sectionTitle: "Name",
            child: CustomTextFormField(
              hintText: "Category name",
              validator: (name) => Validators.validateField(name),
            ),
          ),
          Gap(16.h),
          AddTaskSections(
            sectionTitle: "Thumbnail",
            child: CustomElevatedButton(
              backgroundColor: Colors.grey.shade400,
              borderRadius: AppSizes.borderMd,
              onPressed: () {},
              text: "Click to pick an image",
            ),
          ),
          Gap(32.h),
          Align(
            alignment: Alignment.center,
            child: CustomElevatedButton(
              width: Get.width / 2.5,
              onPressed: () {},
              text: "Save",
            ),
          )
        ],
      ),
    );
  }
}
