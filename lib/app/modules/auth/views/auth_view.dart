import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:pomo/app/components/custom_seperator.dart';
import 'package:pomo/app/modules/auth/controllers/signup_controller.dart';
import 'package:pomo/app/modules/auth/views/signin_view.dart';
import 'package:pomo/core/constant/image_strings.dart';
import 'package:pomo/core/global/strings.dart';
import 'package:pomo/core/styles/app_colors.dart';
import 'package:pomo/core/styles/app_sizes.dart';
import 'package:pomo/core/styles/teststyle.dart';
import 'package:simple_icons/simple_icons.dart';

import '../controllers/auth_controller.dart';
import 'signup_view.dart';
import '../../../components/custom_outline_button.dart';

class AuthView extends GetView<AuthController> {
  AuthView({super.key});
  final SignupController _signupController = Get.put(SignupController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    Strings.letYouIn,
                    style: Get.textTheme.headlineLarge!.copyWith(
                      color: Get.theme.colorScheme.onTertiary,
                      fontSize: AppSizes.fs4Xl + 12.h,
                    ),
                  ),
                  Gap(80.h),
                  CustomOutlineButton(
                    onPressed: () {},
                    icon: Icon(
                      SimpleIcons.facebook,
                      color: AppColors.blueColor,
                      size: 26.h,
                    ),
                    text: Strings.continueWithFacebook,
                  ),
                  Gap(20.h),
                  CustomOutlineButton(
                    onPressed: () => _signupController.signUpWithGoogle(),
                    icon: Image.asset(
                      ImageStrings.googleLogo,
                      height: 26.h,
                    ),
                    text: Strings.continueWithGoogle,
                  ),
                  Gap(20.h),
                  CustomOutlineButton(
                    onPressed: () {},
                    icon: Icon(
                      SimpleIcons.apple,
                      size: 26.h,
                      color: Get.theme.colorScheme.onTertiary,
                    ),
                    text: Strings.continueWithApple,
                  ),
                  Gap(40.h),
                  CustomSeperator(
                    middleText: Strings.or,
                  ),
                  Gap(40.h),
                  ElevatedButton(
                    onPressed: () => Get.to(() => SigninView()),
                    child: Text(Strings.signInWithPassword),
                  ),
                  Gap(40.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Strings.dontHaveAnAccount,
                        style: Textstyle.textStyle.copyWith(
                          fontSize: 16.h,
                          color:
                              Get.theme.colorScheme.onTertiary.withAlpha(150),
                        ),
                      ),
                      Gap(8.h),
                      InkWell(
                        onTap: () {
                          Get.to(() => SignupView());
                        },
                        child: Text(
                          Strings.signUp,
                          style: Textstyle.textStyle.copyWith(
                            color: Get.theme.colorScheme.primary,
                            fontSize: 16.h,
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
