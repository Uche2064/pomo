import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pomo/core/styles/teststyle.dart';

class PomoTaskTileDisplay extends StatelessWidget {
  const PomoTaskTileDisplay(
      {super.key,
      required this.title,
      required this.startHour,
      required this.endHour,
      required this.containerColor});

  final String title;
  final String startHour;
  final String endHour;
  final Color containerColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          Expanded(
              flex: 4,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  startHour,
                  style:
                      Textstyle.textStyle.copyWith(color: Colors.grey.shade700),
                ),
              )),
          Expanded(
              flex: 8,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
                decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.circular(12.h),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Textstyle.textStyle
                          .copyWith(fontSize: 20.h, color: Colors.white),
                    ),
                    Text(
                      '${startHour} - ${endHour}',
                      style: Textstyle.textStyle.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
