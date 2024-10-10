import 'package:flutter/material.dart';
import 'package:pomo/core/styles/app_colors.dart';
import 'package:pomo/core/themes/elevated_button/elevatedbutton_theme.dart';
import 'package:pomo/core/themes/texttheme.dart';

final lightTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.whiteColor,
  textTheme: Texttheme.lightTextTheme,
  elevatedButtonTheme: ElevatedbuttonTheme.lightTheme,
  colorScheme: ColorScheme.light(
      primary: AppColors.accent,
      onPrimary: Colors.grey.shade300,
      outline: AppColors.lightAccent,
      secondary: AppColors.blueColor,
      onSecondary: Colors.white,
      tertiary: AppColors.lightAccent,
      onTertiary: Colors.black,
      surface: AppColors.whiteColor,
      error: AppColors.redColor),
);
