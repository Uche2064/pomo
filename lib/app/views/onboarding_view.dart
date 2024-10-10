import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:pomo/app/modules/auth/views/auth_view.dart';
import 'package:pomo/core/constant/image_strings.dart';
import 'package:pomo/core/global/strings.dart';
import 'package:pomo/core/styles/app_colors.dart';
import 'package:pomo/core/styles/app_sizes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends GetView {
  const OnboardingView({super.key});
  @override
  Widget build(BuildContext context) {
    RxBool isLastPage = false.obs;
    // controller to keep track of which page we are on
    PageController _pageController = PageController();
    List<Widget> pageViews = [
      _buildPageViewModel(
        title: Strings.boardingTitle1,
        image: ImageStrings.completedTask,
      ),
      _buildPageViewModel(
        title: Strings.boardingTitle2,
        image: ImageStrings.productivity,
      ),
      _buildPageViewModel(
        title: Strings.boardingTitle3,
        image: ImageStrings.pieGraph,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            child: Text(
              Strings.skip,
              style: Get.textTheme.headlineMedium!
                  .copyWith(color: Get.theme.colorScheme.primary),
            ),
            onPressed: () {
              Get.off(AuthView());
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              isLastPage.value = index == 2;
            },
            controller: _pageController,
            children: pageViews,
          ),
          // dotted indicators
          Container(
            alignment: Alignment(0, 0.65),
            child: SmoothPageIndicator(
              effect: ExpandingDotsEffect(
                activeDotColor: Get.theme.colorScheme.primary,
                dotColor: Colors.grey.shade300,
                expansionFactor: 2,
                dotHeight: 10,
                dotWidth: 15,
              ),
              controller: _pageController,
              count: pageViews.length,
            ),
          ),
          Container(
            alignment: Alignment(0, 0.9),
            width: double.maxFinite,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: ElevatedButton(
                onPressed: () {
                  if (isLastPage.value) {
                    Get.off(AuthView());
                  } else {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: Obx(() =>
                    Text(isLastPage.value ? Strings.getStarted : Strings.next)),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPageViewModel({required String image, required String title}) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Gap(120.sp),
          _buildImage(image),
          Text(
            textAlign: TextAlign.center,
            title,
            style: Get.textTheme.headlineLarge!.copyWith(
                color: AppColors.blackColor, fontSize: AppSizes.fs4Xl),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset(assetName, width: width);
  }
}