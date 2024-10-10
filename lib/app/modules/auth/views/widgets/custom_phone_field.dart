import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pomo/core/global/strings.dart';
import 'package:pomo/core/styles/app_sizes.dart';
import 'package:pomo/core/styles/teststyle.dart';
import 'package:pomo/utils/validators.dart';

class CustomPhoneField extends StatelessWidget {
  const CustomPhoneField({
    super.key,
    required Locale? locale,
  }) : _locale = locale;

  final Locale? _locale;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      pickerDialogStyle: PickerDialogStyle(
        backgroundColor: Colors.grey.shade500,
        padding: EdgeInsets.all(16.sp),
        countryCodeStyle: Textstyle.textStyle.copyWith(
          fontSize: 14.sp,
        ),
        countryNameStyle: Textstyle.textStyle.copyWith(
          fontSize: 14.sp,
        ),
        searchFieldInputDecoration: InputDecoration(
          hintText: Strings.searchCountry,
          hintStyle: Textstyle.textStyle.copyWith(
            fontSize: 14.sp,
          ),
          suffixIcon: Icon(Icons.search),
        ),
      ),
      dropdownTextStyle: Textstyle.textStyle.copyWith(
        fontSize: 14.sp,
      ),
      style: Textstyle.textStyle.copyWith(fontSize: 14.sp),
      validator: (phoneNumber) =>
          Validators.validatePhoneNumber(phoneNumber!.completeNumber),
      decoration: InputDecoration(
        hintText: Strings.phoneNumber,
        hintStyle: Textstyle.textStyle.copyWith(
          color: Colors.grey.shade400,
          fontSize: AppSizes.fsXl,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppSizes.borderMd,
          ),
          borderSide: BorderSide(
            color: Get.theme.colorScheme.onPrimary,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppSizes.borderMd,
          ),
          borderSide: BorderSide(
            color: Get.theme.colorScheme.primary,
          ),
        ),
        border: InputBorder.none,
        errorStyle: Textstyle.textStyle.copyWith(
          color: Get.theme.colorScheme.error,
          fontSize: AppSizes.fsMd,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppSizes.borderMd,
          ),
          borderSide: BorderSide(
            color: Get.theme.colorScheme.error,
          ),
        ),
      ),
      initialCountryCode: _locale!.countryCode,
      keyboardType: TextInputType.numberWithOptions(),
      onChanged: (phone) {
        printInfo(info: phone.completeNumber);
      },
    );
  }
}
