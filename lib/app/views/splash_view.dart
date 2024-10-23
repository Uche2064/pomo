import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomo/app/modules/auth/controllers/auth_controller.dart';

import 'package:pomo/core/styles/app_colors.dart';
import 'package:pomo/core/styles/app_sizes.dart';

// ignore: must_be_immutable
class SplashView extends GetView<AuthController> {
  SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.startAnimation();
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          color: AppColors.accent,
        ),
        child: Stack(
          children: [
            Obx(
              () => AnimatedPositioned(
                curve: Curves.bounceIn,
                duration: Duration(milliseconds: 1000),
                bottom:
                    controller.isAnimated.value ? (Get.height / 2) - 80 : -150,
                left: Get.width / 2 - 35,
                child: Text(
                  "P",
                  style: GoogleFonts.bagelFatOne(
                    color: AppColors.whiteColor,
                    fontSize: 120,
                  ),
                ),
              ),
            ),
            Obx(() => controller.isAnimated.value
                ? Positioned(
                    top: Get.height / 2 + 50,
                    left: Get.width / 2 - 50,
                    child: AnimatedTextKit(
                      animatedTexts: [
                        ColorizeAnimatedText(
                          "Pomo",
                          textStyle: Get.textTheme.headlineLarge!.copyWith(
                            letterSpacing: 2,
                            fontSize: AppSizes.fs4Xl,
                          ),
                          colors: [AppColors.accent2, AppColors.whiteColor],
                        ),
                      ],
                      totalRepeatCount: 1,
                    ),
                  )
                : SizedBox.shrink()),
          ],
        ),
      ),
    );
  }
}
