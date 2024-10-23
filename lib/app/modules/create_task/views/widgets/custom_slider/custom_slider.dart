import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider(
      {super.key, required this.value, this.max, this.min, this.onChanged});
  final int value;
  final dynamic max, min;
  final void Function(dynamic)? onChanged;
  @override
  Widget build(BuildContext context) {
    return SfSlider(
      value: value,
      max: max,
      min: min,
      inactiveColor: Get.theme.colorScheme.outline,
      enableTooltip: true,
      showLabels: true,
      onChanged: onChanged,
    );
  }
}
