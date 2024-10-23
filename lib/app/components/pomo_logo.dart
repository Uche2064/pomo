import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pomo/core/constant/image_strings.dart';

class PomoLogo extends StatelessWidget {
  const PomoLogo({
    this.height,
    super.key,
  });
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImageStrings.pomo,
      height: height ?? 30.h,
    );
  }
}
