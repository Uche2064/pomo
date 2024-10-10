import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pomo/app/modules/auth/bindings/auth_binding.dart';
import 'package:pomo/app/modules/auth/views/auth_view.dart';
import 'package:pomo/app/views/onboarding_view.dart';

class AuthController extends GetxController {
  final count = 0.obs;
  RxBool isAnimated = false.obs;
  RxBool isLoginPage = false.obs;
  GetStorage storage = GetStorage();

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
    isFirstTime
        ? Get.off(() => OnboardingView())
        : Get.off(() => AuthView(), binding: AuthBinding());
  }
}
