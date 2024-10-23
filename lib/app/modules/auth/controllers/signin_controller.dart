import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pomo/app/modules/auth/services/auth_services.dart';
import 'package:pomo/app/modules/home/views/home.dart';
import 'package:pomo/utils/fullscreen_loader.dart';
import 'package:pomo/utils/toast_notification.dart';

class SigninController extends GetxController {
  AuthServices _authServices = AuthServices();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  RxString emailText = "".obs;
  RxString passwordText = "".obs;
  RxBool rememberMe = false.obs;
  RxBool isVisible = true.obs;

  void toggleIcon() {
    isVisible.value = !isVisible.value;
  }

  void signinUser() async {
    try {
      FullScreenLoader.openLoadingDialog();
      await _authServices.signInWithEmailAndPassword(
        emailCtrl.value.text,
        passwordCtrl.value.text,
      );
      FullScreenLoader.stopLoading();
      ToastNotification.successToastBar(message: "Welcome back");
      Get.off(() => Home());
    } catch (e) {
      FullScreenLoader.stopLoading();
      ToastNotification.errorToastBar(message: e.toString());
    }
  }

  @override
  void onClose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();
    Get.delete<SigninController>();
    super.onClose();
  }
}
