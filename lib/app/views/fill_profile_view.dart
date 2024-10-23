import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import 'package:pomo/app/modules/auth/controllers/signup_controller.dart';
import 'package:pomo/app/components/custom_elevated_button.dart';
import 'package:pomo/app/components/custom_outline_button.dart';
import 'package:pomo/app/components/custom_text_form_field.dart';
import 'package:pomo/core/global/strings.dart';
import 'package:pomo/core/styles/app_sizes.dart';
import 'package:pomo/core/styles/teststyle.dart';
import 'package:pomo/utils/validators.dart';

import '../modules/auth/views/widgets/custom_phone_field.dart';

// ignore: must_be_immutable
class FillProfileView extends GetView {
  FillProfileView({super.key});
  SignupController _signupController = Get.put(SignupController());
  GlobalKey<FormState> _formKeyFillProfile = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Locale? _locale = Get.deviceLocale;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    Strings.fillYourProfile,
                    style: Textstyle.textStyle.copyWith(
                      fontSize: AppSizes.fs4Xl,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gap(20.h),
                  Text(
                    textAlign: TextAlign.center,
                    Strings.fillYourProfilePrompt,
                    style:
                        Textstyle.textStyle.copyWith(fontSize: AppSizes.fsXl),
                  ),
                  Gap(50.h),
                  Container(
                    height: 100.h,
                    width: 100.h,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(100.h)),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10,
                          left: 5,
                          child: Icon(
                            Icons.person,
                            color: Colors.grey.shade300,
                            size: 90.h,
                          ),
                        ),
                        Positioned(
                          top: 70.h,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Get.theme.colorScheme.primary,
                              borderRadius: BorderRadius.circular(4.h),
                            ),
                            child: Icon(
                              CupertinoIcons.pencil,
                              color: Get.theme.colorScheme.onSecondary,
                              size: 20.h,
                              grade: 18,
                              weight: 40,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Gap(20.h),
                  Form(
                    key: _formKeyFillProfile,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          controller: _signupController.fullNameCtrl,
                          hintText: Strings.fullName,
                          validator: (fullName) =>
                              Validators.validateField(fullName),
                        ),
                        Gap(16.h),
                        CustomTextFormField(
                          controller: _signupController.nickNameCtrl,
                          hintText: Strings.nickName,
                        ),
                        Gap(16.h),
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
                              _signupController.emailText.value = value;
                            },
                          ),
                        ),
                        Gap(16.h),
                        CustomPhoneField(
                          locale: _locale,
                          controller: _signupController.phoneNumberCtrl,
                        ),
                        Gap(40.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: CustomOutlineButton(
                                height: 45.h,
                                backgroundColor: Get.theme.colorScheme.outline,
                                foregroundColor: Get.theme.colorScheme.primary,
                                borderColor: Get.theme.colorScheme.outline,
                                borderRadius: AppSizes.border4Xl,
                                text: Strings.skip,
                                onPressed: () {},
                              ),
                            ),
                            Gap(12.h),
                            Expanded(
                              child: CustomElevatedButton(
                                height: 45.h,
                                borderRadius: AppSizes.border4Xl,
                                controller: _signupController,
                                formKeySignin: _formKeyFillProfile,
                                onPressed: () {
                                  if (_formKeyFillProfile.currentState!
                                      .validate()) {
                                    _signupController.saveUserRecord();
                                  }
                                },
                                text: Strings.start,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
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
