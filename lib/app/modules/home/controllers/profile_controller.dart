import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pomo/app/components/custom_elevated_button.dart';
import 'package:pomo/app/components/custom_outline_button.dart';
import 'package:pomo/app/modules/auth/models/user_settings.dart';
import 'package:pomo/app/modules/home/controllers/home_controller.dart';
import 'package:pomo/core/styles/app_colors.dart';
import 'package:pomo/core/styles/teststyle.dart';

class ProfileController extends GetxController {
  RxBool isDarkMode = false.obs;
  List<UserSettings> userSettings = [];
  HomeController _homeController = Get.find();
  @override
  void onReady() {
    userSettings = [
      UserSettings(
        onTap: () {},
        title: "Edit Profile",
        icon: Icon(
          Icons.person_3_outlined,
        ),
      ),
      UserSettings(
        onTap: () {},
        title: "Pomo settings",
        icon: Icon(
          Icons.star_border_rounded,
        ),
      ),
      UserSettings(
        onTap: () {},
        title: "Notifications",
        icon: Icon(
          Icons.notifications_none_outlined,
        ),
      ),
      UserSettings(
        onTap: () {},
        title: "Security",
        icon: Icon(
          Icons.security,
        ),
      ),
      UserSettings(
        onTap: () {},
        title: "Help",
        icon: Icon(
          Icons.help_center_outlined,
        ),
      ),
      UserSettings(
        onTap: () {},
        title: "Dark theme",
        icon: Icon(Icons.remove_red_eye_outlined),
        trailing: Obx(
          () => Switch(
            activeColor: AppColors.accent,
            value: isDarkMode.value,
            onChanged: (value) {
              isDarkMode.value = value;
            },
          ),
        ),
      ),
      UserSettings(
        onTap: () => logoutUser(),
        title: "Logout",
        icon: Icon(
          Icons.logout_outlined,
          color: AppColors.accent,
        ),
      ),
    ];
    super.onReady();
  }

  void logoutUser() {
    showModalBottomSheet(
        context: Get.overlayContext!,
        builder: (context) {
          return Container(
            height: Get.height / 3.4.h,
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 5.h,
                  width: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade300,
                  ),
                ),
                Gap(40.h),
                Text(
                  "Are you sure you want to log out?",
                  style: Textstyle.textStyle.copyWith(
                    fontSize: 24.h,
                    color: AppColors.accent,
                  ),
                ),
                Gap(24.h),
                Divider(
                  thickness: 2,
                  color: Colors.grey.shade300,
                ),
                Gap(24.h),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: CustomOutlineButton(
                        height: 45.h,
                        borderRadius: 20.h,
                        backgroundColor: AppColors.lightAccent,
                        foregroundColor: AppColors.accent,
                        borderStyle: BorderStyle.none,
                        text: "Cancel",
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    Gap(12.h),
                    Expanded(
                      child: CustomElevatedButton(
                        text: "Yes",
                        controller: this,
                        onPressed: () async {
                          await _homeController.logoutUser();
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
