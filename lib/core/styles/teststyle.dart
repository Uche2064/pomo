import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Textstyle {
  Textstyle._();

  static final TextStyle textStyle = Get.textTheme.headlineSmall!
      .copyWith(color: Get.theme.colorScheme.onTertiary, fontSize: 15.h);
}
