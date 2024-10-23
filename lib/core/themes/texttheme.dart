import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomo/core/styles/app_colors.dart';
import 'package:pomo/core/styles/app_sizes.dart';

class Texttheme {
  Texttheme._();

  static TextTheme lightTextTheme = const TextTheme().copyWith(
    headlineLarge: GoogleFonts.afacad(
      fontSize: AppSizes.fs2xl,
      fontWeight: FontWeight.bold,
      color: AppColors.whiteColor,
    ),
    headlineMedium: GoogleFonts.afacad(
      fontSize: AppSizes.fsXl,
      fontWeight: FontWeight.w700,
      color: AppColors.whiteColor,
    ),
    headlineSmall: GoogleFonts.afacad(
      fontSize: AppSizes.fsMd,
      fontWeight: FontWeight.w500,
      color: AppColors.whiteColor,
    ),
    bodyLarge: GoogleFonts.afacad(
      fontSize: AppSizes.fsMd,
      fontWeight: FontWeight.w500,
      color: AppColors.whiteColor,
    ),
    bodyMedium: GoogleFonts.afacad(
      fontSize: AppSizes.fsMd,
      fontWeight: FontWeight.w500,
      color: AppColors.whiteColor,
    ),
    bodySmall: GoogleFonts.afacad(
      fontSize: AppSizes.fsMd,
      fontWeight: FontWeight.w500,
      color: AppColors.whiteColor,
    ),
    titleLarge: GoogleFonts.afacad(
      fontSize: AppSizes.fsMd,
      fontWeight: FontWeight.normal,
      color: AppColors.whiteColor,
    ),
    titleMedium: GoogleFonts.afacad(
      fontSize: AppSizes.fsSm,
      fontWeight: FontWeight.normal,
      color: AppColors.whiteColor,
    ),
    titleSmall: GoogleFonts.afacad(
      fontSize: AppSizes.fsSm,
      fontWeight: FontWeight.normal,
      color: AppColors.whiteColor,
    ),
  );

  // static TextTheme darkTextTheme = const TextTheme().copyWith(
  //   headlineLarge: GoogleFonts.afacad(
  //     fontSize: AppSizes.fs2xl,
  //     fontWeight: FontWeight.bold,
  //     color: AppColors.darkPrimary,
  //   ),
  //   headlineMedium: GoogleFonts.afacad(
  //     fontSize: AppSizes.fsXl,
  //     fontWeight: FontWeight.w600,
  //     color: AppColors.darkPrimary,
  //   ),
  //   headlineSmall: GoogleFonts.afacad(
  //     fontSize: AppSizes.fsMd,
  //     fontWeight: FontWeight.w500,
  //     color: AppColors.darkPrimary,
  //   ),
  //   bodyLarge: GoogleFonts.afacad(
  //     fontSize: AppSizes.fsMd,
  //     fontWeight: FontWeight.w500,
  //     color: AppColors.darkPrimary,
  //   ),
  //   bodyMedium: GoogleFonts.afacad(
  //     fontSize: AppSizes.fsMd,
  //     fontWeight: FontWeight.w500,
  //     color: AppColors.darkPrimary,
  //   ),
  //   bodySmall: GoogleFonts.afacad(
  //     fontSize: AppSizes.fsMd,
  //     fontWeight: FontWeight.w500,
  //     color: AppColors.darkPrimary,
  //   ),
  //   titleLarge: GoogleFonts.afacad(
  //     fontSize: AppSizes.fsMd,
  //     fontWeight: FontWeight.normal,
  //     color: AppColors.darkSecondary,
  //   ),
  //   titleMedium: GoogleFonts.afacad(
  //     fontSize: AppSizes.fsSm,
  //     fontWeight: FontWeight.normal,
  //     color: AppColors.darkSecondary,
  //   ),
  //   titleSmall: GoogleFonts.afacad(
  //     fontSize: AppSizes.fsSm,
  //     fontWeight: FontWeight.normal,
  //     color: AppColors.darkSecondary,
  //   ),
  // );
}
