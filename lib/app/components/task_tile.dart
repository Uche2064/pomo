import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pomo/core/styles/teststyle.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.suffixIcon,
    required this.prefixIcon,
    required this.title,
    required this.subtitle,
    this.onTap,
  });
  final Widget suffixIcon, prefixIcon;
  final String title, subtitle;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.h),
          color: Colors.grey.shade50,
          border: Border.all(
            width: 1,
            color: Colors.grey.shade200,
          )),
      child: ListTile(
        onTap: onTap,
        leading: prefixIcon,
        title: Text(
          title,
          style: Textstyle.textStyle.copyWith(fontSize: 16.h),
        ),
        subtitle: Text(
          subtitle,
          style:
              Textstyle.textStyle.copyWith(fontSize: 14.h, color: Colors.grey),
        ),
        trailing: suffixIcon,
      ),
    );
  }
}
