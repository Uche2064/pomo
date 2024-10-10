import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:pomo/app/modules/auth/controllers/signup_controller.dart';
import 'package:pomo/app/modules/auth/views/signin_view.dart';
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
class SignupView extends GetView {
  SignupView({super.key});

  SignupController signupController = Get.put(SignupController());
  final _formKeySignup = GlobalKey<FormState>(debugLabel: "signup");

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
                    Strings.createAccount,
                    style: Textstyle.textStyle.copyWith(
                        fontSize: AppSizes.fs4Xl + 16.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  Gap(20.sp),
                  Form(
                      key: _formKeySignup,
                      child: Column(
                        children: [
                          Obx(
                            () => CustomTextFormField(
                              controller: signupController.emailCtrl,
                              hintText: Strings.email,
                              prefixIcon: Icon(
                                Icons.email,
                                size: 18.sp,
                                color: signupController.emailText.isEmpty
                                    ? Colors.grey.shade400
                                    : Colors.grey.shade900,
                              ),
                              validator: (email) =>
                                  Validators.validateEmail(email),
                              onChanged: (value) {
                                printInfo(
                                    info:
                                        signupController.isEnabled.toString());
                                signupController.emailText.value = value;
                              },
                            ),
                          ),
                          Gap(16.sp),
                          Obx(() => CustomTextFormField(
                                obscureText: signupController.isVisible.value,
                                controller: signupController.passwordCtrl,
                                hintText: Strings.password,
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: signupController.passwordText.isEmpty
                                      ? Colors.grey.shade400
                                      : Colors.grey.shade900,
                                  size: 18.sp,
                                ),
                                suffixIcon: IconButton(
                                  splashColor: Get.theme.colorScheme.primary,
                                  icon: Icon(
                                    !signupController.isVisible.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    size: 18.sp,
                                  ),
                                  onPressed: () =>
                                      signupController.toggleIcon(),
                                  color: signupController.passwordText.isEmpty
                                      ? Colors.grey.shade400
                                      : Colors.grey.shade900,
                                ),
                                validator: (password) =>
                                    Validators.validatePassword(password),
                                onChanged: (value) {
                                  printInfo(
                                      info: signupController.isEnabled
                                          .toString());
                                  signupController.passwordText.value = value;
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
                            value: signupController.rememberMe.value,
                            onChanged: (value) {
                              signupController.rememberMe.value = value!;
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
                      Text(
                        Strings.rememberMe,
                        style: Textstyle.textStyle.copyWith(fontSize: 14.sp),
                      )
                    ],
                  ),
                  Gap(20.sp),
                  Obx(() => CustomElevatedButton(
                    text: Strings.signUp,
                    formKeySignin: _formKeySignup,
                    controller: signupController,
                        onPressed: signupController
                                    .emailText.value.isNotEmpty &&
                                signupController.passwordText.value.isNotEmpty
                            ? () {
                                if (_formKeySignup.currentState!.validate()) {
                                  printInfo(info: "Valid");
                                } else {
                                  printInfo(info: "Invalid");
                                }
                              }
                            : null,
                       
                      )),
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
                    leftText: Strings.alreadyHaveAnAccount,
                    rightText: Strings.signIn,
                    onTap: () => Get.to(() => SigninView()),
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
