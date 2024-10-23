import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:pomo/app/components/custom_elevated_button.dart';
import 'package:pomo/app/components/custom_page_title.dart';
import 'package:pomo/app/modules/auth/controllers/otp_controller.dart';
import 'package:pomo/core/global/strings.dart';
import 'package:pomo/core/styles/teststyle.dart';

// ignore: must_be_immutable
class OtpView extends GetView {
  OtpView({super.key});

  OtpController otpController = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.h),
        child: CustomElevatedButton(
            controller: otpController,
            onPressed: () {},
            text: Strings.verifyCode),
      ),
      appBar: AppBar(
        title: CustomPageTitle(
          title: Strings.forgotPassword,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Strings.codeSent,
                  style: Textstyle.textStyle.copyWith(fontSize: 16.h),
                ),
                Gap(4.h),
                Text(
                  "+000***0000",
                  style: Textstyle.textStyle.copyWith(fontSize: 16.h),
                ),
              ],
            ),
            Gap(40.h),
            OTPTextField(
              length: 5,
              width: Get.width,
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.box,
              fieldWidth: 55.h,
              style: Textstyle.textStyle.copyWith(fontSize: 16.h),
              otpFieldStyle: OtpFieldStyle(
                enabledBorderColor: Get.theme.colorScheme.onPrimary,
                focusBorderColor: Get.theme.colorScheme.primary,
                backgroundColor: Colors.grey.shade300,
              ),
            ),
            Gap(40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Strings.resendCodeIn,
                  style: Textstyle.textStyle.copyWith(),
                ),
                Gap(4.h),
                Text(
                  "55",
                  style: Textstyle.textStyle
                      .copyWith(color: Get.theme.colorScheme.primary),
                ),
                Gap(4.h),
                Text(
                  "s",
                  style: Textstyle.textStyle.copyWith(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
