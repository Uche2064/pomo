import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:pomo/app/components/custom_seperator.dart';
import 'package:pomo/core/global/strings.dart';
import 'package:pomo/core/styles/app_colors.dart';
import 'package:pomo/core/styles/app_sizes.dart';
import 'package:pomo/core/styles/teststyle.dart';
import 'package:simple_icons/simple_icons.dart';

import '../controllers/auth_controller.dart';
import 'signup_view.dart';
import '../../../components/custom_outline_button.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    Strings.letYouIn,
                    style: Get.textTheme.headlineLarge!.copyWith(
                      color: Get.theme.colorScheme.onTertiary,
                      fontSize: AppSizes.fs4Xl + 12.sp,
                    ),
                  ),
                  Gap(80.sp),
                  CustomOutlineButton(
                    onPressed: () {},
                    icon: Icon(
                      SimpleIcons.facebook,
                      color: AppColors.blueColor,
                    ),
                    text: Strings.continueWithFacebook,
                  ),
                  Gap(20.sp),
                  CustomOutlineButton(
                    onPressed: () {},
                    icon: Icon(SimpleIcons.google),
                    text: Strings.continueWithGoogle,
                  ),
                  Gap(20.sp),
                  CustomOutlineButton(
                    onPressed: () {},
                    icon: Icon(
                      SimpleIcons.apple,
                      color: Get.theme.colorScheme.onTertiary,
                    ),
                    text: Strings.continueWithApple,
                  ),
                  Gap(40.sp),
                  CustomSeperator(
                    middleText: Strings.or,
                  ),
                  Gap(40.sp),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(Strings.signInWithPassword),
                  ),
                  Gap(40.sp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Strings.dontHaveAnAccount,
                        style: Textstyle.textStyle.copyWith(
                          fontSize: 14.sp,
                          color:
                              Get.theme.colorScheme.onTertiary.withAlpha(150),
                        ),
                      ),
                      Gap(8.sp),
                      InkWell(
                        onTap: () {
                          Get.to(() => SignupView());
                        },
                        child: Text(
                          Strings.signUp,
                          style: Textstyle.textStyle.copyWith(
                            color: Get.theme.colorScheme.primary,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
