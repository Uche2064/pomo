import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:pomo/app/components/custom_elevated_button.dart';
import 'package:pomo/app/components/custom_page_title.dart';
import 'package:pomo/app/components/custom_text_form_field.dart';
import 'package:pomo/app/modules/auth/controllers/create_new_password_controller.dart';
import 'package:pomo/core/global/strings.dart';
import 'package:pomo/core/styles/app_colors.dart';
import 'package:pomo/core/styles/app_sizes.dart';
import 'package:pomo/core/styles/teststyle.dart';
import 'package:pomo/utils/validators.dart';

class CreateNewPasswordView extends GetView {
  CreateNewPasswordView({super.key});
  final CreateNewPasswordController _newPasswordController =
      Get.put(CreateNewPasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomPageTitle(title: Strings.createNewPassword),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.h),
        child: CustomElevatedButton(
            controller: _newPasswordController,
            onPressed: () => _show(),
            text: Strings.c_ontinue),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(60.h),
                Icon(
                  Icons.lock,
                  color: AppColors.accent,
                  size: AppSizes.fs12Xl,
                ),
                Gap(40.h),
                Text(
                  Strings.createYourNewPassword,
                  style: Textstyle.textStyle.copyWith(fontSize: 20.h),
                ),
                Gap(20.h),
                Obx(() => CustomTextFormField(
                      hintText: Strings.enterNewPassword,
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 18.h,
                        color: _newPasswordController.newPasswordText.isEmpty
                            ? Colors.grey.shade400
                            : Colors.grey.shade900,
                      ),
                      validator: (password) =>
                          Validators.validatePassword(password),
                      obscureText: true,
                      onChanged: (value) {
                        _newPasswordController.newPasswordText.value = value;
                      },
                    )),
                Gap(16.h),
                Obx(() => CustomTextFormField(
                      hintText: Strings.confirmNewPassword,
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 18.h,
                        color: _newPasswordController
                                .confirmNewPasswordText.isEmpty
                            ? Colors.grey.shade400
                            : Colors.grey.shade900,
                      ),
                      validator: (password) =>
                          Validators.validatePassword(password),
                      obscureText: true,
                      onChanged: (value) {
                        _newPasswordController.confirmNewPasswordText.value =
                            value;
                      },
                    )),
                Gap(16.h),
                Row(
                  children: [
                    Checkbox(
                        splashRadius: 0,
                        checkColor: Get.theme.colorScheme.onSecondary,
                        side: BorderSide(width: 0, style: BorderStyle.none),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.h)),
                        value: true,
                        onChanged: (value) {}),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        Strings.showPassword,
                        style: Textstyle.textStyle.copyWith(fontSize: 16.h),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _show() async {
    SmartDialog.show(builder: (_) {
      return Container(
        height: 450.h,
        width: Get.width / 1.2,
        decoration: BoxDecoration(
          color: Get.theme.colorScheme.onSecondary,
          borderRadius: BorderRadius.circular(AppSizes.borderMd),
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Column(
            children: [
              Icon(
                Icons.check_circle,
                color: Get.theme.colorScheme.primary,
                size: 250,
              ),
              Gap(20.h),
              Text(
                Strings.congratulation,
                style: Textstyle.textStyle.copyWith(
                  fontSize: 20.h,
                  letterSpacing: 1.5,
                  color: Get.theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap(20.h),
              Text(
                Strings.accountReady,
                style: Textstyle.textStyle.copyWith(fontSize: 16.h),
              ),
              Gap(20.h),
              CustomElevatedButton(
                controller: _newPasswordController,
                onPressed: () {},
                text: Strings.goToHomePage,
                height: 50,
              )
            ],
          ),
        ),
      );
    });
  }
}
