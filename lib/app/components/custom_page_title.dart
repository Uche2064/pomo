import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pomo/core/styles/teststyle.dart';

class CustomPageTitle extends StatelessWidget {
  const CustomPageTitle({
    required this.title,
    super.key,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Textstyle.textStyle
          .copyWith(fontWeight: FontWeight.bold, fontSize: 20.h),
    );
  }
}
