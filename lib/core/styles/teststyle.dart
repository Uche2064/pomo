import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Textstyle {
  Textstyle._();

  static final TextStyle textStyle = Get.textTheme.headlineSmall!
      .copyWith(color: Get.theme.colorScheme.onTertiary, fontSize: 14);
}
