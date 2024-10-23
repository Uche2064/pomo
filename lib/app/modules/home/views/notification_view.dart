import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:pomo/app/components/custom_page_title.dart';
import 'package:pomo/app/components/custom_popup_menu.dart';
import 'package:pomo/app/modules/home/views/widgets/e_wallet_tile.dart';
import 'package:pomo/app/modules/home/views/widgets/error_tile.dart';
import 'package:pomo/app/modules/home/views/widgets/info_tile.dart';
import 'package:pomo/app/modules/home/views/widgets/success_tile.dart';
import 'package:pomo/core/global/strings.dart';
import 'package:pomo/core/styles/teststyle.dart';

class NotificationView extends GetView {
  const NotificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: CustomPageTitle(title: Strings.notifications),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.h),
              child: CustomPopupMenu(
                onTap: () {},
              ),
            )
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Today',
                        style: Textstyle.textStyle.copyWith(
                            fontSize: 18.h, fontWeight: FontWeight.w700),
                      ),
                      Gap(4.h),
                      SuccessTile(
                        subtitle: 'Congratulations!',
                        title: 'Success',
                      ),
                      ErrorTile(
                        title: 'Error',
                        subtitle: 'Something went wrong',
                      ),
                      ErrorTile(
                        title: 'Error',
                        subtitle: 'Something went wrong',
                      ),
                    ],
                  ),
                  Gap(4.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Yesterday',
                        style: Textstyle.textStyle.copyWith(
                            fontSize: 18.h, fontWeight: FontWeight.w700),
                      ),
                      Gap(4.h),
                      SuccessTile(
                        subtitle: 'Congratulations!',
                        title: 'Success',
                      ),
                    ],
                  ),
                  Gap(4.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'December, 11, 2024',
                        style: Textstyle.textStyle.copyWith(
                            fontSize: 18.h, fontWeight: FontWeight.w700),
                      ),
                      Gap(4.h),
                      SuccessTile(
                        subtitle: 'Congratulations!',
                        title: 'Success',
                      ),
                      ErrorTile(
                        title: 'Error',
                        subtitle: 'Something went wrong',
                      ),
                      InfoTile(
                        title: 'Info',
                        subtitle: 'Some dommy text',
                      ),
                      EWalletTile(title: "E-wallet", subtitle: "Some text")
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
