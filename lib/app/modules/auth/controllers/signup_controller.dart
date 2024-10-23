import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomo/app/modules/auth/controllers/auth_controller.dart';
import 'package:pomo/app/modules/auth/models/user_account.dart';
import 'package:pomo/app/modules/auth/services/auth_services.dart';
import 'package:pomo/app/views/fill_profile_view.dart';
import 'package:pomo/utils/fullscreen_loader.dart';
import 'package:pomo/utils/toast_notification.dart';

class SignupController extends GetxController {
  AuthServices _authServices = AuthServices();
  AuthController _authController = AuthController();
  // GetStorage _storage = GetStorage();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController fullNameCtrl = TextEditingController();
  TextEditingController phoneNumberCtrl = TextEditingController();
  TextEditingController nickNameCtrl = TextEditingController();
  RxString emailText = "".obs;
  RxString passwordText = "".obs;
  RxBool rememberMe = false.obs;
  RxBool isVisible = true.obs;

  bool get isEnabled =>
      emailText.value.isNotEmpty && passwordText.value.isNotEmpty;

  void signUpWithGoogle() async {
    try {
      FullScreenLoader.openLoadingDialog();
      UserCredential? credential = await _authServices.googleSignIn();
      if (credential == null) {
        FullScreenLoader.stopLoading();
        ToastNotification.errorToastBar(
            message: "Failed to sign up with Google");
        return;
      }

      UserAccount newUser = UserAccount(
        email: credential.user!.email!,
        fullName: fullNameCtrl.text,
        phoneNumber: phoneNumberCtrl.text,
        nickName: nickNameCtrl.text,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        image: "",
        uid: credential.user!.uid,
      );
      final result = await _authServices.saveUser(newUser);
      if (result == null) {
        FullScreenLoader.stopLoading();
        ToastNotification.errorToastBar(
            message: "Erreur lors de la création de compte");
        return;
      }
      FullScreenLoader.stopLoading();
      ToastNotification.successToastBar(message: "Account Created Successfuly");
      
    } catch (e) {
      FullScreenLoader.stopLoading();
      ToastNotification.errorToastBar(message: e.toString());
    }
  }

  void signupWithEmailAndPassword() async {
    try {
      FullScreenLoader.openLoadingDialog();
      Future.delayed(Duration(milliseconds: 600)).then((value) {
        Get.to(() => FillProfileView());
      });
    } catch (e) {
      FullScreenLoader.stopLoading();
      ToastNotification.errorToastBar(message: e.toString());
    }
  }

  void saveUserRecord() async {
    try {
      UserAccount newUser = UserAccount(
        email: emailCtrl.text,
        fullName: fullNameCtrl.text,
        phoneNumber: phoneNumberCtrl.text,
        nickName: nickNameCtrl.text,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      FullScreenLoader.openLoadingDialog();
      final result = await _authServices.signupUserWithEmailAndPassword(
          newUser, passwordCtrl.text);
      if (result != null) {
        FullScreenLoader.stopLoading();
        ToastNotification.successToastBar(
            message: "Account created successfully");
        _authController.screenRedirect();
      } else {
        FullScreenLoader.stopLoading();
        ToastNotification.errorToastBar(message: "Failed to create account");
      }
    } catch (e) {
      FullScreenLoader.stopLoading();
      ToastNotification.errorToastBar(message: e.toString());
    }
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
