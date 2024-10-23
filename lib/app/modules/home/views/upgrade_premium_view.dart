import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:pomo/app/components/custom_elevated_button.dart';
import 'package:pomo/app/modules/home/controllers/home_controller.dart';
import 'package:pomo/core/constant/image_strings.dart';
import 'package:pomo/core/styles/app_colors.dart';
import 'package:pomo/core/styles/teststyle.dart';

import '../../../components/custom_popup_menu.dart';

class UpgradePremiumView extends GetView {
  UpgradePremiumView({super.key});

  final List<PremiumChoices> premiumList = [
    PremiumChoices(month: 1, price: 16.99),
    PremiumChoices(month: 6, price: 66.99),
    PremiumChoices(month: 12, price: 116.99),
  ];
  final RxInt _selectedPremium = 1.obs;

  final HomeController _homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 80.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                  onTap: () => Get.back(),
                                  child: Icon(Icons.arrow_back)),
                              Gap(12.h),
                              Text(
                                "Upgrade to Premium",
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
                    Text(
                      "Be Premium",
                      style: Textstyle.textStyle
                          .copyWith(fontSize: 35.h, color: AppColors.accent),
                    ),
                    Gap(16.h),
                    Text(
                      "Unlock all premium features and benefits.",
                      style: Textstyle.textStyle.copyWith(fontSize: 16.h),
                    ),
                    Image.asset(
                      ImageStrings.congratulationImg,
                      height: 280.h,
                    ),
                    Gap(24.h),
                    PremiumContainer(
                      onTap: () {
                        _selectedPremium.value = premiumList[0].month;
                      },
                      month: premiumList[0].month,
                      price: premiumList[0].price,
                      groupValue: _selectedPremium.value,
                      value: premiumList[0].month,
                    ),
                    Gap(12.h),
                    PremiumContainer(
                      onTap: () {
                        _selectedPremium.value = premiumList[1].month;
                      },
                      month: premiumList[1].month,
                      price: premiumList[1].price,
                      groupValue: _selectedPremium.value,
                      value: premiumList[1].month,
                    ),
                    Gap(12.h),
                    PremiumContainer(
                      onTap: () {
                        _selectedPremium.value = premiumList[2].month;
                      },
                      month: premiumList[2].month,
                      price: premiumList[2].price,
                      groupValue: _selectedPremium.value,
                      value: premiumList[2].month,
                    ),
                    Gap(32.h),
                    CustomElevatedButton(
                      controller: _homeController,
                      onPressed: () {},
                      text: "Subscribe",
                    ),
                    Gap(24.h),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Widget PremiumContainer({
    required void Function()? onTap,
    required int month,
    required double price,
    required int value,
    required int groupValue,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: _selectedPremium.value == value
            ? Get.theme.colorScheme.outline
            : Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12.h),
        border: Border.all(
          width: _selectedPremium.value == value ? 3.5.h : 0,
          color: _selectedPremium.value == value
              ? Get.theme.colorScheme.primary
              : AppColors.whiteColor,
        ),
      ),
      child: ListTile(
        onTap: onTap,
        leading:
            Radio(value: value, groupValue: groupValue, onChanged: (value) {}),
        title: Text(
          "${month} month",
          style: Textstyle.textStyle.copyWith(fontSize: 18.h),
        ),
        subtitle: Text(
          "Pay once and cancel anytime",
          style: Textstyle.textStyle
              .copyWith(fontSize: 14.h, color: Colors.grey.shade400),
        ),
        trailing: Text(
          "\$ ${price} /m",
          style: Textstyle.textStyle.copyWith(fontSize: 18.h),
        ),
      ),
    );
  }
}

class PremiumChoices {
  int month;
  double price;

  PremiumChoices({
    required this.month,
    required this.price,
  });
}
