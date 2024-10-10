import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pomo/app/modules/auth/views/create_new_password_view.dart';
import 'package:pomo/app/views/fill_profile_view.dart';
import 'package:pomo/app/modules/auth/views/forgot_password_view.dart';
import 'package:pomo/app/modules/auth/views/otp_view.dart';
import 'package:pomo/app/modules/auth/views/signin_view.dart';
import 'package:pomo/core/global/translations/app_translation.dart';
import 'package:pomo/core/themes/dark_theme.dart';
import 'package:pomo/core/themes/light_theme.dart';

import 'app/routes/app_pages.dart';

void main() {
  GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 860),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          locale: Get.deviceLocale,
          translationsKeys: AppTranslation.translationKeys,
          fallbackLocale: Locale("en", "US"),
          defaultTransition: Transition.noTransition,
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          title: "Application",
          getPages: AppPages.routes,
          home: CreateNewPasswordView(),
        );
      },
    );
  }
}
