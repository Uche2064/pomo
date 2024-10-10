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
  SignupController signupController = Get.put(SignupController());
  GlobalKey<FormState> _formKeyFillProfile = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Locale? _locale = Get.deviceLocale;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
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
                  Gap(20.sp),
                  Text(
                    textAlign: TextAlign.center,
                    Strings.fillYourProfilePrompt,
                    style:
                        Textstyle.textStyle.copyWith(fontSize: AppSizes.fsXl),
                  ),
                  Gap(90.sp),
                  Container(
                    height: 100.sp,
                    width: 100.sp,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(100.sp)),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10,
                          left: 5,
                          child: Icon(
                            Icons.person,
                            color: Colors.grey.shade300,
                            size: 90.sp,
                          ),
                        ),
                        Positioned(
                          top: 70.sp,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Get.theme.colorScheme.primary,
                              borderRadius: BorderRadius.circular(4.sp),
                            ),
                            child: Icon(
                              CupertinoIcons.pencil,
                              color: Get.theme.colorScheme.onSecondary,
                              size: 20.sp,
                              grade: 18,
                              weight: 40,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Gap(20.sp),
                  Form(
                      key: _formKeyFillProfile,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            hintText: Strings.fullName,
                          ),
                          Gap(16.sp),
                          CustomTextFormField(
                            hintText: Strings.nickName,
                          ),
                          Gap(16.sp),
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
                                signupController.emailText.value = value;
                              },
                            ),
                          ),
                          Gap(16.sp),
                          CustomPhoneField(locale: _locale),
                          Gap(40.sp),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: CustomOutlineButton(
                                  height: 45.sp,
                                  backgroundColor:
                                      Get.theme.colorScheme.outline,
                                  foregroundColor:
                                      Get.theme.colorScheme.primary,
                                  borderColor: Get.theme.colorScheme.outline,
                                  borderRadius: AppSizes.border4Xl,
                                  text: Strings.skip,
                                  onPressed: () {},
                                ),
                              ),
                              Gap(12.sp),
                              Expanded(
                                child: CustomElevatedButton(
                                    height: 45.sp,
                                    borderRadius: AppSizes.border4Xl,
                                    controller: signupController,
                                    formKeySignin: _formKeyFillProfile,
                                    onPressed: () {},
                                    text: Strings.start),
                              )
                            ],
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
