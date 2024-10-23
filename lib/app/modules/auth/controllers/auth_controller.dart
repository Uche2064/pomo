import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pomo/app/modules/auth/services/auth_services.dart';
import 'package:pomo/app/modules/auth/views/auth_view.dart';
import 'package:pomo/app/modules/home/bindings/home_binding.dart';
import 'package:pomo/app/modules/home/views/home.dart';
import 'package:pomo/app/views/onboarding_view.dart';

class AuthController extends GetxController {
  final count = 0.obs;
  RxBool isAnimated = false.obs;
  RxBool isLoginPage = false.obs;
  GetStorage storage = GetStorage();
  AuthServices _authServices = AuthServices();
  @override
  void onReady() {
    super.onReady();
  }

  void startAnimation() async {
    await Future.delayed(Duration(milliseconds: 1600));
    isAnimated.value = true;
    await Future.delayed(Duration(milliseconds: 1600));
    storage.writeIfNull("isFirstTime", true);
    bool isFirstTime = storage.read("isFirstTime") ?? true;
    printInfo(info: isFirstTime.toString());

    if (isFirstTime) {
      storage.write("isFirstTime", false);
      printInfo(info: isFirstTime.toString());

      Get.off(() => OnboardingView());
      return;
    }
    screenRedirect();
  }

  void screenRedirect() async {
    // fetch current user
    final currentUser = await FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      Get.offAll(() => AuthView(), transition: Transition.circularReveal);
      return;
    }
    Get.offAll(
      () => Home(),
      fullscreenDialog: true,
      transition: Transition.downToUp,
      binding: HomeBinding(),
    );
  }
}
