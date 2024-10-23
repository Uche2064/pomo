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

  SigninController _signinController = Get.put(SigninController());
  final _formKeySignin = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    Strings.loginAccount,
                    style: Textstyle.textStyle.copyWith(
                        fontSize: AppSizes.fs4Xl + 16.h,
                        fontWeight: FontWeight.bold),
                  ),
                  Gap(20.h),
                  Form(
                      key: _formKeySignin,
                      child: Column(
                        children: [
                          Obx(
                            () => CustomTextFormField(
                              controller: _signinController.emailCtrl,
                              hintText: Strings.email,
                              prefixIcon: Icon(
                                Icons.email,
                                size: 18.h,
                                color: _signinController.emailText.isEmpty
                                    ? Colors.grey.shade400
                                    : Colors.grey.shade900,
                              ),
                              validator: (email) =>
                                  Validators.validateEmail(email),
                              onChanged: (value) {
                                _signinController.emailText.value = value;
                              },
                            ),
                          ),
                          Gap(16.h),
                          Obx(() => CustomTextFormField(
                                obscureText: _signinController.isVisible.value,
                                controller: _signinController.passwordCtrl,
                                hintText: Strings.password,
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: _signinController.passwordText.isEmpty
                                      ? Colors.grey.shade400
                                      : Colors.grey.shade900,
                                  size: 18.h,
                                ),
                                suffixIcon: IconButton(
                                  splashColor: Get.theme.colorScheme.primary,
                                  icon: Icon(
                                    !_signinController.isVisible.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    size: 18.h,
                                  ),
                                  onPressed: () =>
                                      _signinController.toggleIcon(),
                                  color: _signinController.passwordText.isEmpty
                                      ? Colors.grey.shade400
                                      : Colors.grey.shade900,
                                ),
                                validator: (password) =>
                                    Validators.validatePassword(password),
                                onChanged: (value) {
                                  _signinController.passwordText.value = value;
                                },
                              )),
                        ],
                      )),
                  Gap(16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(() => Checkbox(
                            checkColor: Colors.white,
                            value: _signinController.rememberMe.value,
                            onChanged: (value) {
                              _signinController.rememberMe.value = value!;
                            },
                            side: BorderSide(
                                color: Get.theme.colorScheme.primary,
                                width: 2,
                                strokeAlign: 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(6.h),
                              ),
                            ),
                          )),
                      InkWell(
                        onTap: () {
                          _signinController.rememberMe.value =
                              !_signinController.rememberMe.value;
                        },
                        child: Text(
                          Strings.rememberMe,
                          style: Textstyle.textStyle.copyWith(fontSize: 16.h),
                        ),
                      )
                    ],
                  ),
                  Gap(20.h),
                  Obx(
                    () => CustomElevatedButton(
                      text: Strings.signUp,
                      controller: _signinController,
                      formKeySignin: _formKeySignin,
                      onPressed: _signinController.emailText.value.isNotEmpty &&
                              _signinController.passwordText.value.isNotEmpty
                          ? () {
                              if (_formKeySignin.currentState!.validate()) {
                                _signinController.signinUser();
                              }
                            }
                          : null,
                    ),
                  ),
                  Gap(16.h),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      Strings.forgotThePassword,
                      style: Textstyle.textStyle.copyWith(
                        color: Get.theme.colorScheme.primary,
                        fontSize: 16.h,
                      ),
                    ),
                  ),
                  Gap(45.h),
                  CustomSeperator(
                    middleText: Strings.orContinueWith,
                  ),
                  Gap(28.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SquareContainerForSocialMedia(
                        socialMediaIcon: Icon(
                          SimpleIcons.facebook,
                          color: SimpleIconColors.facebook,
                        ),
                      ),
                      Gap(8.h),
                      SquareContainerForSocialMedia(
                          socialMediaIcon: Image(
                        image: AssetImage(
                          ImageStrings.googleLogo,
                        ),
                        height: 25,
                      )),
                      Gap(8.h),
                      SquareContainerForSocialMedia(
                          socialMediaIcon: Icon(
                        SimpleIcons.apple,
                        color: SimpleIconColors.apple,
                      )),
                    ],
                  ),
                  Gap(28.h),
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
