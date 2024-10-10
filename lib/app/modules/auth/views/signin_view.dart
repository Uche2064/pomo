import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:pomo/app/modules/auth/controllers/signin_controller.dart';
import 'package:pomo/app/modules/auth/views/signup_view.dart';
import 'package:pomo/core/constant/image_strings.dart';
import 'package:pomo/app/components/account_accessor.dart';
import 'package:pomo/app/components/custom_elevated_button.dart';
import 'package:pomo/app/components/custom_seperator.dart';
import 'package:pomo/app/components/custom_text_form_field.dart';
import 'package:pomo/app/components/square_container_for_social_media.dart';
import 'package:pomo/core/global/strings.dart';
import 'package:pomo/core/styles/app_sizes.dart';
import 'package:pomo/core/styles/teststyle.dart';
import 'package:pomo/utils/validators.dart';
import 'package:simple_icons/simple_icons.dart';

// ignore: must_be_immutable
class SigninView extends GetView {
  SigninView({super.key});

  SigninController signinController = Get.put(SigninController());
  final _formKeySignin = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    Strings.loginAccount,
                    style: Textstyle.textStyle.copyWith(
                        fontSize: AppSizes.fs4Xl + 16.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  Gap(20.sp),
                  Form(
                      key: _formKeySignin,
                      child: Column(
                        children: [
                          Obx(
                            () => CustomTextFormField(
                              controller: signinController.emailCtrl,
                              hintText: Strings.email,
                              prefixIcon: Icon(
                                Icons.email,
                                size: 18.sp,
                                color: signinController.emailText.isEmpty
                                    ? Colors.grey.shade400
                                    : Colors.grey.shade900,
                              ),
                              validator: (email) =>
                                  Validators.validateEmail(email),
                              onChanged: (value) {
                                signinController.emailText.value = value;
                              },
                            ),
                          ),
                          Gap(16.sp),
                          Obx(() => CustomTextFormField(
                                obscureText: true,
                                controller: signinController.passwordCtrl,
                                hintText: Strings.password,
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: signinController.passwordText.isEmpty
                                      ? Colors.grey.shade400
                                      : Colors.grey.shade900,
                                  size: 18.sp,
                                ),
                                suffixIcon: Icon(
                                  Icons.visibility_off,
                                  color: signinController.passwordText.isEmpty
                                      ? Colors.grey.shade400
                                      : Colors.grey.shade900,
                                  size: 18.sp,
                                ),
                                validator: (password) =>
                                    Validators.validatePassword(password),
                                onChanged: (value) {
                                  signinController.passwordText.value = value;
                                },
                              )),
                        ],
                      )),
                  Gap(16.sp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(() => Checkbox(
                            checkColor: Colors.white,
                            value: signinController.rememberMe.value,
                            onChanged: (value) {
                              signinController.rememberMe.value = value!;
                            },
                            side: BorderSide(
                                color: Get.theme.colorScheme.primary,
                                width: 2,
                                strokeAlign: 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(6.sp),
                              ),
                            ),
                          )),
                      InkWell
                      (
                        onTap: () {
                          signinController.rememberMe.value =
                              !signinController.rememberMe.value;
                        },
                        child: Text(
                          Strings.rememberMe,
                          style: Textstyle.textStyle.copyWith(fontSize: 14.sp),
                        ),
                      )
                    ],
                  ),
                  Gap(20.sp),
                  Obx(
                    () => CustomElevatedButton(
                      text: Strings.signUp,
                      controller: signinController,
                      formKeySignin: _formKeySignin,
                      onPressed: signinController.emailText.value.isNotEmpty &&
                              signinController.passwordText.value.isNotEmpty
                          ? () {
                              if (_formKeySignin.currentState!.validate()) {
                                printInfo(info: "Valid");
                              } else {
                                printInfo(info: "Invalid");
                              }
                            }
                          : null,
                    ),
                  ),
                  Gap(16.sp),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      Strings.forgotThePassword,
                      style: Textstyle.textStyle.copyWith(
                        color: Get.theme.colorScheme.primary,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  Gap(45.sp),
                  CustomSeperator(
                    middleText: Strings.orContinueWith,
                  ),
                  Gap(28.sp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SquareContainerForSocialMedia(
                        socialMediaIcon: Icon(
                          SimpleIcons.facebook,
                          color: SimpleIconColors.facebook,
                        ),
                      ),
                      Gap(8.sp),
                      SquareContainerForSocialMedia(
                          socialMediaIcon: Image(
                        image: AssetImage(
                          ImageStrings.googleLogo,
                        ),
                        height: 25,
                      )),
                      Gap(8.sp),
                      SquareContainerForSocialMedia(
                          socialMediaIcon: Icon(
                        SimpleIcons.apple,
                        color: SimpleIconColors.apple,
                      )),
                    ],
                  ),
                  Gap(28.sp),
                  AccountAccessor(
                    leftText: Strings.dontHaveAnAccount,
                    rightText: Strings.signUp,
                    onTap: () => Get.to(() => SignupView()),
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
