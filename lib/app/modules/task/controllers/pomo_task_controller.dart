import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PomoTaskController extends GetxController {
  Rx<DateTime> selectedDate = DateTime.now().obs;
  ScrollController scrollController = ScrollController();
  Rx<int> selectedIndex = 0.obs;
  RxDouble itemWidth = 40.0.obs;
  void scrollToSelectedDate(int index) {
    printInfo(info: selectedIndex.value.toString());
    final targetOffset = index * itemWidth.value;

    scrollController.animateTo(targetOffset,
        duration: Duration(milliseconds: 600), curve: Curves.easeIn);
  }

  int getDaysInMonth(int year, int month) {
    return DateTime(year, month + 1, 0).day;
  }

  List<DateTime> getNextDays() {
    return List.generate(
      getDaysInMonth(selectedDate.value.year, selectedDate.value.month),
      (index) => DateTime.now().add(Duration(days: index)),
    );
  }

  String monthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return months[month - 1];
  }

  String dayName(int day) {
    const days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    return days[day - 1];
  }

  void showCalendar() async {
    // Show the calendar widget
    DateTime? date = await showDatePicker(
        context: Get.overlayContext!,
        firstDate: DateTime.now(),
        lastDate: DateTime(2100));
    selectedDate.value = date!;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
