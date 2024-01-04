// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:more_2_drive/config/style/app_colors.dart';

class PhoneFormfield extends StatelessWidget {
  PhoneFormfield({super.key , required this.phone});

  var phone = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: phone ,
      dropdownDecoration:
      const BoxDecoration(color: AppColors.white),
      focusNode: FocusNode(),
      decoration: InputDecoration(
        isDense: true,
        contentPadding:  EdgeInsets.symmetric(
            vertical: 5.h, horizontal: 3.w),
        // labelText: 'Phone Number',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            7.r,
          ),
          borderSide: const BorderSide(
            color: AppColors.red,
          ),
        ),
      ),
      initialCountryCode: 'EG',
      onChanged: (phone) {
        print(phone.completeNumber);
      },
    );
  }
}
