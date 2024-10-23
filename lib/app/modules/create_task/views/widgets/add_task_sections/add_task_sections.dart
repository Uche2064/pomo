import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pomo/core/styles/teststyle.dart';

class AddTaskSections extends StatelessWidget {
  const AddTaskSections({super.key, this.sectionTitle, required this.child});
  final String? sectionTitle;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (sectionTitle != null)
          Text(
            sectionTitle ?? "",
            style: Textstyle.textStyle.copyWith(fontSize: 18.h),
          ),
        Gap(8.h),
        child,
      ],
    );
  }
}
