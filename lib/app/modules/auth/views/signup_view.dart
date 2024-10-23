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

  SignupController _signupController = Get.put(SignupController());
  final _formKeySignup = GlobalKey<FormState>(debugLabel: "signup");

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
                    Strings.createAccount,
                    style: Textstyle.textStyle.copyWith(
                        fontSize: AppSizes.fs4Xl + 16.h,
                        fontWeight: FontWeight.bold),
                  ),
                  Gap(20.h),
                  Form(
                      key: _formKeySignup,
                      child: Column(
                        children: [
                          Obx(
                            () => CustomTextFormField(
                              controller: _signupController.emailCtrl,
                              hintText: Strings.email,
                              prefixIcon: Icon(
                                Icons.email,
                                size: 18.h,
                                color: _signupController.emailText.isEmpty
                                    ? Colors.grey.shade400
                                    : Colors.grey.shade900,
                              ),
                              validator: (email) =>
                                  Validators.validateEmail(email),
                              onChanged: (value) {
                                printInfo(
                                    info:
                                        _signupController.isEnabled.toString());
                                _signupController.emailText.value = value;
                              },
                            ),
                          ),
                          Gap(16.h),
                          Obx(() => CustomTextFormField(
                                obscureText: _signupController.isVisible.value,
                                controller: _signupController.passwordCtrl,
                                hintText: Strings.password,
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: _signupController.passwordText.isEmpty
                                      ? Colors.grey.shade400
                                      : Colors.grey.shade900,
                                  size: 18.h,
                                ),
                                suffixIcon: IconButton(
                                  splashColor: Get.theme.colorScheme.primary,
                                  icon: Icon(
                                    !_signupController.isVisible.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    size: 18.h,
                                  ),
                                  onPressed: () =>
                                      _signupController.toggleIcon(),
                                  color: _signupController.passwordText.isEmpty
                                      ? Colors.grey.shade400
                                      : Colors.grey.shade900,
                                ),
                                validator: (password) =>
                                    Validators.validatePassword(password),
                                onChanged: (value) {
                                  printInfo(
                                      info: _signupController.isEnabled
                                          .toString());
                                  _signupController.passwordText.value = value;
                                },
                              )),
                        ],
                      )),
                  Gap(16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(
                        () => Checkbox(
                          checkColor: Colors.white,
                          value: _signupController.rememberMe.value,
                          onChanged: (value) {
                            _signupController.rememberMe.value = value!;
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
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _signupController.rememberMe.value =
                              !_signupController.rememberMe.value;
                        },
                        child: Text(
                          Strings.rememberMe,
                          style: Textstyle.textStyle.copyWith(fontSize: 16.h),
                        ),
                      )
                    ],
                  ),
                  Gap(20.h),
                  Obx(() => CustomElevatedButton(
                        text: Strings.signUp,
                        formKeySignin: _formKeySignup,
                        controller: _signupController,
                        onPressed: _signupController
                                    .emailText.value.isNotEmpty &&
                                _signupController.passwordText.value.isNotEmpty
                            ? () {
                                if (_formKeySignup.currentState!.validate()) {
                                  _signupController
                                      .signupWithEmailAndPassword();
                                }
                              }
                            : null,
                      )),
                  Gap(45.h),
                  CustomSeperator(
                    middleText: Strings.orContinueWith,
                  ),
                  Gap(28.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SquareContainerForSocialMedia(
                        onTap: () {},
                        socialMediaIcon: Icon(
                          SimpleIcons.facebook,
                          color: SimpleIconColors.facebook,
                        ),
                      ),
                      Gap(8.h),
                      SquareContainerForSocialMedia(
                        onTap: () => _signupController.signUpWithGoogle(),
                        socialMediaIcon: Image(
                          image: AssetImage(
                            ImageStrings.googleLogo,
                          ),
                          height: 25,
                        ),
                      ),
                      Gap(8.h),
                      SquareContainerForSocialMedia(
                        onTap: () {},
                        socialMediaIcon: Icon(
                          SimpleIcons.apple,
                          color: SimpleIconColors.apple,
                        ),
                      ),
                    ],
                  ),
                  Gap(28.h),
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
