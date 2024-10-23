import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pomo/core/styles/teststyle.dart';

class CustomSeperator extends StatelessWidget {
  const CustomSeperator({
    super.key,
    this.middleText,
  });
  final String? middleText;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Divider(
          color: Colors.grey.shade400,
          thickness: 0.8,
        )),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: Text(
            middleText ?? '',
            style: Textstyle.textStyle.copyWith(
              fontSize: 16.h,
            ),
          ),
        ),
        Expanded(
            child: Divider(
          color: Colors.grey.shade400,
          thickness: 0.8,
        )),
      ],
    );
  }
}
