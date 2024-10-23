import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomo/app/modules/auth/models/task.dart';
import 'package:pomo/app/modules/auth/services/app_services.dart';
import 'package:pomo/app/modules/create_task/models/task_category.dart';
import 'package:pomo/app/modules/home/controllers/home_controller.dart';
import 'package:pomo/core/styles/app_colors.dart';
import 'package:pomo/utils/fullscreen_loader.dart';
import 'package:pomo/utils/toast_notification.dart';

class CreateTaskController extends GetxController {
  final TextEditingController titleCtrl = TextEditingController();
  final TextEditingController dateCtrl = TextEditingController();
  final TextEditingController timeCtrl = TextEditingController();
  final TextEditingController minPerSessionCtrl =
      TextEditingController(text: "10");
  final RxString selectedCategory = "".obs;
  final RxInt workSessionsText = 0.obs;
  final RxInt longBreaksText = 0.obs;
  final RxInt shortBreaksText = 0.obs;

  final RxString selectedDate = "".obs;
  final RxString selectedTime = "".obs;
  final RxInt minPerSessionText = 0.obs;

  final AppServices _appServices = AppServices();
  final HomeController _homeController = Get.find();

  List<TaskCategory> taskCategory = [
    TaskCategory(
      catName: "Reading",
      catIcon: Icon(Icons.menu_book),
      catColor: AppColors.orangeColor,
    ),
    TaskCategory(
      catName: "Technology",
      catIcon: Icon(Icons.public),
      catColor: AppColors.greenColor,
    ),
    TaskCategory(
      catName: "Sport",
      catIcon: Icon(Icons.sports_handball),
      catColor: AppColors.greenColor,
    ),
    TaskCategory(
      catName: "Programming",
      catIcon: Icon(Icons.code_off_rounded),
      catColor: AppColors.blueColor,
    ),
    TaskCategory(
      catName: "Design",
      catIcon: Icon(Icons.brush),
      catColor: AppColors.yellowColor,
    ),
    TaskCategory(
      catName: "Meditation",
      catIcon: Icon(Icons.mediation_outlined),
      catColor: AppColors.redColor,
    ),
  ];
  @override
  void onReady() {
    super.onReady();
  }

  void saveTask() async {
    // Collecting all necessary field values
    final title = titleCtrl.value.text.trim();
    final time = selectedTime.value;
    final date = selectedDate.value;
    final category = selectedCategory.value;

    // Check for missing fields in a single condition
    if ([title, time, date, category].any((field) => field.isEmpty)) {
      ToastNotification.errorToastBar(message: 'Some fields are missing');
      return;
    }

    try {
      Task newTask = Task(
        userId: _homeController.currentUser.value!.uid,
        title: title,
        startTime: time,
        date: date,
        category: category,
        workSessions: workSessionsText.value,
        longBreaks: longBreaksText.value,
        shortBreaks: shortBreaksText.value,
      );
      FullScreenLoader.openLoadingDialog();
      await _appServices.saveTask(newTask);
      FullScreenLoader.stopLoading();
      ToastNotification.successToastBar(message: "Task saved successfully");
      Get.back();
      resetFields();
    } catch (e) {
      FullScreenLoader.stopLoading();
      ToastNotification.errorToastBar(message: e.toString());
    }
  }

  void resetFields() {
    titleCtrl.clear();
    dateCtrl.clear();
    timeCtrl.clear();
    selectedCategory.value = "";
    workSessionsText.value = 0;
    longBreaksText.value = 0;
    shortBreaksText.value = 0;
  }
}
