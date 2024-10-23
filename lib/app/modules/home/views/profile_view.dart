import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pomo/app/components/pomo_logo.dart';
import 'package:pomo/app/modules/home/controllers/home_controller.dart';
import 'package:pomo/app/modules/home/controllers/profile_controller.dart';
import 'package:pomo/app/modules/home/views/upgrade_premium_view.dart';
import 'package:pomo/core/global/strings.dart';
import 'package:pomo/core/styles/app_colors.dart';
import 'package:pomo/core/styles/teststyle.dart';

import '../../../components/custom_popup_menu.dart';

// ignore: must_be_immutable
class ProfileView extends GetView {
  ProfileView({super.key});
  ProfileController _profileController = Get.put(ProfileController());
  HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Fixed non-scrollable header
                  SizedBox(
                    height: 80.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            PomoLogo(),
                            Gap(12.h),
                            Text(
                              Strings.profile,
                              style: Textstyle.textStyle.copyWith(
                                fontSize: 18.h,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        CustomPopupMenu()
                      ],
                    ),
                  ),
                  Gap(24.h),
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
                        ),
                      ],
                    ),
                  ),
                  Gap(20.h),
                  // Name
                  Obx(
                    () => Text(
                      _homeController.currentUser.value!.fullName!,
                      style: Textstyle.textStyle.copyWith(
                        fontSize: 24.h,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Email
                  Obx(() => Text(
                        _homeController.currentUser.value!.email!,
                        style: Textstyle.textStyle.copyWith(
                          fontSize: 18.h,
                        ),
                      )),
                  Gap(20.h),
                  InkWell(
                      borderRadius: BorderRadius.circular(20.h),
                      onTap: () => Get.to(() => UpgradePremiumView()),
                      child: _buildUpgradeWidget()),
                  Gap(20.h),
                  // about user
                  for (int i = 0;
                      i < _profileController.userSettings.length;
                      i++)
                    ListTile(
                      onTap: _profileController.userSettings[i].title ==
                              "Dark theme"
                          ? null
                          : _profileController.userSettings[i].onTap,
                      leading: _profileController.userSettings[i].icon,
                      title: Text(
                        _profileController.userSettings[i].title,
                        style:
                            _profileController.userSettings[i].title == "Logout"
                                ? Textstyle.textStyle.copyWith(
                                    color: AppColors.accent, fontSize: 18.h)
                                : Textstyle.textStyle.copyWith(fontSize: 18.h),
                      ),
                      trailing: _profileController.userSettings[i].trailing,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildUpgradeWidget() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 12.h),
    decoration: BoxDecoration(
        color: AppColors.accent, borderRadius: BorderRadius.circular(20.h)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: AppColors.yellowColor,
                    borderRadius: BorderRadius.circular(24.h),
                  ),
                  child: Text(
                    "PRO",
                    style: Textstyle.textStyle
                        .copyWith(color: AppColors.whiteColor),
                  ),
                ),
                Gap(12.h),
                Text(
                  "Upgrade to Premium",
                  style: Textstyle.textStyle
                      .copyWith(color: AppColors.whiteColor, fontSize: 22.h),
                ),
              ],
            ),
            Icon(
              Iconsax.arrow_circle_right,
              size: 28.h,
              color: AppColors.whiteColor,
            )
          ],
        ),
        Gap(12.h),
        Text(
          "Enjoy full access to the application without ads and restrictions",
          style: Textstyle.textStyle
              .copyWith(fontSize: 14.h, color: AppColors.whiteColor),
        )
      ],
    ),
  );
}
