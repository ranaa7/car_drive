// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/validationform.dart';

class PhoneNumberFormField extends StatelessWidget {
  PhoneNumberFormField({super.key , required this.phone});
  var phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.w,
      child: TextFormField(
        controller: phone,
        validator: ValidationForm.nameValidator,
        decoration: InputDecoration(
          isDense: true,
          contentPadding:  EdgeInsets.symmetric(
              vertical: 6.h, horizontal: 0.1.w),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.r),
            borderSide:  const BorderSide(
              color: AppColors.red,
            ),
          ),
        ),
      ),
    );
  }
}
