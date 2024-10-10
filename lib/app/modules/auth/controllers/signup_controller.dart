import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  RxString emailText = "".obs;
  RxString passwordText = "".obs;
  RxBool rememberMe = false.obs;
  RxBool isVisible = true.obs;

  bool get isEnabled =>
      emailText.value.isNotEmpty && passwordText.value.isNotEmpty;

  @override
  void onReady() {
    super.onReady();
  }

  void toggleIcon() {
    isVisible.value = !isVisible.value;
  }

  @override
  void onClose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();
    Get.delete<SignupController>();
    super.onClose();
  }
}
