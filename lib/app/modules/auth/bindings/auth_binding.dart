import 'package:get/get.dart';

import 'package:pomo/app/modules/auth/controllers/forgot_password_controller.dart';
import 'package:pomo/app/modules/auth/controllers/otp_controller.dart';
import 'package:pomo/app/modules/auth/controllers/signin_controller.dart';

import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpController>(
      () => OtpController(),
    );
    Get.lazyPut<ForgotPasswordController>(
      () => ForgotPasswordController(),
    );
    Get.lazyPut<SigninController>(
      () => SigninController(),
    );
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
  }
}
