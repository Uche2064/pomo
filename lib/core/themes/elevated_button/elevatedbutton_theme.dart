import 'package:flutter/material.dart';
import 'package:pomo/core/styles/app_colors.dart';
import 'package:pomo/core/styles/app_sizes.dart';

class ElevatedbuttonTheme {
  static final lightTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSizes.border2xl,
        ),
      ),
      minimumSize: Size.fromHeight(45),
      backgroundColor: AppColors.accent,
      foregroundColor: AppColors.whiteColor,
      disabledBackgroundColor: AppColors.accent2,
    ),
  );

  // static final darkTheme = ElevatedButtonThemeData(
  //   style: ElevatedButton.styleFrom(
  //     elevation: 0,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(
  //         AppSizes.borderMd,
  //       ),
  //     ),
  //     foregroundColor: AppColors.black,
  //     foregroundBuilder: (context, states, child) {
  //       return Container(
  //         child: child,
  //       );
  //     },
  //     backgroundColor: AppColors.darkPrimary,
  //   ),
  // );
}
