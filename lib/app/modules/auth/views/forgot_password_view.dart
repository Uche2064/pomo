import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:pomo/app/components/custom_elevated_button.dart';
import 'package:pomo/app/components/custom_page_title.dart';
import 'package:pomo/app/modules/auth/controllers/forgot_password_controller.dart';
import 'package:pomo/core/constant/image_strings.dart';
import 'package:pomo/core/global/strings.dart';
import 'package:pomo/core/styles/app_sizes.dart';
import 'package:pomo/core/styles/teststyle.dart';

// ignore: must_be_immutable
class ForgotPasswordView extends GetView {
  ForgotPasswordView({super.key});
  ForgotPasswordController _forgotPasswordController =
      Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomPageTitle(
          title: Strings.forgotPassword,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Column(
              children: [
                Image(
                  image: Svg(ImageStrings.forgotPassword),
                  height: 250.h,
                ),
                Gap(20.h),
                Text(
                  Strings.forgotPasswordPrompt,
                  style: Textstyle.textStyle.copyWith(fontSize: 16.h),
                ),
                Gap(20.h),
                Column(
                  children: List.generate(
                      _forgotPasswordController.contactDetails.length,
                      (int index) {
                    final contactDetail =
                        _forgotPasswordController.contactDetails[index];
                    return _buildContactDetailsTile(
                      index: index,
                      leadingIconData: contactDetail.leadingIconData,
                      title: contactDetail.title,
                      subtitle: contactDetail.subtitle,
                      onTap: () {
                        _forgotPasswordController.currentIndex.value = index;
                      },
                    );
                  }),
                ),
                Gap(48.h),
                CustomElevatedButton(
                  controller: _forgotPasswordController,
                  onPressed: () {},
                  text: Strings.c_ontinue,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContactDetailsTile(
      {required IconData leadingIconData,
      required String title,
      required String subtitle,
      void Function()? onTap,
      required int index}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: InkWell(
        splashColor: Get.theme.colorScheme.outline,
        borderRadius: BorderRadius.circular(
          AppSizes.borderMd,
        ),
        onTap: onTap,
        child: Obx(() => Container(
              padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 12.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.borderMd),
                border: Border.all(
                  color: _forgotPasswordController.currentIndex.value == index
                      ? Get.theme.colorScheme.primary
                      : Colors.grey,
                  width: 1.2.h,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.h),
                      color: Get.theme.colorScheme.outline,
                    ),
                    child: Icon(
                      leadingIconData,
                      color: Get.theme.colorScheme.primary,
                    ),
                  ),
                  Gap(12.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Textstyle.textStyle.copyWith(
                          fontSize: 14.h,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      Gap(8.h),
                      Text(
                        subtitle,
                        style: Textstyle.textStyle,
                      )
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
