import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewPasswordController extends GetxController {


  TextEditingController confirmNewPasswordCtrl = TextEditingController();
  TextEditingController newPasswordCtrl = TextEditingController();
  RxString confirmNewPasswordText = "".obs;
  RxString newPasswordText = "".obs;
  final count = 0.obs;
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
    super.onClose();
  }

  void increment() => count.value++;
}
